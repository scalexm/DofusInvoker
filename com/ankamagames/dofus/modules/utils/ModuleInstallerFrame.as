package com.ankamagames.dofus.modules.utils
{
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.utils.ModuleInspector;
   import com.ankamagames.dofus.logic.connection.frames.AuthentificationFrame;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.modules.utils.actions.InstalledModuleInfoRequestAction;
   import com.ankamagames.dofus.modules.utils.actions.InstalledModuleListRequestAction;
   import com.ankamagames.dofus.modules.utils.actions.ModuleDeleteRequestAction;
   import com.ankamagames.dofus.modules.utils.actions.ModuleInstallCancelAction;
   import com.ankamagames.dofus.modules.utils.actions.ModuleInstallConfirmAction;
   import com.ankamagames.dofus.modules.utils.actions.ModuleInstallRequestAction;
   import com.ankamagames.dofus.modules.utils.actions.ModuleListRequestAction;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.LangManager;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.resources.events.ResourceErrorEvent;
   import com.ankamagames.jerakine.resources.events.ResourceLoadedEvent;
   import com.ankamagames.jerakine.resources.loaders.IResourceLoader;
   import com.ankamagames.jerakine.resources.loaders.ResourceLoaderFactory;
   import com.ankamagames.jerakine.resources.loaders.ResourceLoaderType;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.jerakine.types.enums.Priority;
   import com.ankamagames.jerakine.utils.crypto.CRC32;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import nochump.util.zip.ZipEntry;
   import nochump.util.zip.ZipFile;
   
   public class ModuleInstallerFrame implements Frame
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(AuthentificationFrame));
      
      private static const _priority:int = Priority.NORMAL;
       
      
      private var _loader:IResourceLoader;
      
      private var _contextLoader:LoaderContext;
      
      private var _modulesDirectory:File;
      
      private var _pendingZipToInstall:ZipFile;
      
      private var _pendingZipDm:XML;
      
      private var _installedModuleDm:Dictionary;
      
      public function ModuleInstallerFrame()
      {
         this._installedModuleDm = new Dictionary();
         super();
      }
      
      public function pushed() : Boolean
      {
         this._contextLoader = new LoaderContext();
         this._contextLoader.checkPolicyFile = true;
         this._loader = ResourceLoaderFactory.getLoader(ResourceLoaderType.SERIAL_LOADER);
         this._loader.addEventListener(ResourceErrorEvent.ERROR,this.onLoadError);
         this._loader.addEventListener(ResourceLoadedEvent.LOADED,this.onLoad);
         var uiRoot:String = LangManager.getInstance().getEntry("config.mod.path");
         if(uiRoot.substr(0,2) != "\\\\" && uiRoot.substr(1,2) != ":/")
         {
            this._modulesDirectory = new File(File.applicationDirectory.nativePath + File.separator + uiRoot);
         }
         else
         {
            this._modulesDirectory = new File(uiRoot);
         }
         return true;
      }
      
      public function pulled() : Boolean
      {
         this._loader.removeEventListener(ResourceErrorEvent.ERROR,this.onLoadError);
         this._loader.removeEventListener(ResourceLoadedEvent.LOADED,this.onLoad);
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         var moduleListUri:Uri = null;
         var moduleZipUri:Uri = null;
         var moduleId:String = null;
         var dmFile:XML = null;
         var scriptFile:File = null;
         var fs:FileStream = null;
         var swfContent:ByteArray = null;
         var hooksApis:* = undefined;
         switch(true)
         {
            case msg is ModuleListRequestAction:
               moduleListUri = new Uri(ModuleListRequestAction(msg).moduleListUrl);
               moduleListUri.loaderContext = this._contextLoader;
               this._loader.load(moduleListUri);
               return true;
            case msg is ModuleInstallRequestAction:
               moduleZipUri = new Uri(ModuleInstallRequestAction(msg).moduleUrl);
               moduleZipUri.loaderContext = this._contextLoader;
               this._loader.load(moduleZipUri);
               return true;
            case msg is ModuleDeleteRequestAction:
               this.deleteModule(ModuleDeleteRequestAction(msg).moduleDirectory);
               return true;
            case msg is InstalledModuleListRequestAction:
               this.searchInstalledModule();
               return true;
            case msg is InstalledModuleInfoRequestAction:
               moduleId = InstalledModuleInfoRequestAction(msg).moduleId;
               dmFile = this._installedModuleDm[moduleId];
               if(!dmFile)
               {
                  dmFile = ModuleInspector.getDmFile(new File(this._modulesDirectory.nativePath + File.separator + moduleId));
                  this._installedModuleDm[moduleId] = dmFile;
                  if(!dmFile)
                  {
                     KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,7);
                     break;
                  }
               }
               scriptFile = new File(this._modulesDirectory.nativePath + File.separator + moduleId + File.separator + dmFile.script);
               fs = new FileStream();
               swfContent = new ByteArray();
               fs.open(scriptFile,FileMode.READ);
               fs.readBytes(swfContent);
               fs.close();
               hooksApis = ModuleInspector.getScriptHookAndApis(swfContent);
               KernelEventsManager.getInstance().processCallback(HookList.ApisHooksList,hooksApis);
               return true;
            case msg is ModuleInstallConfirmAction:
               if(ModuleInstallConfirmAction(msg).isUpdate)
               {
                  this.updateModule();
               }
               else
               {
                  this.installModule();
               }
               this._pendingZipToInstall = null;
               this._pendingZipDm = null;
               return true;
            case msg is ModuleInstallCancelAction:
               this._pendingZipToInstall = null;
               this._pendingZipDm = null;
               KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationProgress,-1);
               return true;
         }
         return false;
      }
      
      public function get priority() : int
      {
         return _priority;
      }
      
      private function onLoad(e:ResourceLoadedEvent) : void
      {
         var jsonArray:* = undefined;
         switch(e.uri.fileType.toLowerCase())
         {
            case "json":
               jsonArray = com.ankamagames.jerakine.json.JSON.decode(e.resource,true);
               if(jsonArray is Array)
               {
                  this.processJsonList(jsonArray);
                  break;
               }
               KernelEventsManager.getInstance().processCallback(HookList.ModuleList,[]);
               break;
            case "zip":
               this._pendingZipToInstall = e.resource;
               this.getZippedModuleInformations(e.resource);
               break;
            default:
               KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,2);
         }
      }
      
      private function processJsonList(jsonArray:*) : void
      {
         var moduleEntry:* = undefined;
         var dmVersionArray:Array = null;
         var entryVersionArray:Array = null;
         var i:int = 0;
         var moduleDm:XML = null;
         for each(moduleEntry in jsonArray)
         {
            moduleDm = this._installedModuleDm[moduleEntry.author + "_" + moduleEntry.name];
            if(moduleDm)
            {
               moduleEntry.exist = true;
               moduleEntry.upToDate = true;
               dmVersionArray = String(moduleDm.header.version).split(".");
               for(entryVersionArray = String(moduleEntry.version).split("."); dmVersionArray.length < entryVersionArray.length; )
               {
                  dmVersionArray.push(0);
               }
               while(dmVersionArray.length > entryVersionArray.length)
               {
                  entryVersionArray.push(0);
               }
               for(i = 0; i < dmVersionArray.length; )
               {
                  if(dmVersionArray[i] < entryVersionArray[i])
                  {
                     moduleEntry.upToDate = false;
                  }
                  i++;
               }
               moduleEntry.isEnabled = moduleDm.header.isEnabled;
            }
            else
            {
               moduleEntry.exist = false;
            }
         }
         KernelEventsManager.getInstance().processCallback(HookList.ModuleList,jsonArray);
      }
      
      private function getZippedModuleInformations(zipFile:ZipFile) : void
      {
         var entry:ZipEntry = null;
         var rawData:ByteArray = null;
         var hooksApis:* = undefined;
         var dmData:XML = ModuleInspector.getZipDmFile(zipFile);
         if(!dmData || !ModuleInspector.checkArchiveValidity(zipFile))
         {
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,3);
            return;
         }
         this._pendingZipDm = dmData;
         var scriptName:String = dmData.script;
         for each(entry in zipFile.entries)
         {
            if(entry.name == scriptName)
            {
               rawData = zipFile.getInput(entry);
               break;
            }
         }
         if(rawData)
         {
            hooksApis = ModuleInspector.getScriptHookAndApis(rawData);
            KernelEventsManager.getInstance().processCallback(HookList.ApisHooksList,hooksApis);
         }
         else
         {
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,3);
         }
      }
      
      private function installModule() : void
      {
         var entry:ZipEntry = null;
         var unzipedFile:File = null;
         if(!this._pendingZipDm || !this._pendingZipToInstall)
         {
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,6);
            return;
         }
         var instalModuleDirectory:File = new File(this._modulesDirectory.nativePath + File.separator + this._pendingZipDm.header.author + "_" + this._pendingZipDm.header.name);
         instalModuleDirectory.createDirectory();
         var fileNumber:int = this._pendingZipToInstall.entries.length;
         var totalTreatedFile:int = 0;
         for each(entry in this._pendingZipToInstall.entries)
         {
            totalTreatedFile++;
            unzipedFile = new File(instalModuleDirectory.nativePath + File.separator + entry.name);
            if(!unzipedFile.exists)
            {
               if(entry.isDirectory())
               {
                  unzipedFile.createDirectory();
               }
               else
               {
                  this.writeZipEntry(null,entry,null,unzipedFile,this._pendingZipToInstall);
               }
               continue;
            }
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,6);
            return;
         }
         if(totalTreatedFile == fileNumber)
         {
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationProgress,1);
         }
         else
         {
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,6);
         }
         this._installedModuleDm[this._pendingZipDm.header.author + "_" + this._pendingZipDm.header.name] = this._pendingZipDm;
      }
      
      private function updateModule() : void
      {
         var entry:ZipEntry = null;
         var readStream:FileStream = null;
         var unzipedFile:File = null;
         var buffer:ByteArray = null;
         var fileCrcValue:uint = 0;
         var fileCrc:CRC32 = new CRC32();
         if(!this._pendingZipDm || !this._pendingZipToInstall)
         {
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,3);
            return;
         }
         var updateModuleDirectory:File = new File(this._modulesDirectory.nativePath + File.separator + this._pendingZipDm.header.author + "_" + this._pendingZipDm.header.name);
         if(!updateModuleDirectory.exists)
         {
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationProgress,4);
         }
         var fileNumber:int = this._pendingZipToInstall.entries.length;
         var totalTreatedFile:int = 0;
         for each(entry in this._pendingZipToInstall.entries)
         {
            totalTreatedFile++;
            unzipedFile = new File(updateModuleDirectory.nativePath + File.separator + entry.name);
            if(!unzipedFile.exists)
            {
               if(entry.isDirectory())
               {
                  unzipedFile.createDirectory();
               }
               else
               {
                  this.writeZipEntry(null,entry,null,unzipedFile,this._pendingZipToInstall);
               }
            }
            else if(!entry.isDirectory())
            {
               buffer = new ByteArray();
               readStream = new FileStream();
               readStream.open(unzipedFile,FileMode.READ);
               readStream.readBytes(buffer,0,readStream.bytesAvailable);
               readStream.close();
               fileCrc.update(buffer,0,buffer.bytesAvailable);
               fileCrcValue = fileCrc.getValue();
               if(fileCrcValue != entry.crc)
               {
                  unzipedFile.deleteFile();
                  this.writeZipEntry(null,entry,null,unzipedFile,this._pendingZipToInstall);
               }
            }
         }
         if(totalTreatedFile == fileNumber)
         {
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationProgress,1);
         }
         else
         {
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,3);
         }
      }
      
      private function writeZipEntry(unzipedData:ByteArray, entry:ZipEntry, writeStream:FileStream, unzipedFile:File, zipFile:ZipFile) : void
      {
         unzipedData = zipFile.getInput(entry);
         writeStream = new FileStream();
         writeStream.open(unzipedFile,FileMode.WRITE);
         writeStream.writeBytes(unzipedData,0,unzipedData.bytesAvailable);
         writeStream.close();
      }
      
      private function deleteModule(directoryName:String) : void
      {
         var toDelete:File = new File(this._modulesDirectory.nativePath + File.separator + directoryName);
         if(!toDelete.exists)
         {
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,5);
         }
         else
         {
            toDelete.deleteDirectory(true);
            KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationProgress,-1);
         }
         this._installedModuleDm[directoryName] = null;
      }
      
      private function searchInstalledModule() : void
      {
         var subDir:File = null;
         var dmContent:XML = null;
         var isTrusted:Boolean = false;
         var rootFile:File = this._modulesDirectory;
         var allModulesDm:XML = <Root></Root>;
         for each(subDir in rootFile.getDirectoryListing())
         {
            if(subDir.isDirectory)
            {
               dmContent = ModuleInspector.getDmFile(subDir);
               if(dmContent)
               {
                  isTrusted = ModuleInspector.checkIfModuleTrusted(subDir.nativePath + File.separator + dmContent.script);
                  dmContent.header.isTrusted = isTrusted;
                  dmContent.header.isEnabled = ModuleInspector.isModuleEnabled(subDir.name,isTrusted);
                  this._installedModuleDm[subDir.name] = dmContent;
                  allModulesDm.appendChild(dmContent.header);
               }
            }
         }
         KernelEventsManager.getInstance().processCallback(HookList.InstalledModuleList,allModulesDm.toXMLString());
      }
      
      private function onLoadError(e:ResourceErrorEvent) : void
      {
         _log.error("Cannot load file " + e.uri + "(" + e.errorMsg + ")");
         switch(e.uri.fileType.toLowerCase())
         {
            case "json":
               KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,1);
               break;
            case "zip":
               KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,8);
               break;
            default:
               KernelEventsManager.getInstance().processCallback(HookList.ModuleInstallationError,0);
         }
      }
   }
}
