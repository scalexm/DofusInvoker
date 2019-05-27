package org.as3commons.bytecode.abc
{
   import flash.utils.Dictionary;
   import org.as3commons.bytecode.as3commons_bytecode;
   import org.as3commons.bytecode.emit.asm.ClassInfoReference;
   import org.as3commons.bytecode.typeinfo.Metadata;
   
   public final class AbcFile
   {
      
      private static const TAB_CHAR:String = "\t";
      
      private static const NL_LF_CHARS:String = "\n\t";
      
      private static const NEWLINE_CHAR:String = "\n";
      
      private static const TOSTRING_TEMPLATE:String = "Method Signatures (MethodInfo):";
       
      
      private var _classNameLookup:Dictionary;
      
      private var _methodInfo:Vector.<MethodInfo>;
      
      private var _metadataInfo:Vector.<Metadata>;
      
      private var _instanceInfo:Vector.<InstanceInfo>;
      
      private var _scriptInfo:Vector.<ScriptInfo>;
      
      private var _methodBodies:Vector.<MethodBody>;
      
      public var minorVersion:int;
      
      public var majorVersion:int;
      
      public var constantPool:IConstantPool;
      
      public function AbcFile()
      {
         super();
         this.constantPool = new ConstantPool();
         this._classNameLookup = new Dictionary();
         this._methodInfo = new Vector.<MethodInfo>();
         this._metadataInfo = new Vector.<Metadata>();
         this._instanceInfo = new Vector.<InstanceInfo>();
         this._scriptInfo = new Vector.<ScriptInfo>();
         this._methodBodies = new Vector.<MethodBody>();
      }
      
      public function addClassInfoReference(classInfoReference:ClassInfoReference) : int
      {
         var classInfo:ClassInfo = null;
         var idx:int = 0;
         for each(classInfo in this.constantPool.classInfo)
         {
            if(classInfo.classMultiname.equals(classInfoReference.classMultiName))
            {
               return idx;
            }
            idx++;
         }
         return -1;
      }
      
      public function addClassInfo(classInfo:ClassInfo) : int
      {
         return this.addUniquely(classInfo,this.constantPool.classInfo);
      }
      
      public function addClassInfos(classInfos:Array) : void
      {
         this.addCollection(this.addClassInfo,classInfos);
      }
      
      public function addMetadataInfo(metadata:Metadata) : int
      {
         return this.addUniquely(metadata,this._metadataInfo);
      }
      
      public function addMetadataInfos(metadatas:Array) : void
      {
         this.addCollection(this.addMetadataInfo,metadatas);
      }
      
      public function addMethodInfo(methodInfo:MethodInfo) : int
      {
         return this.addUniquely(methodInfo,this._methodInfo);
      }
      
      public function addMethodInfos(methodInfos:Array) : void
      {
         this.addCollection(this.addMethodInfo,this.methodInfo);
      }
      
      public function addUniquely(itemToAdd:Object, collectionToAddTo:*) : int
      {
         var indexOfItem:int = collectionToAddTo.indexOf(itemToAdd);
         if(indexOfItem == -1)
         {
            indexOfItem = collectionToAddTo.push(itemToAdd) - 1;
         }
         return indexOfItem;
      }
      
      public function addInstanceInfo(instanceInfo:InstanceInfo) : int
      {
         var name:BaseMultiname = null;
         this._classNameLookup[instanceInfo.classMultiname.fullName] = true;
         this.constantPool.addMultiname(instanceInfo.classMultiname);
         for each(name in instanceInfo.interfaceMultinames)
         {
            this.constantPool.addMultiname(name);
         }
         if(instanceInfo.isProtected)
         {
            this.constantPool.addNamespace(instanceInfo.protectedNamespace);
         }
         this.constantPool.addMultiname(instanceInfo.superclassMultiname);
         this.addMethodInfo(instanceInfo.instanceInitializer);
         if(instanceInfo.instanceInitializer.methodBody != null)
         {
            this.addMethodBody(instanceInfo.instanceInitializer.methodBody);
         }
         return this.addUniquely(instanceInfo,this._instanceInfo);
      }
      
      public function containsClass(className:String) : Boolean
      {
         return this._classNameLookup[className] == true;
      }
      
      public function addInstanceInfos(instanceInfos:Array) : void
      {
         this.addCollection(this.addInstanceInfo,instanceInfos);
      }
      
      public function addScriptInfo(scriptInfo:ScriptInfo) : int
      {
         return this.addUniquely(scriptInfo,this._scriptInfo);
      }
      
      public function addScriptInfos(scriptInfos:Array) : void
      {
         this.addCollection(this.addScriptInfo,scriptInfos);
      }
      
      public function addMethodBody(methodBody:MethodBody) : int
      {
         return this.addUniquely(methodBody,this._methodBodies);
      }
      
      public function get metadataInfo() : Vector.<Metadata>
      {
         return this._metadataInfo;
      }
      
      as3commons_bytecode function setMetadataInfo(value:Vector.<Metadata>) : void
      {
         this._metadataInfo = value;
      }
      
      public function get methodInfo() : Vector.<MethodInfo>
      {
         return this._methodInfo;
      }
      
      as3commons_bytecode function setMethodInfo(value:Vector.<MethodInfo>) : void
      {
         this._methodInfo = value;
      }
      
      public function get instanceInfo() : Vector.<InstanceInfo>
      {
         return this._instanceInfo;
      }
      
      as3commons_bytecode function setInstanceInfo(value:Vector.<InstanceInfo>) : void
      {
         this._instanceInfo = value;
      }
      
      public function get classInfo() : Vector.<ClassInfo>
      {
         return this.constantPool.classInfo;
      }
      
      as3commons_bytecode function setClassInfo(value:Array) : void
      {
         this.constantPool.as3commons_bytecode::setClassInfo(value);
      }
      
      public function get scriptInfo() : Vector.<ScriptInfo>
      {
         return this._scriptInfo;
      }
      
      as3commons_bytecode function setScriptInfo(value:Vector.<ScriptInfo>) : void
      {
         this._scriptInfo = value;
      }
      
      public function get methodBodies() : Vector.<MethodBody>
      {
         return this._methodBodies;
      }
      
      as3commons_bytecode function setMethodBodies(value:Vector.<MethodBody>) : void
      {
         this._methodBodies = value;
      }
      
      protected function addCollection(addFunction:Function, collection:*) : void
      {
         var obj:Object = null;
         for each(obj in collection)
         {
            addFunction(obj);
         }
      }
      
      public function hasClass(className:String) : Boolean
      {
         var info:InstanceInfo = null;
         for each(info in this.instanceInfo)
         {
            if(info.classMultiname.fullName == className)
            {
               return true;
            }
         }
         return false;
      }
      
      public function toString() : String
      {
         var strings:Array = [this.constantPool,TOSTRING_TEMPLATE,TAB_CHAR + this._methodInfo.join(NL_LF_CHARS),this.metadataInfo.join(NEWLINE_CHAR),this._instanceInfo.join(NEWLINE_CHAR),this.constantPool.classInfo.join(NEWLINE_CHAR),this._scriptInfo.join(NEWLINE_CHAR),this._methodBodies.join(NEWLINE_CHAR)];
         return strings.join(NEWLINE_CHAR);
      }
   }
}
