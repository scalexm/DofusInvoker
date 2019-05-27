package org.as3commons.bytecode.util
{
   import avmplus.getQualifiedClassName;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.getDefinitionByName;
   import org.as3commons.bytecode.abc.AbcFile;
   import org.as3commons.bytecode.abc.ClassInfo;
   import org.as3commons.bytecode.abc.ConstantPool;
   import org.as3commons.bytecode.abc.IConstantPool;
   import org.as3commons.bytecode.abc.InstanceInfo;
   import org.as3commons.bytecode.as3commons_bytecode;
   import org.as3commons.bytecode.swf.SWFFile;
   import org.as3commons.bytecode.tags.DoABCTag;
   import org.as3commons.lang.ICloneable;
   
   public final class AbcFileUtil
   {
      
      private static const SWF_HEADER:Array = [70,87,83,10,255,255,255,255,120,0,3,232,0,0,11,184,0,0,12,1,0,68,17,8,0,0,0];
      
      private static const ABC_HEADER:Array = [63,18];
      
      private static var SWF_FOOTER:Array = [64,0,0,0];
      
      private static const INSTANCE_INITIALIZER_QNAME:String = "{instance initializer (constructor?)}";
      
      private static const PERIOD:String = ".";
       
      
      public function AbcFileUtil()
      {
         super();
      }
      
      public static function mergeAbcFilesInSWFFile(swf:SWFFile) : void
      {
         var tag:DoABCTag = null;
         var idx:int = 0;
         var abcTags:Array = swf.getTagsByType(DoABCTag);
         if(abcTags.length < 2)
         {
            return;
         }
         var len:uint = abcTags.length;
         for(var i:uint = 1; i < len; i++)
         {
            idx = swf.tags.indexOf(abcTags[i]);
            if(idx > -1)
            {
               swf.tags.splice(idx,1);
            }
         }
         var abcFiles:Array = [];
         for each(tag in abcTags)
         {
            abcFiles[abcFiles.length] = tag.abcFile;
         }
         DoABCTag(abcTags[0]).abcFile = mergeMultipleAbcFiles(abcFiles);
      }
      
      public static function mergeMultipleAbcFiles(files:Array) : AbcFile
      {
         if(!files || files.length == 0)
         {
            return null;
         }
         if(files.length == 1)
         {
            return files[0];
         }
         var abc:AbcFile = new AbcFile();
         var len:uint = files.length;
         for(var i:uint = 0; i < len; i++)
         {
            abc = mergeAbcFiles(abc,files[i]);
         }
         return abc;
      }
      
      public static function mergeAbcFiles(file1:AbcFile, file2:AbcFile) : AbcFile
      {
         var result:AbcFile = new AbcFile();
         result.majorVersion = file1.majorVersion;
         result.minorVersion = file1.minorVersion;
         result.constantPool = mergeConstantPools(file1.constantPool,file2.constantPool);
         result.as3commons_bytecode::setClassInfo(file1.classInfo.concat(file2.classInfo));
         result.as3commons_bytecode::setInstanceInfo(file1.instanceInfo.concat(file2.instanceInfo));
         result.as3commons_bytecode::setMetadataInfo(file1.metadataInfo.concat(file2.metadataInfo));
         result.as3commons_bytecode::setMethodBodies(file1.methodBodies.concat(file2.methodBodies));
         result.as3commons_bytecode::setMethodInfo(file1.methodInfo.concat(file2.methodInfo));
         result.as3commons_bytecode::setScriptInfo(file1.scriptInfo.concat(file2.scriptInfo));
         return result;
      }
      
      public static function mergeConstantPools(pool1:IConstantPool, pool2:IConstantPool) : IConstantPool
      {
         var nr:Number = NaN;
         var i:int = 0;
         var s:String = null;
         var u:uint = 0;
         var result:ConstantPool = new ConstantPool();
         result.as3commons_bytecode::setDoublePool(pool1.doublePool.concat([]));
         for each(nr in pool2.doublePool)
         {
            if(result.doublePool.indexOf(nr) < 0)
            {
               result.doublePool[result.doublePool.length] = nr;
            }
         }
         result.as3commons_bytecode::setIntegerPool(pool1.integerPool.concat([]));
         for each(i in pool2.integerPool)
         {
            if(result.integerPool.indexOf(i) < 0)
            {
               result.integerPool[result.integerPool.length] = i;
            }
         }
         result.as3commons_bytecode::setMultinamePool(pool1.multinamePool.concat(pool2.multinamePool));
         result.as3commons_bytecode::setNamespacePool(pool1.namespacePool.concat(pool2.namespacePool));
         result.as3commons_bytecode::setNamespaceSetPool(pool1.namespaceSetPool.concat(pool2.namespaceSetPool));
         result.as3commons_bytecode::setStringPool(pool1.stringPool.concat([]));
         for each(s in pool2.stringPool)
         {
            if(result.stringPool.indexOf(s) < 0)
            {
               result.stringPool[result.stringPool.length] = s;
            }
         }
         result.as3commons_bytecode::setUintPool(pool1.uintPool.concat([]));
         for each(u in pool2.uintPool)
         {
            if(result.uintPool.indexOf(u) < 0)
            {
               result.uintPool[result.uintPool.length] = u;
            }
         }
         return result;
      }
      
      public static function getClassinfoByFullyQualifiedName(abcFile:AbcFile, fullName:String) : ClassInfo
      {
         var classInfo:ClassInfo = null;
         fullName = normalizeFullName(fullName);
         for each(classInfo in abcFile.classInfo)
         {
            if(classInfo.classMultiname.fullName == fullName)
            {
               return classInfo;
            }
         }
         return null;
      }
      
      public static function getInstanceinfoByFullyQualifiedName(abcFile:AbcFile, fullName:String) : InstanceInfo
      {
         var instanceInfo:InstanceInfo = null;
         fullName = normalizeFullName(fullName);
         for each(instanceInfo in abcFile.instanceInfo)
         {
            if(instanceInfo.classMultiname.fullName == fullName)
            {
               return instanceInfo;
            }
         }
         return null;
      }
      
      public static function normalizeFullName(fullName:String) : String
      {
         return fullName.replace(MultinameUtil.DOUBLE_COLON_REGEXP,PERIOD);
      }
      
      public static function wrapBytecodeInSWF(arrayOfAbcByteCodeBlocks:Array) : ByteArray
      {
         var swfHeaderByte:int = 0;
         var abcByteCodeBlock:ByteArray = null;
         var swfFooterByte:int = 0;
         var abcHeaderByte:int = 0;
         var outputStream:ByteArray = new ByteArray();
         outputStream.endian = Endian.LITTLE_ENDIAN;
         for each(swfHeaderByte in SWF_HEADER)
         {
            outputStream.writeByte(swfHeaderByte);
         }
         for each(abcByteCodeBlock in arrayOfAbcByteCodeBlocks)
         {
            for each(abcHeaderByte in ABC_HEADER)
            {
               outputStream.writeByte(abcHeaderByte);
            }
            outputStream.writeInt(abcByteCodeBlock.length);
            outputStream.writeBytes(abcByteCodeBlock);
         }
         for each(swfFooterByte in SWF_FOOTER)
         {
            outputStream.writeByte(swfFooterByte);
         }
         outputStream.position = 4;
         outputStream.writeInt(outputStream.length);
         outputStream.position = 0;
         return outputStream;
      }
      
      public static function cloneVector(cloneables:*) : *
      {
         var cloneable:ICloneable = null;
         var className:String = getQualifiedClassName(cloneables);
         var cls:Class = getDefinitionByName(className) as Class;
         var clone:* = new cls();
         for each(cloneable in cloneables)
         {
            clone[clone.length] = cloneable.clone();
         }
         return clone;
      }
   }
}
