package com.ankamagames.berilia.utils
{
   import com.ankamagames.berilia.BeriliaConstants;
   import com.ankamagames.jerakine.managers.StoreDataManager;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   import org.as3commons.bytecode.abc.AbcFile;
   import org.as3commons.bytecode.abc.ClassInfo;
   import org.as3commons.bytecode.swf.SWFFile;
   import org.as3commons.bytecode.swf.SWFFileIO;
   import org.as3commons.bytecode.tags.DoABCTag;
   import org.as3commons.bytecode.tags.FileAttributesTag;
   
   public class ModuleInspector
   {
      
      public static const whiteList:Array = new Array("dm","swf","xml","txt","png","jpg","css");
       
      
      public function ModuleInspector()
      {
         super();
      }
      
      public static function checkArchiveValidity(archive:ZipFile) : Boolean
      {
         var entry:ZipEntry = null;
         var dotIndex:int = 0;
         var fileType:String = null;
         var totalSize:int = 0;
         for each(entry in archive.entries)
         {
            dotIndex = entry.name.lastIndexOf(".");
            fileType = entry.name.substring(dotIndex + 1);
            if(!entry.isDirectory() && whiteList.indexOf(fileType) == -1)
            {
               return false;
            }
            totalSize = totalSize + entry.size;
         }
         return totalSize < ModuleFileManager.MAX_FILE_SIZE && archive.size < ModuleFileManager.MAX_FILE_NUM;
      }
      
      public static function getDmFile(targetFile:File) : XML
      {
         var entry:File = null;
         var dmData:XML = null;
         var rfs:FileStream = null;
         var rawData:ByteArray = new ByteArray();
         if(targetFile.exists)
         {
            for each(entry in targetFile.getDirectoryListing())
            {
               if(!entry.isDirectory)
               {
                  if(entry.type == ".dm")
                  {
                     if(entry.name.lastIndexOf("/") != -1)
                     {
                        return null;
                     }
                     rfs = new FileStream();
                     rfs.open(File(entry),FileMode.READ);
                     rfs.readBytes(rawData,0,rfs.bytesAvailable);
                     rfs.close();
                     dmData = new XML(rawData.readUTFBytes(rawData.bytesAvailable));
                     return dmData;
                  }
               }
            }
         }
         return null;
      }
      
      public static function getZipDmFile(targetFile:ZipFile) : XML
      {
         var entry:ZipEntry = null;
         var dmData:XML = null;
         var dotIndex:int = 0;
         var fileType:String = null;
         var rawData:ByteArray = new ByteArray();
         for each(entry in targetFile.entries)
         {
            if(!entry.isDirectory())
            {
               dotIndex = entry.name.lastIndexOf(".");
               fileType = entry.name.substring(dotIndex + 1);
               if(fileType.toLowerCase() == "dm")
               {
                  if(entry.name.lastIndexOf("/") != -1)
                  {
                     return null;
                  }
                  rawData = ZipFile(targetFile).getInput(entry);
                  dmData = new XML(rawData.readUTFBytes(rawData.bytesAvailable));
                  return dmData;
               }
            }
         }
         return null;
      }
      
      public static function isModuleEnabled(moduleId:String, trusted:Boolean) : Boolean
      {
         var enable:Boolean = false;
         var state:* = StoreDataManager.getInstance().getData(BeriliaConstants.DATASTORE_MOD,moduleId);
         if(state == null)
         {
            enable = trusted;
         }
         else
         {
            enable = state || trusted;
         }
         return enable;
      }
      
      public static function checkIfModuleTrusted(filePath:String) : Boolean
      {
         return true;
      }
      
      public static function getScriptHookAndApis(swfContent:ByteArray) : Object
      {
         var tag:DoABCTag = null;
         var abcFile:AbcFile = null;
         var infos:ClassInfo = null;
         var attributesTag:FileAttributesTag = null;
         var fileAttributesTags:Array = null;
         var apiHookAction:* = new Object();
         var io:SWFFileIO = new SWFFileIO();
         var swfFile:SWFFile = io.read(swfContent);
         apiHookAction.apis = new Array();
         apiHookAction.hooks = new Array();
         for each(tag in swfFile.getTagsByType(DoABCTag))
         {
            abcFile = tag.abcFile;
            for each(infos in abcFile.classInfo)
            {
               switch(infos.classMultiname.nameSpace.name)
               {
                  case "d2hooks":
                     apiHookAction.hooks.push(infos.classMultiname.name);
                     continue;
                  case "d2api":
                     apiHookAction.apis.push(infos.classMultiname.name);
                     continue;
                  default:
                     continue;
               }
            }
         }
         fileAttributesTags = swfFile.getTagsByType(FileAttributesTag);
         for each(attributesTag in fileAttributesTags)
         {
            apiHookAction.useNetwork = attributesTag.useNetwork;
         }
         return apiHookAction;
      }
   }
}
