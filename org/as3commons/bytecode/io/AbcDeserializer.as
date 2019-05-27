package org.as3commons.bytecode.io
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.abc.AbcFile;
   import org.as3commons.bytecode.abc.BaseMultiname;
   import org.as3commons.bytecode.abc.ClassInfo;
   import org.as3commons.bytecode.abc.ClassTrait;
   import org.as3commons.bytecode.abc.ExceptionInfo;
   import org.as3commons.bytecode.abc.FunctionTrait;
   import org.as3commons.bytecode.abc.IConstantPool;
   import org.as3commons.bytecode.abc.InstanceInfo;
   import org.as3commons.bytecode.abc.MethodBody;
   import org.as3commons.bytecode.abc.MethodInfo;
   import org.as3commons.bytecode.abc.MethodTrait;
   import org.as3commons.bytecode.abc.MultinameG;
   import org.as3commons.bytecode.abc.Op;
   import org.as3commons.bytecode.abc.QualifiedName;
   import org.as3commons.bytecode.abc.ScriptInfo;
   import org.as3commons.bytecode.abc.SlotOrConstantTrait;
   import org.as3commons.bytecode.abc.TraitInfo;
   import org.as3commons.bytecode.abc.enum.ClassConstant;
   import org.as3commons.bytecode.abc.enum.ConstantKind;
   import org.as3commons.bytecode.abc.enum.MethodFlag;
   import org.as3commons.bytecode.abc.enum.Opcode;
   import org.as3commons.bytecode.abc.enum.TraitAttributes;
   import org.as3commons.bytecode.abc.enum.TraitKind;
   import org.as3commons.bytecode.typeinfo.Argument;
   import org.as3commons.bytecode.typeinfo.Metadata;
   import org.as3commons.bytecode.util.AbcSpec;
   import org.as3commons.bytecode.util.MultinameUtil;
   import org.as3commons.lang.StringUtils;
   
   public class AbcDeserializer extends AbstractAbcDeserializer implements IAbcDeserializer
   {
      
      public static const __NEED_CONSTANTS_:String = "~~ need constants ~~";
      
      public static const CONSTRUCTOR_BYTECODENAME:String = "constructor";
      
      public static const STATIC_INITIALIZER_BYTECODENAME:String = "staticInitializer";
      
      public static const SCRIPT_INITIALIZER_BYTECODENAME:String = "scriptInitializer";
      
      private static const ASSERT_EXTRACTION_ERROR_TEMPLATE:String = "Expected {0} elements in {1}, actual count is {2}";
       
      
      private var _methodBodyExtractionMethod:MethodBodyExtractionKind;
      
      public function AbcDeserializer(byteStream:ByteArray = null)
      {
         super(byteStream);
         this.methodBodyExtractionMethod = MethodBodyExtractionKind.PARSE;
      }
      
      public static function resolveExceptionInfos(methodBody:MethodBody) : void
      {
         var exceptionInfo:ExceptionInfo = null;
         for each(exceptionInfo in methodBody.exceptionInfos)
         {
            resolveExceptionInfoOpcodes(exceptionInfo,methodBody);
         }
         resolveOpcodeExceptionInfos(methodBody);
      }
      
      public static function extractExceptionInfos(input:ByteArray, constantPool:IConstantPool, methodBody:MethodBody) : Vector.<ExceptionInfo>
      {
         var exceptionInfo:ExceptionInfo = null;
         var exceptionInfos:Vector.<ExceptionInfo> = new Vector.<ExceptionInfo>();
         var exceptionCount:int = AbcSpec.readU30(input);
         for(var exceptionIndex:int = 0; exceptionIndex < exceptionCount; exceptionIndex++)
         {
            exceptionInfo = new ExceptionInfo();
            exceptionInfo.exceptionEnabledFromCodePosition = AbcSpec.readU30(input);
            exceptionInfo.exceptionEnabledToCodePosition = AbcSpec.readU30(input);
            exceptionInfo.codePositionToJumpToOnException = AbcSpec.readU30(input);
            exceptionInfo.exceptionType = QualifiedName(constantPool.multinamePool[AbcSpec.readU30(input)]);
            exceptionInfo.variableReceivingException = QualifiedName(constantPool.multinamePool[AbcSpec.readU30(input)]);
            exceptionInfos[exceptionInfos.length] = exceptionInfo;
         }
         return exceptionInfos;
      }
      
      public static function resolveExceptionInfoOpcodes(exceptionInfo:ExceptionInfo, methodBody:MethodBody) : void
      {
         exceptionInfo.exceptionEnabledFromOpcode = methodBody.opcodeBaseLocations[exceptionInfo.exceptionEnabledFromCodePosition];
         exceptionInfo.exceptionEnabledToOpcode = methodBody.opcodeBaseLocations[exceptionInfo.exceptionEnabledToCodePosition];
         exceptionInfo.opcodeToJumpToOnException = methodBody.opcodeBaseLocations[exceptionInfo.codePositionToJumpToOnException];
      }
      
      public static function resolveOpcodeExceptionInfos(methodBody:MethodBody) : void
      {
         var foundLen:int = 0;
         var op:Op = null;
         var idx:int = 0;
         var exceptionIndex:int = -1;
         var len:int = methodBody.exceptionInfos.length;
         if(len > 0)
         {
            foundLen = 0;
            for each(op in methodBody.opcodes)
            {
               idx = getExceptionInfoArgumentIndex(op);
               if(idx > -1)
               {
                  exceptionIndex = int(op.parameters[idx]);
                  op.parameters[idx] = methodBody.exceptionInfos[exceptionIndex];
                  if(++foundLen == len)
                  {
                     break;
                  }
               }
            }
         }
      }
      
      public static function getExceptionInfoArgumentIndex(op:Op) : int
      {
         if(op.opcode === Opcode.newcatch)
         {
            return 0;
         }
         return -1;
      }
      
      override public function get methodBodyExtractionMethod() : MethodBodyExtractionKind
      {
         return this._methodBodyExtractionMethod;
      }
      
      override public function set methodBodyExtractionMethod(value:MethodBodyExtractionKind) : void
      {
         this._methodBodyExtractionMethod = value;
      }
      
      private function assertExtraction(expectedCount:int, elementCollection:Array, collectionName:String) : void
      {
         var collectionLength:int = 0;
         if(expectedCount != 0)
         {
            collectionLength = elementCollection.length;
            if(expectedCount != collectionLength)
            {
               throw new Error(StringUtils.substitute(ASSERT_EXTRACTION_ERROR_TEMPLATE,expectedCount,collectionName,collectionLength));
            }
         }
      }
      
      override public function deserialize(positionInByteArrayToReadFrom:int = 0) : AbcFile
      {
         _byteStream.position = positionInByteArrayToReadFrom;
         var abcFile:AbcFile = new AbcFile();
         var pool:IConstantPool = abcFile.constantPool;
         abcFile.minorVersion = AbcSpec.readU16(_byteStream);
         abcFile.majorVersion = AbcSpec.readU16(_byteStream);
         pool.dupeCheck = false;
         deserializeConstantPool(pool);
         pool.initializeLookups();
         pool.dupeCheck = true;
         this.deserializeMethodInfos(abcFile,pool);
         this.deserializeMetadata(abcFile,pool);
         var classCount:int = this.deserializeInstanceInfo(abcFile,pool);
         this.deserializeClassInfos(abcFile,pool,classCount);
         this.deserializeScriptInfos(abcFile);
         this.deserializeMethodBodies(abcFile,pool);
         return abcFile;
      }
      
      override public function deserializeClassInfos(abcFile:AbcFile, pool:IConstantPool, classCount:int) : void
      {
         var classInfo:ClassInfo = null;
         for(var classIndex:int = 0; classIndex < classCount; classIndex++)
         {
            classInfo = new ClassInfo();
            classInfo.classMultiname = InstanceInfo(abcFile.instanceInfo[classIndex]).classMultiname;
            classInfo.staticInitializer = abcFile.methodInfo[AbcSpec.readU30(_byteStream)];
            classInfo.staticInitializer.as3commonsBytecodeName = STATIC_INITIALIZER_BYTECODENAME;
            classInfo.traits = this.deserializeTraitsInfo(abcFile,_byteStream,true);
            abcFile.instanceInfo[classIndex].classInfo = classInfo;
            abcFile.addClassInfo(classInfo);
         }
      }
      
      override public function deserializeMethodBodies(abcFile:AbcFile, pool:IConstantPool) : void
      {
         var methodBody:MethodBody = null;
         var codeLength:int = 0;
         var methodBodyCount:int = AbcSpec.readU30(_byteStream);
         for(var bodyIndex:int = 0; bodyIndex < methodBodyCount; bodyIndex++)
         {
            methodBody = new MethodBody();
            methodBody.methodSignature = abcFile.methodInfo[AbcSpec.readU30(_byteStream)];
            methodBody.methodSignature.methodBody = methodBody;
            methodBody.maxStack = AbcSpec.readU30(_byteStream);
            methodBody.localCount = AbcSpec.readU30(_byteStream);
            methodBody.initScopeDepth = AbcSpec.readU30(_byteStream);
            methodBody.maxScopeDepth = AbcSpec.readU30(_byteStream);
            codeLength = AbcSpec.readU30(_byteStream);
            switch(this.methodBodyExtractionMethod)
            {
               case MethodBodyExtractionKind.PARSE:
                  methodBody.opcodes = Opcode.parse(_byteStream,codeLength,methodBody,abcFile.constantPool);
                  break;
               case MethodBodyExtractionKind.BYTEARRAY:
                  methodBody.rawOpcodes = AbcSpec.newByteArray();
                  methodBody.rawOpcodes.writeBytes(_byteStream,_byteStream.position,codeLength);
               case MethodBodyExtractionKind.SKIP:
                  _byteStream.position = _byteStream.position + codeLength;
            }
            methodBody.exceptionInfos = extractExceptionInfos(_byteStream,pool,methodBody);
            if(this.methodBodyExtractionMethod === MethodBodyExtractionKind.PARSE)
            {
               resolveExceptionInfos(methodBody);
            }
            methodBody.traits = this.deserializeTraitsInfo(abcFile,_byteStream);
            abcFile.addMethodBody(methodBody);
         }
      }
      
      override public function deserializeScriptInfos(abcFile:AbcFile) : void
      {
         var scriptInfo:ScriptInfo = null;
         var scriptCount:int = AbcSpec.readU30(_byteStream);
         for(var scriptIndex:int = 0; scriptIndex < scriptCount; scriptIndex++)
         {
            scriptInfo = new ScriptInfo();
            scriptInfo.scriptInitializer = abcFile.methodInfo[AbcSpec.readU30(_byteStream)];
            scriptInfo.scriptInitializer.as3commonsBytecodeName = SCRIPT_INITIALIZER_BYTECODENAME;
            scriptInfo.traits = this.deserializeTraitsInfo(abcFile,_byteStream);
            abcFile.addScriptInfo(scriptInfo);
         }
      }
      
      override public function deserializeInstanceInfo(abcFile:AbcFile, pool:IConstantPool) : int
      {
         var instanceInfo:InstanceInfo = null;
         var classMultiname:BaseMultiname = null;
         var instanceInfoFlags:int = 0;
         var interfaceCount:int = 0;
         var interfaceIndex:int = 0;
         var intfIdx:int = 0;
         var classCount:int = AbcSpec.readU30(_byteStream);
         for(var instanceIndex:int = 0; instanceIndex < classCount; instanceIndex++)
         {
            instanceInfo = new InstanceInfo();
            classMultiname = pool.multinamePool[AbcSpec.readU30(_byteStream)];
            instanceInfo.classMultiname = MultinameUtil.convertToQualifiedName(classMultiname);
            instanceInfo.superclassMultiname = pool.multinamePool[AbcSpec.readU30(_byteStream)];
            instanceInfoFlags = AbcSpec.readU8(_byteStream);
            instanceInfo.isFinal = ClassConstant.FINAL.present(instanceInfoFlags);
            instanceInfo.isInterface = ClassConstant.INTERFACE.present(instanceInfoFlags);
            instanceInfo.isProtected = ClassConstant.PROTECTED_NAMESPACE.present(instanceInfoFlags);
            instanceInfo.isSealed = ClassConstant.SEALED.present(instanceInfoFlags);
            if(instanceInfo.isProtected)
            {
               instanceInfo.protectedNamespace = pool.namespacePool[AbcSpec.readU30(_byteStream)];
            }
            interfaceCount = AbcSpec.readU30(_byteStream);
            for(interfaceIndex = 0; interfaceIndex < interfaceCount; interfaceIndex++)
            {
               intfIdx = AbcSpec.readU30(_byteStream);
               instanceInfo.interfaceMultinames[instanceInfo.interfaceMultinames.length] = pool.multinamePool[intfIdx];
            }
            instanceInfo.instanceInitializer = abcFile.methodInfo[AbcSpec.readU30(_byteStream)];
            instanceInfo.instanceInitializer.as3commonsBytecodeName = CONSTRUCTOR_BYTECODENAME;
            instanceInfo.traits = this.deserializeTraitsInfo(abcFile,_byteStream,false,instanceInfo.classMultiname.fullName);
            abcFile.addInstanceInfo(instanceInfo);
         }
         return classCount;
      }
      
      override public function deserializeMetadata(abcFile:AbcFile, pool:IConstantPool) : void
      {
         var metadataInstance:Metadata = null;
         var keyValuePairCount:int = 0;
         var keys:Array = null;
         var key:String = null;
         var keyIndex:int = 0;
         var value:String = null;
         var currentKey:String = null;
         var metadataCount:int = AbcSpec.readU30(_byteStream);
         for(var metadataIndex:int = 0; metadataIndex < metadataCount; metadataIndex++)
         {
            metadataInstance = new Metadata();
            metadataInstance.name = pool.stringPool[AbcSpec.readU30(_byteStream)];
            abcFile.addMetadataInfo(metadataInstance);
            keyValuePairCount = AbcSpec.readU30(_byteStream);
            keys = [];
            for(keyIndex = 0; keyIndex < keyValuePairCount; keyIndex++)
            {
               key = pool.stringPool[AbcSpec.readU30(_byteStream)];
               keys[keys.length] = key;
            }
            for each(currentKey in keys)
            {
               value = pool.stringPool[AbcSpec.readU30(_byteStream)];
               metadataInstance.properties[currentKey] = value;
            }
         }
      }
      
      override public function deserializeMethodInfos(abcFile:AbcFile, pool:IConstantPool) : void
      {
         var methodInfo:MethodInfo = null;
         var paramCount:int = 0;
         var argumentIndex:int = 0;
         var mn:BaseMultiname = null;
         var paramQName:BaseMultiname = null;
         var arg:Argument = null;
         var optionInfoCount:int = 0;
         var optionInfoIndex:int = 0;
         var valueIndexInConstantPool:int = 0;
         var optionalValueKind:int = 0;
         var defaultValue:* = undefined;
         var len:int = 0;
         var argIdx:int = 0;
         var optArg:Argument = null;
         var nameCount:uint = 0;
         var nameIndex:uint = 0;
         var paramName:String = null;
         var methodCount:int = AbcSpec.readU30(_byteStream);
         for(var methodIndex:int = 0; methodIndex < methodCount; methodIndex++)
         {
            methodInfo = new MethodInfo();
            abcFile.addMethodInfo(methodInfo);
            paramCount = AbcSpec.readU30(_byteStream);
            methodInfo.returnType = pool.multinamePool[AbcSpec.readU30(_byteStream)];
            for(argumentIndex = 0; argumentIndex < paramCount; argumentIndex++)
            {
               mn = pool.multinamePool[AbcSpec.readU30(_byteStream)];
               paramQName = mn is MultinameG?mn:MultinameUtil.convertToQualifiedName(mn);
               arg = new Argument(paramQName);
               methodInfo.argumentCollection[methodInfo.argumentCollection.length] = arg;
            }
            methodInfo.methodName = pool.stringPool[AbcSpec.readU30(_byteStream)];
            methodInfo.scopeName = MultinameUtil.extractInterfaceScopeFromFullName(methodInfo.methodName);
            methodInfo.flags = AbcSpec.readU8(_byteStream);
            if(MethodFlag.flagPresent(methodInfo.flags,MethodFlag.HAS_OPTIONAL))
            {
               optionInfoCount = AbcSpec.readU30(_byteStream);
               optionInfoIndex = 0;
               loop2:
               while(true)
               {
                  if(optionInfoIndex < optionInfoCount)
                  {
                     valueIndexInConstantPool = AbcSpec.readU30(_byteStream);
                     optionalValueKind = AbcSpec.readU8(_byteStream);
                     defaultValue = null;
                     switch(optionalValueKind)
                     {
                        case ConstantKind.INT.value:
                           defaultValue = pool.integerPool[valueIndexInConstantPool];
                           break;
                        case ConstantKind.UINT.value:
                           defaultValue = pool.uintPool[valueIndexInConstantPool];
                           break;
                        case ConstantKind.DOUBLE.value:
                           defaultValue = pool.doublePool[valueIndexInConstantPool];
                           break;
                        case ConstantKind.UTF8.value:
                           defaultValue = pool.stringPool[valueIndexInConstantPool];
                           break;
                        case ConstantKind.TRUE.value:
                           defaultValue = true;
                           break;
                        case ConstantKind.FALSE.value:
                           defaultValue = false;
                           break;
                        case ConstantKind.NULL.value:
                           defaultValue = null;
                           break;
                        case ConstantKind.UNDEFINED.value:
                           defaultValue = undefined;
                           break;
                        case ConstantKind.NAMESPACE.value:
                        case ConstantKind.PACKAGE_NAMESPACE.value:
                        case ConstantKind.PACKAGE_INTERNAL_NAMESPACE.value:
                        case ConstantKind.PROTECTED_NAMESPACE.value:
                        case ConstantKind.EXPLICIT_NAMESPACE.value:
                        case ConstantKind.STATIC_PROTECTED_NAMESPACE.value:
                        case ConstantKind.PRIVATE_NAMESPACE.value:
                           defaultValue = pool.namespacePool[valueIndexInConstantPool];
                           break;
                        default:
                           break loop2;
                     }
                     len = methodInfo.argumentCollection.length;
                     argIdx = int(len - optionInfoCount + optionInfoIndex);
                     optArg = Argument(methodInfo.argumentCollection[argIdx]);
                     optArg.defaultValue = defaultValue;
                     optArg.kind = ConstantKind.determineKind(optionalValueKind);
                     optArg.isOptional = true;
                     optionInfoIndex++;
                     continue;
                  }
               }
               throw new Error("Unknown optional value kind: " + optionalValueKind);
            }
            if(MethodFlag.flagPresent(methodInfo.flags,MethodFlag.HAS_PARAM_NAMES))
            {
               nameCount = methodInfo.argumentCollection.length;
               for(nameIndex = 0; nameIndex < nameCount; nameIndex++)
               {
                  paramName = abcFile.constantPool.stringPool[AbcSpec.readU30(_byteStream)];
                  Argument(methodInfo.argumentCollection[nameIndex]).name = paramName;
               }
            }
         }
      }
      
      override public function deserializeTraitsInfo(abcFile:AbcFile, _byteStream:ByteArray, isStatic:Boolean = false, className:String = "") : Vector.<TraitInfo>
      {
         var methodInfos:Vector.<MethodInfo> = null;
         var trait:TraitInfo = null;
         var multiNameIndex:uint = 0;
         var traitName:BaseMultiname = null;
         var traitMultiname:QualifiedName = null;
         var traitKindValue:int = 0;
         var traitKind:TraitKind = null;
         var slotOrConstantTrait:SlotOrConstantTrait = null;
         var methodTrait:MethodTrait = null;
         var associatedMethodInfo:MethodInfo = null;
         var classTrait:ClassTrait = null;
         var functionTrait:FunctionTrait = null;
         var traitMetadataCount:int = 0;
         var traitMetadataIndex:int = 0;
         var mt:Metadata = null;
         var traits:Vector.<TraitInfo> = new Vector.<TraitInfo>();
         var pool:IConstantPool = abcFile.constantPool;
         methodInfos = abcFile.methodInfo;
         var metadata:Vector.<Metadata> = abcFile.metadataInfo;
         var traitCount:int = AbcSpec.readU30(_byteStream);
         for(var traitIndex:int = 0; traitIndex < traitCount; traitIndex++)
         {
            multiNameIndex = AbcSpec.readU30(_byteStream);
            traitName = pool.multinamePool[multiNameIndex];
            traitMultiname = MultinameUtil.convertToQualifiedName(traitName);
            traitKindValue = AbcSpec.readU8(_byteStream);
            traitKind = TraitKind.determineKind(traitKindValue);
            switch(traitKind)
            {
               case TraitKind.SLOT:
               case TraitKind.CONST:
                  slotOrConstantTrait = new SlotOrConstantTrait();
                  slotOrConstantTrait.slotId = AbcSpec.readU30(_byteStream);
                  slotOrConstantTrait.typeMultiname = pool.multinamePool[AbcSpec.readU30(_byteStream)];
                  slotOrConstantTrait.vindex = AbcSpec.readU30(_byteStream);
                  slotOrConstantTrait.isStatic = isStatic;
                  if(slotOrConstantTrait.vindex > 0)
                  {
                     slotOrConstantTrait.vkind = ConstantKind.determineKind(AbcSpec.readU8(_byteStream));
                     slotOrConstantTrait.defaultValue = this.getSlotOrConstantDefaultValue(pool,slotOrConstantTrait.vindex,slotOrConstantTrait.vkind);
                  }
                  trait = slotOrConstantTrait;
                  break;
               case TraitKind.METHOD:
               case TraitKind.GETTER:
               case TraitKind.SETTER:
                  methodTrait = new MethodTrait();
                  methodTrait.isStatic = isStatic;
                  methodTrait.dispositionId = AbcSpec.readU30(_byteStream);
                  associatedMethodInfo = methodInfos[AbcSpec.readU30(_byteStream)];
                  associatedMethodInfo.methodName = traitMultiname.name;
                  methodTrait.traitMethod = associatedMethodInfo;
                  associatedMethodInfo.as3commonsByteCodeAssignedMethodTrait = methodTrait;
                  methodTrait.traitMethod.as3commonsBytecodeName = traitMultiname;
                  trait = methodTrait;
                  break;
               case TraitKind.CLASS:
                  classTrait = new ClassTrait();
                  classTrait.classSlotId = AbcSpec.readU30(_byteStream);
                  classTrait.classIndex = AbcSpec.readU30(_byteStream);
                  classTrait.classInfo = abcFile.classInfo[classTrait.classIndex];
                  trait = classTrait;
                  break;
               case TraitKind.FUNCTION:
                  functionTrait = new FunctionTrait();
                  functionTrait.functionSlotId = AbcSpec.readU30(_byteStream);
                  functionTrait.functionMethod = methodInfos[AbcSpec.readU30(_byteStream)];
                  functionTrait.functionMethod.methodName = traitMultiname.name;
                  functionTrait.isStatic = isStatic;
                  functionTrait.functionMethod.as3commonsByteCodeAssignedMethodTrait = functionTrait;
                  trait = functionTrait;
            }
            if(traitKindValue & TraitAttributes.METADATA.bitMask << 4)
            {
               traitMetadataCount = AbcSpec.readU30(_byteStream);
               for(traitMetadataIndex = 0; traitMetadataIndex < traitMetadataCount; traitMetadataIndex++)
               {
                  mt = metadata[AbcSpec.readU30(_byteStream)];
                  trait.addMetadata(mt);
               }
            }
            trait.traitMultiname = traitMultiname;
            trait.isFinal = Boolean(traitKindValue >> 4 & TraitAttributes.FINAL.bitMask);
            trait.isOverride = Boolean(traitKindValue >> 4 & TraitAttributes.OVERRIDE.bitMask);
            trait.traitKind = traitKind;
            traits[traits.length] = trait;
         }
         return traits;
      }
      
      protected function getSlotOrConstantDefaultValue(pool:IConstantPool, poolIndex:uint, constantKind:ConstantKind) : *
      {
         return pool.getConstantPoolItem(constantKind.value,poolIndex);
      }
   }
}
