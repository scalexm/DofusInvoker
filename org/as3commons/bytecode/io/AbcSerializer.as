package org.as3commons.bytecode.io
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import org.as3commons.bytecode.abc.AbcFile;
   import org.as3commons.bytecode.abc.BaseMultiname;
   import org.as3commons.bytecode.abc.ClassInfo;
   import org.as3commons.bytecode.abc.ClassTrait;
   import org.as3commons.bytecode.abc.ConstantPool;
   import org.as3commons.bytecode.abc.ExceptionInfo;
   import org.as3commons.bytecode.abc.FunctionTrait;
   import org.as3commons.bytecode.abc.IConstantPool;
   import org.as3commons.bytecode.abc.InstanceInfo;
   import org.as3commons.bytecode.abc.LNamespace;
   import org.as3commons.bytecode.abc.MethodBody;
   import org.as3commons.bytecode.abc.MethodInfo;
   import org.as3commons.bytecode.abc.MethodTrait;
   import org.as3commons.bytecode.abc.Multiname;
   import org.as3commons.bytecode.abc.MultinameG;
   import org.as3commons.bytecode.abc.MultinameL;
   import org.as3commons.bytecode.abc.NamespaceSet;
   import org.as3commons.bytecode.abc.QualifiedName;
   import org.as3commons.bytecode.abc.RuntimeQualifiedName;
   import org.as3commons.bytecode.abc.ScriptInfo;
   import org.as3commons.bytecode.abc.SlotOrConstantTrait;
   import org.as3commons.bytecode.abc.TraitInfo;
   import org.as3commons.bytecode.abc.enum.ClassConstant;
   import org.as3commons.bytecode.abc.enum.ConstantKind;
   import org.as3commons.bytecode.abc.enum.MethodFlag;
   import org.as3commons.bytecode.abc.enum.MultinameKind;
   import org.as3commons.bytecode.abc.enum.Opcode;
   import org.as3commons.bytecode.abc.enum.TraitAttributes;
   import org.as3commons.bytecode.abc.enum.TraitKind;
   import org.as3commons.bytecode.typeinfo.Argument;
   import org.as3commons.bytecode.typeinfo.Metadata;
   import org.as3commons.bytecode.util.AbcSpec;
   import org.as3commons.lang.Assert;
   import org.as3commons.lang.StringUtils;
   
   public class AbcSerializer
   {
      
      public static const MINOR_VERSION:int = 16;
      
      public static const MAJOR_VERSION:int = 46;
      
      private static const UNKNOWN_TRAITKIND_ERROR:String = "Unknown trait kind: {0}";
      
      private static const __UNABLE_TO_DETERMINE_POOL_POSITION_ERROR:String = "Unable to determine pool position.";
       
      
      private var _pool:ConstantPool;
      
      private var _outputStream:ByteArray;
      
      public function AbcSerializer()
      {
         super();
      }
      
      public function serializeAbcFile(abcFile:AbcFile) : ByteArray
      {
         this._outputStream = AbcSpec.newByteArray();
         this.writeU16(MINOR_VERSION);
         this.writeU16(MAJOR_VERSION);
         var tempOutputStream:ByteArray = this._outputStream;
         this._outputStream = AbcSpec.newByteArray();
         this.serializeMethodInfo(abcFile);
         this.serializeMetadataInfo(abcFile);
         this.serializeClassAndInstanceInfo(abcFile);
         this.serializeScriptInfo(abcFile);
         this.serializeMethodBodies(abcFile);
         this._outputStream.position = 0;
         var trailingOutputStream:ByteArray = this._outputStream;
         this._outputStream = tempOutputStream;
         abcFile.constantPool.locked = true;
         this.serializeConstantPool(abcFile.constantPool,this._outputStream);
         abcFile.constantPool.locked = false;
         this._outputStream.writeBytes(trailingOutputStream);
         this._outputStream.position = 0;
         return this._outputStream;
      }
      
      public function serializeMethodBodies(abcFile:AbcFile) : void
      {
         var body:MethodBody = null;
         var exception:ExceptionInfo = null;
         var opcodesAsByteArray:ByteArray = null;
         var methodBodies:Vector.<MethodBody> = abcFile.methodBodies;
         var pool:IConstantPool = abcFile.constantPool;
         this.writeU30(methodBodies.length);
         for each(body in methodBodies)
         {
            this.writeU30(abcFile.addMethodInfo(body.methodSignature));
            this.writeU30(body.maxStack);
            this.writeU30(body.localCount);
            this.writeU30(body.initScopeDepth);
            this.writeU30(body.maxScopeDepth);
            if(body.rawOpcodes == null)
            {
               opcodesAsByteArray = Opcode.serialize(body.opcodes,body,abcFile);
               this.writeU30(opcodesAsByteArray.length);
               this._outputStream.writeBytes(opcodesAsByteArray,0,opcodesAsByteArray.length);
            }
            else
            {
               this.writeU30(body.rawOpcodes.length);
               this._outputStream.writeBytes(body.rawOpcodes);
            }
            this.writeU30(body.exceptionInfos.length);
            for each(exception in body.exceptionInfos)
            {
               exception.exceptionEnabledFromCodePosition = exception.exceptionEnabledFromOpcode.baseLocation;
               exception.exceptionEnabledToCodePosition = exception.exceptionEnabledToOpcode.baseLocation;
               exception.codePositionToJumpToOnException = exception.opcodeToJumpToOnException.baseLocation;
               this.writeU30(exception.exceptionEnabledFromCodePosition);
               this.writeU30(exception.exceptionEnabledToCodePosition);
               this.writeU30(exception.codePositionToJumpToOnException);
               this.writeU30(pool.addMultiname(exception.exceptionType));
               this.writeU30(pool.addMultiname(exception.variableReceivingException));
            }
            this.serializeTraits(body.traits,abcFile);
         }
      }
      
      public function serializeScriptInfo(abcFile:AbcFile) : void
      {
         var script:ScriptInfo = null;
         var scriptInfo:Vector.<ScriptInfo> = abcFile.scriptInfo;
         this.writeU30(scriptInfo.length);
         for each(script in scriptInfo)
         {
            this.writeU30(abcFile.addMethodInfo(script.scriptInitializer));
            this.serializeTraits(script.traits,abcFile);
         }
      }
      
      public function serializeTraits(traits:Vector.<TraitInfo>, abcFile:AbcFile) : void
      {
         var trait:TraitInfo = null;
         var traitKindAndAttributes:uint = 0;
         var slotTrait:SlotOrConstantTrait = null;
         var methodTrait:MethodTrait = null;
         var classTrait:ClassTrait = null;
         var functionTrait:FunctionTrait = null;
         var vindex:int = 0;
         var metadataEntry:Metadata = null;
         this.writeU30(traits.length);
         var pool:IConstantPool = abcFile.constantPool;
         while(true)
         {
            loop0:
            for each(trait in traits)
            {
               this.writeU30(pool.addMultiname(trait.traitMultiname));
               traitKindAndAttributes = trait.traitKind.bitMask;
               traitKindAndAttributes = traitKindAndAttributes | (!!trait.isFinal?TraitAttributes.FINAL.bitMask << 4:null);
               traitKindAndAttributes = traitKindAndAttributes | (!!trait.isOverride?TraitAttributes.OVERRIDE.bitMask << 4:null);
               traitKindAndAttributes = traitKindAndAttributes | (!!trait.hasMetadata?TraitAttributes.METADATA.bitMask << 4:null);
               this.writeU8(traitKindAndAttributes);
               switch(trait.traitKind)
               {
                  case TraitKind.SLOT:
                  case TraitKind.CONST:
                     slotTrait = trait as SlotOrConstantTrait;
                     this.writeU30(slotTrait.slotId);
                     this.writeU30(pool.addMultiname(slotTrait.typeMultiname));
                     if(slotTrait.vkind != null)
                     {
                        vindex = pool.addItemToPool(slotTrait.vkind,slotTrait.defaultValue);
                        slotTrait.vindex = vindex;
                     }
                     else
                     {
                        slotTrait.vindex = 0;
                     }
                     this.writeU30(slotTrait.vindex);
                     if(slotTrait.vindex > 0)
                     {
                        this.writeU8(slotTrait.vkind.value);
                     }
                     break;
                  case TraitKind.METHOD:
                  case TraitKind.GETTER:
                  case TraitKind.SETTER:
                     methodTrait = trait as MethodTrait;
                     this.writeU30(methodTrait.dispositionId);
                     this.writeU30(abcFile.addMethodInfo(methodTrait.traitMethod));
                     break;
                  case TraitKind.CLASS:
                     classTrait = trait as ClassTrait;
                     classTrait.classIndex = abcFile.classInfo.indexOf(classTrait.classInfo);
                     Assert.state(classTrait.classIndex > -1,"classTrait.classIndex is -1");
                     this.writeU30(classTrait.classSlotId);
                     this.writeU30(classTrait.classIndex);
                     break;
                  case TraitKind.FUNCTION:
                     functionTrait = trait as FunctionTrait;
                     this.writeU30(functionTrait.functionSlotId);
                     this.writeU30(abcFile.addMethodInfo(functionTrait.functionMethod));
                     break;
                  default:
                     break loop0;
               }
               if(trait.hasMetadata)
               {
                  this.writeU30(trait.metadata.length);
                  for each(metadataEntry in trait.metadata)
                  {
                     this.writeU30(abcFile.addMetadataInfo(metadataEntry));
                  }
               }
            }
            return;
         }
         throw new Error(StringUtils.substitute(UNKNOWN_TRAITKIND_ERROR,trait.traitKind));
      }
      
      public function serializeClassAndInstanceInfo(abcFile:AbcFile) : void
      {
         var instance:InstanceInfo = null;
         var classEntry:ClassInfo = null;
         var flags:* = 0;
         var interfaceEntry:BaseMultiname = null;
         var instanceInfo:Vector.<InstanceInfo> = abcFile.instanceInfo;
         var classInfo:Vector.<ClassInfo> = abcFile.classInfo;
         var pool:IConstantPool = abcFile.constantPool;
         this.writeU30(classInfo.length);
         for each(instance in instanceInfo)
         {
            this.writeU30(pool.addMultiname(instance.classMultiname));
            this.writeU30(pool.addMultiname(instance.superclassMultiname));
            flags = 0;
            flags = flags | (!!instance.isFinal?ClassConstant.FINAL.bitMask:0);
            flags = flags | (!!instance.isInterface?ClassConstant.INTERFACE.bitMask:0);
            flags = flags | (!!instance.isProtected?ClassConstant.PROTECTED_NAMESPACE.bitMask:0);
            flags = flags | (!!instance.isSealed?ClassConstant.SEALED.bitMask:0);
            this.writeU8(flags);
            if(instance.isProtected)
            {
               this.writeU30(pool.addNamespace(instance.protectedNamespace));
            }
            this.writeU30(instance.interfaceCount);
            for each(interfaceEntry in instance.interfaceMultinames)
            {
               this.writeU30(pool.addMultiname(interfaceEntry));
            }
            this.writeU30(abcFile.addMethodInfo(instance.instanceInitializer));
            this.serializeTraits(instance.traits,abcFile);
         }
         for each(classEntry in classInfo)
         {
            this.writeU30(abcFile.addMethodInfo(classEntry.staticInitializer));
            this.serializeTraits(classEntry.traits,abcFile);
         }
      }
      
      public function serializeMetadataInfo(abcFile:AbcFile) : void
      {
         var metadataEntry:Metadata = null;
         var properties:Dictionary = null;
         var keys:Array = null;
         var keyValue:String = null;
         var key:String = null;
         var value:String = null;
         var metadataInfo:Vector.<Metadata> = abcFile.metadataInfo;
         var pool:IConstantPool = abcFile.constantPool;
         this.writeU30(metadataInfo.length);
         for each(metadataEntry in metadataInfo)
         {
            this.writeU30(pool.addString(metadataEntry.name));
            properties = metadataEntry.properties;
            keys = [];
            for(keys[keys.length] in properties)
            {
            }
            this.writeU30(keys.length);
            for each(key in keys)
            {
               this.writeU30(pool.addString(key));
            }
            for each(value in properties)
            {
               this.writeU30(pool.addString(value));
            }
         }
      }
      
      public function serializeMethodInfo(abcFile:AbcFile) : void
      {
         var methodInfo:MethodInfo = null;
         var param:Argument = null;
         var optionalParams:Vector.<Argument> = null;
         var optionalArgument:Argument = null;
         var defaultValue:* = undefined;
         var positionInPool:int = 0;
         var arg:Argument = null;
         Assert.notNull(abcFile,"abcFile argument must not be null");
         var pool:IConstantPool = abcFile.constantPool;
         var methodInfoArray:Vector.<MethodInfo> = abcFile.methodInfo;
         this.writeU30(methodInfoArray.length);
         for each(methodInfo in methodInfoArray)
         {
            this.writeU30(methodInfo.argumentCollection.length);
            this.writeU30(pool.addMultiname(methodInfo.returnType));
            for each(param in methodInfo.argumentCollection)
            {
               this.writeU30(pool.addMultiname(param.type));
            }
            this.writeU30(pool.addString(methodInfo.methodName));
            this.writeU8(methodInfo.flags);
            if(MethodFlag.flagPresent(methodInfo.flags,MethodFlag.HAS_OPTIONAL))
            {
               optionalParams = methodInfo.optionalParameters;
               this.writeU30(optionalParams.length);
               loop2:
               while(true)
               {
                  for each(optionalArgument in optionalParams)
                  {
                     defaultValue = optionalArgument.defaultValue;
                     switch(optionalArgument.kind)
                     {
                        case ConstantKind.INT:
                           positionInPool = pool.addInt(defaultValue as int);
                           break;
                        case ConstantKind.UINT:
                           positionInPool = pool.addUint(defaultValue as uint);
                           break;
                        case ConstantKind.DOUBLE:
                           positionInPool = pool.addDouble(defaultValue as Number);
                           break;
                        case ConstantKind.UTF8:
                           positionInPool = pool.addString(defaultValue as String);
                           break;
                        case ConstantKind.TRUE:
                        case ConstantKind.FALSE:
                        case ConstantKind.NULL:
                        case ConstantKind.UNDEFINED:
                           positionInPool = optionalArgument.kind.value;
                           break;
                        case ConstantKind.NAMESPACE:
                        case ConstantKind.PACKAGE_NAMESPACE:
                        case ConstantKind.PACKAGE_INTERNAL_NAMESPACE:
                        case ConstantKind.PROTECTED_NAMESPACE:
                        case ConstantKind.EXPLICIT_NAMESPACE:
                        case ConstantKind.STATIC_PROTECTED_NAMESPACE:
                        case ConstantKind.PRIVATE_NAMESPACE:
                           positionInPool = pool.addNamespace(defaultValue as LNamespace);
                           break;
                        default:
                           break loop2;
                     }
                     this.writeU30(positionInPool);
                     this.writeU30(optionalArgument.kind.value);
                     continue loop2;
                  }
               }
               throw new Error(__UNABLE_TO_DETERMINE_POOL_POSITION_ERROR + " " + optionalArgument.kind);
            }
            if(MethodFlag.flagPresent(methodInfo.flags,MethodFlag.HAS_PARAM_NAMES))
            {
               for each(arg in methodInfo.argumentCollection)
               {
                  this.writeU30(pool.addString(arg.name));
               }
            }
         }
      }
      
      private function writeU8(value:int) : void
      {
         AbcSpec.writeU8(value,this._outputStream);
      }
      
      private function writeU16(value:int) : void
      {
         AbcSpec.writeU16(value,this._outputStream);
      }
      
      private function writeU30(value:int) : void
      {
         AbcSpec.writeU30(value,this._outputStream);
      }
      
      public function serializeConstantPool(pool:IConstantPool, outputStream:ByteArray) : void
      {
         this.serializeIntegers(pool,outputStream);
         this.serializeUIntegers(pool,outputStream);
         this.serializeDoubles(pool,outputStream);
         this.serializeStrings(pool,outputStream);
         this.serializeNamespaces(pool,outputStream);
         this.serializeNamespaceSets(pool,outputStream);
         this.serializeMultinames(pool,outputStream);
      }
      
      public function serializeMultinames(pool:IConstantPool, outputStream:ByteArray) : void
      {
         var multiname:BaseMultiname = null;
         var qualifiedName:QualifiedName = null;
         var multinamespaceName:Multiname = null;
         var multinamespaceNameLate:MultinameL = null;
         var runtimeQualifiedName:RuntimeQualifiedName = null;
         var generic:MultinameG = null;
         var paramCount:uint = 0;
         var idx:uint = 0;
         var multinames:Vector.<BaseMultiname> = pool.multinamePool.slice(1,pool.multinamePool.length);
         AbcSpec.writeU30(multinames.length + 1,outputStream);
         for each(multiname in multinames)
         {
            AbcSpec.writeU8(multiname.kind.byteValue,outputStream);
            switch(multiname.kind)
            {
               case MultinameKind.QNAME:
               case MultinameKind.QNAME_A:
                  qualifiedName = multiname as QualifiedName;
                  AbcSpec.writeU30(pool.addNamespace(qualifiedName.nameSpace),outputStream);
                  AbcSpec.writeU30(pool.addString(qualifiedName.name),outputStream);
                  continue;
               case MultinameKind.MULTINAME:
               case MultinameKind.MULTINAME_A:
                  multinamespaceName = multiname as Multiname;
                  AbcSpec.writeU30(pool.addString(multinamespaceName.name),outputStream);
                  AbcSpec.writeU30(pool.addNamespaceSet(multinamespaceName.namespaceSet),outputStream);
                  continue;
               case MultinameKind.MULTINAME_L:
               case MultinameKind.MULTINAME_LA:
                  multinamespaceNameLate = multiname as MultinameL;
                  AbcSpec.writeU30(pool.addNamespaceSet(multinamespaceNameLate.namespaceSet),outputStream);
                  continue;
               case MultinameKind.RTQNAME:
               case MultinameKind.RTQNAME_A:
                  runtimeQualifiedName = multiname as RuntimeQualifiedName;
                  AbcSpec.writeU30(pool.addString(runtimeQualifiedName.name),outputStream);
                  continue;
               case MultinameKind.RTQNAME_L:
               case MultinameKind.RTQNAME_LA:
                  continue;
               case MultinameKind.GENERIC:
                  generic = multiname as MultinameG;
                  AbcSpec.writeU30(pool.addMultiname(generic.qualifiedName),outputStream);
                  paramCount = generic.parameters.length;
                  AbcSpec.writeU30(paramCount,outputStream);
                  for(idx = 0; idx < paramCount; idx++)
                  {
                     AbcSpec.writeU30(pool.addMultiname(generic.parameters[idx]),outputStream);
                  }
                  continue;
               default:
                  continue;
            }
         }
      }
      
      public function serializeNamespaceSets(pool:IConstantPool, outputStream:ByteArray) : void
      {
         var namespaceSet:NamespaceSet = null;
         var nameSpace:LNamespace = null;
         var namespaceSets:Vector.<NamespaceSet> = pool.namespaceSetPool.slice(1,pool.namespaceSetPool.length);
         AbcSpec.writeU30(namespaceSets.length + 1,outputStream);
         for each(namespaceSet in namespaceSets)
         {
            AbcSpec.writeU30(namespaceSet.namespaces.length,outputStream);
            for each(nameSpace in namespaceSet.namespaces)
            {
               AbcSpec.writeU30(pool.addNamespace(nameSpace),outputStream);
            }
         }
      }
      
      public function serializeNamespaces(pool:IConstantPool, outputStream:ByteArray) : void
      {
         var namespaceInstance:LNamespace = null;
         var namespaces:Vector.<LNamespace> = pool.namespacePool.slice(1,pool.namespacePool.length);
         AbcSpec.writeU30(namespaces.length + 1,outputStream);
         for each(namespaceInstance in namespaces)
         {
            AbcSpec.writeU8(namespaceInstance.kind.byteValue,outputStream);
            AbcSpec.writeU30(pool.addString(namespaceInstance.name),outputStream);
         }
      }
      
      public function serializeStrings(pool:IConstantPool, outputStream:ByteArray) : void
      {
         var string:String = null;
         var strLen:int = pool.stringPool.length;
         var strings:Vector.<String> = pool.stringPool.slice(1,pool.stringPool.length);
         AbcSpec.writeU30(strLen,outputStream);
         for each(string in strings)
         {
            AbcSpec.writeStringInfo(string,outputStream);
         }
      }
      
      public function serializeDoubles(pool:IConstantPool, outputStream:ByteArray) : void
      {
         var double:Number = NaN;
         var doubles:Vector.<Number> = pool.doublePool.slice(1,pool.doublePool.length);
         if(doubles.length > 0)
         {
            AbcSpec.writeU30(doubles.length + 1,outputStream);
            for each(double in doubles)
            {
               AbcSpec.writeD64(double,outputStream);
            }
         }
         else
         {
            AbcSpec.writeU30(0,outputStream);
         }
      }
      
      public function serializeUIntegers(pool:IConstantPool, outputStream:ByteArray) : void
      {
         var uinteger:int = 0;
         var uints:Vector.<uint> = pool.uintPool.slice(1,pool.uintPool.length);
         if(uints.length > 0)
         {
            AbcSpec.writeU30(uints.length + 1,outputStream);
            for each(uinteger in uints)
            {
               AbcSpec.writeU32(uinteger,outputStream);
            }
         }
         else
         {
            AbcSpec.writeU30(0,outputStream);
         }
      }
      
      public function serializeIntegers(pool:IConstantPool, outputStream:ByteArray) : void
      {
         var integer:int = 0;
         var integers:Vector.<int> = pool.integerPool.slice(1,pool.integerPool.length);
         if(integers.length > 0)
         {
            AbcSpec.writeU30(integers.length + 1,outputStream);
            for each(integer in integers)
            {
               AbcSpec.writeU32(integer,outputStream);
            }
         }
         else
         {
            AbcSpec.writeU30(0,outputStream);
         }
      }
      
      private function createBuffer() : ByteArray
      {
         return AbcSpec.newByteArray();
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("Integer Pool: {0}\n" + "Uint Pool: {1}\n" + "Double Pool: {2}\n" + "String Pool: {3}",this._pool.integerPool.join(),this._pool.uintPool.join(),this._pool.doublePool.join(),this._pool.stringPool.join());
      }
   }
}
