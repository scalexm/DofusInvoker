package org.as3commons.bytecode.abc
{
   import flash.errors.IllegalOperationError;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import org.as3commons.bytecode.abc.enum.ConstantKind;
   import org.as3commons.bytecode.as3commons_bytecode;
   import org.as3commons.bytecode.util.Assertions;
   import org.as3commons.bytecode.util.StringLookup;
   import org.as3commons.lang.IEquals;
   import org.as3commons.lang.StringUtils;
   
   public final class ConstantPool implements IEquals, IConstantPool
   {
      
      private static const NAMESPACE_SET_PROPERTYNAME:String = "namespaceSet";
      
      private static const NAME_PROPERTYNAME:String = "name";
      
      private static const LOCKED_CONSTANTPOOL_ERROR:String = "Constantpool is locked";
       
      
      private var _dupeCheck:Boolean = true;
      
      private var _integerPool:Vector.<int>;
      
      private var _integerLookup:Dictionary;
      
      private var _uintPool:Vector.<uint>;
      
      private var _uintLookup:Dictionary;
      
      private var _doublePool:Vector.<Number>;
      
      private var _doubleLookup:Dictionary;
      
      private var _stringPool:Vector.<String>;
      
      private var _stringLookup:StringLookup;
      
      private var _namespacePool:Vector.<LNamespace>;
      
      private var _namespaceLookup:Dictionary;
      
      private var _namespaceSetPool:Vector.<NamespaceSet>;
      
      private var _namespaceSetLookup:Dictionary;
      
      private var _multinamePool:Vector.<BaseMultiname>;
      
      private var _classInfo:Vector.<ClassInfo>;
      
      private var _multinameLookup:Dictionary;
      
      private var _lookup:Dictionary;
      
      private var _locked:Boolean = false;
      
      private var _rawConstantPool:ByteArray;
      
      public function ConstantPool()
      {
         super();
         this.reset();
      }
      
      public function get locked() : Boolean
      {
         return this._locked;
      }
      
      public function set locked(value:Boolean) : void
      {
         this._locked = value;
      }
      
      public function get dupeCheck() : Boolean
      {
         return this._dupeCheck;
      }
      
      public function set dupeCheck(value:Boolean) : void
      {
         this._dupeCheck = value;
      }
      
      public function reset() : void
      {
         this._integerLookup = new Dictionary();
         this._uintLookup = new Dictionary();
         this._doubleLookup = new Dictionary();
         this._stringLookup = new StringLookup();
         this._namespaceLookup = new Dictionary();
         this._namespaceSetLookup = new Dictionary();
         this._multinameLookup = new Dictionary();
         this._integerPool = new <int>[0];
         this._uintPool = new <uint>[0];
         this._doublePool = new <Number>[NaN];
         this._classInfo = new Vector.<ClassInfo>();
         this._stringPool = new <String>[LNamespace.ASTERISK.name];
         this._integerLookup[0] = 0;
         this._uintLookup[0] = 0;
         this._doubleLookup[NaN] = 0;
         this._stringLookup.set(LNamespace.ASTERISK.name,0);
         this._namespacePool = new <LNamespace>[LNamespace.ASTERISK];
         this._namespaceLookup[LNamespace.ASTERISK.toString()] = 0;
         this._namespaceSetPool = new <NamespaceSet>[new NamespaceSet([LNamespace.ASTERISK])];
         this._namespaceSetLookup[this._namespaceSetPool[0].toString()] = 0;
         this._multinamePool = new <BaseMultiname>[new QualifiedName(LNamespace.ASTERISK.name,LNamespace.ASTERISK)];
         this._multinameLookup[this._multinamePool[0].toString()] = 0;
         this._lookup = new Dictionary();
         this._lookup[ConstantKind.INT] = [this._integerPool,this._integerLookup];
         this._lookup[ConstantKind.UINT] = [this._uintPool,this._uintLookup];
         this._lookup[ConstantKind.DOUBLE] = [this._doublePool,this._doubleLookup];
         this._lookup[ConstantKind.UTF8] = [this._stringPool,this._stringLookup];
         this._lookup[ConstantKind.NAMESPACE] = [this._namespacePool,this._namespaceLookup];
         this._lookup[ConstantKind.PACKAGE_NAMESPACE] = [this._namespacePool,this._namespaceLookup];
         this._lookup[ConstantKind.PACKAGE_INTERNAL_NAMESPACE] = [this._namespacePool,this._namespaceLookup];
         this._lookup[ConstantKind.PROTECTED_NAMESPACE] = [this._namespacePool,this._namespaceLookup];
         this._lookup[ConstantKind.EXPLICIT_NAMESPACE] = [this._namespacePool,this._namespaceLookup];
         this._lookup[ConstantKind.STATIC_PROTECTED_NAMESPACE] = [this._namespacePool,this._namespaceLookup];
         this._lookup[ConstantKind.PRIVATE_NAMESPACE] = [this._namespacePool,this._namespaceLookup];
         this._lookup[ConstantKind.TRUE] = true;
         this._lookup[ConstantKind.FALSE] = false;
         this._lookup[ConstantKind.NULL] = null;
         this._lookup[ConstantKind.UNDEFINED] = undefined;
      }
      
      public function getConstantPoolItem(constantKindValue:uint, poolIndex:uint) : *
      {
         var constantKind:ConstantKind = ConstantKind.determineKind(constantKindValue);
         var retVal:* = this._lookup[constantKind];
         return retVal is Array?retVal[0][poolIndex]:retVal;
      }
      
      public function getConstantPoolItemIndex(constantKind:ConstantKind, item:*) : int
      {
         var retVal:* = this._lookup[constantKind];
         return retVal is Array?retVal[1] is Dictionary?int(retVal[1][item]):int(retVal[1].get(item)):-1;
      }
      
      public function addItemToPool(constantKindValue:ConstantKind, item:*) : int
      {
         var pool:* = this._lookup[constantKindValue];
         if(pool is Array)
         {
            return this.addToPool(pool[0],pool[1],item);
         }
         return 1;
      }
      
      public function get integerPool() : Vector.<int>
      {
         return this._integerPool;
      }
      
      as3commons_bytecode function setIntegerPool(value:Vector.<int>) : void
      {
         this._integerPool = value;
      }
      
      public function get uintPool() : Vector.<uint>
      {
         return this._uintPool;
      }
      
      as3commons_bytecode function setUintPool(value:Vector.<uint>) : void
      {
         this._uintPool = value;
      }
      
      public function get doublePool() : Vector.<Number>
      {
         return this._doublePool;
      }
      
      as3commons_bytecode function setDoublePool(value:Vector.<Number>) : void
      {
         this._doublePool = value;
      }
      
      public function get stringPool() : Vector.<String>
      {
         return this._stringPool;
      }
      
      as3commons_bytecode function setStringPool(value:Vector.<String>) : void
      {
         this._stringPool = value;
      }
      
      public function get namespacePool() : Vector.<LNamespace>
      {
         return this._namespacePool;
      }
      
      as3commons_bytecode function setNamespacePool(value:Vector.<LNamespace>) : void
      {
         this._namespacePool = value;
      }
      
      public function get namespaceSetPool() : Vector.<NamespaceSet>
      {
         return this._namespaceSetPool;
      }
      
      as3commons_bytecode function setNamespaceSetPool(value:Vector.<NamespaceSet>) : void
      {
         this._namespaceSetPool = value;
      }
      
      public function get multinamePool() : Vector.<BaseMultiname>
      {
         return this._multinamePool;
      }
      
      as3commons_bytecode function setMultinamePool(value:Vector.<BaseMultiname>) : void
      {
         this._multinamePool = value;
      }
      
      public function get classInfo() : Vector.<ClassInfo>
      {
         return this._classInfo;
      }
      
      as3commons_bytecode function setClassInfo(value:Vector.<ClassInfo>) : void
      {
         this._classInfo = value;
      }
      
      public function addMultiname(multiname:BaseMultiname) : int
      {
         var mg:MultinameG = null;
         var qn:BaseMultiname = null;
         if(multiname is NamedMultiname)
         {
            this.addString(NamedMultiname(multiname).name);
         }
         if(multiname.hasOwnProperty(NAMESPACE_SET_PROPERTYNAME))
         {
            this.addNamespaceSet(multiname[NAMESPACE_SET_PROPERTYNAME]);
         }
         if(multiname is QualifiedName)
         {
            this.addNamespace(QualifiedName(multiname).nameSpace);
         }
         if(multiname is MultinameG)
         {
            mg = multiname as MultinameG;
            this.addMultiname(mg.qualifiedName);
            for each(qn in mg.parameters)
            {
               this.addMultiname(qn);
            }
         }
         var multinameIndex:int = -1;
         if(this._dupeCheck)
         {
            multinameIndex = this.addObject(this._multinamePool,this._multinameLookup,multiname);
         }
         if(multinameIndex == -1)
         {
            if(!this.locked)
            {
               multinameIndex = this._multinamePool.push(multiname) - 1;
               multiname.poolIndex = multinameIndex;
            }
            else
            {
               throw new Error(LOCKED_CONSTANTPOOL_ERROR);
            }
         }
         return multinameIndex;
      }
      
      protected function validateMultiname(multiname:BaseMultiname) : void
      {
         var qName:QualifiedName = null;
         if(multiname.kind == null)
         {
            throw new IllegalOperationError("Illegal multiname: " + multiname.toString());
         }
         switch(true)
         {
            case multiname is QualifiedName:
               qName = QualifiedName(multiname);
               if(qName.name == null)
               {
                  throw new IllegalOperationError("Illegal QualifiedName: " + qName.toString());
               }
               if(qName.nameSpace == null)
               {
                  throw new IllegalOperationError("Illegal QualifiedName: " + qName.toString());
               }
               if(!this.validateNamespace(qName.nameSpace))
               {
                  throw new IllegalOperationError("Illegal QualifiedName: " + qName.toString());
               }
               break;
         }
      }
      
      protected function validateNamespace(namesp:LNamespace) : Boolean
      {
         return namesp.name != null;
      }
      
      private function addObject(pool:*, lookup:Dictionary, object:Object) : int
      {
         var n:* = undefined;
         if(object.hasOwnProperty(NAME_PROPERTYNAME))
         {
            this.addString(object.name);
         }
         var key:String = null;
         var matchingIndex:int = -1;
         if(this._dupeCheck)
         {
            key = object.toString();
            n = lookup[key];
            matchingIndex = n != null?int(n):-1;
         }
         if(matchingIndex == -1)
         {
            if(!this.locked)
            {
               matchingIndex = pool.push(object) - 1;
               key = key || object.toString();
               lookup[key] = matchingIndex;
            }
            else
            {
               throw new Error(LOCKED_CONSTANTPOOL_ERROR);
            }
         }
         return matchingIndex;
      }
      
      public function getStringPosition(string:String) : int
      {
         return this._stringPool.indexOf(string);
      }
      
      public function getIntPosition(intValue:int) : int
      {
         return this._integerPool.indexOf(intValue);
      }
      
      public function getUintPosition(uintValue:uint) : int
      {
         return this._uintPool.indexOf(uintValue);
      }
      
      public function getDoublePosition(doubleValue:Number) : int
      {
         return this._doublePool.indexOf(doubleValue);
      }
      
      public function getNamespacePosition(namespaze:LNamespace) : int
      {
         var index:int = -1;
         var len:uint = this._namespacePool.length;
         for(var i:int = 0; i < len; i++)
         {
            if(IEquals(this._namespacePool[i]).equals(namespaze))
            {
               index = i;
               break;
            }
         }
         return index;
      }
      
      public function getNamespaceSetPosition(namespaceSet:NamespaceSet) : int
      {
         var index:int = -1;
         var len:uint = this._namespaceSetPool.length;
         for(var i:int = 0; i < len; i++)
         {
            if(IEquals(this._namespaceSetPool[i]).equals(namespaceSet))
            {
               index = i;
               break;
            }
         }
         return index;
      }
      
      public function getMultinamePosition(multiname:BaseMultiname) : int
      {
         var index:int = -1;
         var len:uint = this._multinamePool.length;
         for(var i:int = 0; i < len; i++)
         {
            if(IEquals(this._multinamePool[i]).equals(multiname))
            {
               index = i;
               break;
            }
         }
         return index;
      }
      
      public function getMultinamePositionByName(multinameName:String) : int
      {
         var multiname:NamedMultiname = null;
         var multinameIndex:int = -1;
         var len:uint = this._multinamePool.length;
         for(var i:int = 0; i < len; i++)
         {
            multiname = this._multinamePool[i] as NamedMultiname;
            if(multiname != null)
            {
               if(NamedMultiname(multiname).name == multinameName)
               {
                  multinameIndex = i;
                  break;
               }
            }
         }
         return multinameIndex;
      }
      
      public function addString(string:String) : int
      {
         return this.addToPool(this._stringPool,this._stringLookup,string);
      }
      
      public function addInt(integer:int) : int
      {
         return this.addToPool(this._integerPool,this._integerLookup,integer);
      }
      
      public function addUint(uinteger:uint) : int
      {
         return this.addToPool(this._uintPool,this._uintLookup,uinteger);
      }
      
      public function addDouble(double:Number) : int
      {
         return this.addToPool(this._doublePool,this._doubleLookup,double);
      }
      
      public function addNamespace(namespaceValue:LNamespace) : int
      {
         return this.addObject(this._namespacePool,this._namespaceLookup,namespaceValue);
      }
      
      public function addNamespaceSet(namespaceSet:NamespaceSet) : int
      {
         var namespaze:LNamespace = null;
         for each(namespaze in namespaceSet.namespaces)
         {
            this.addNamespace(namespaze);
         }
         return this.addObject(this._namespaceSetPool,this._namespaceSetLookup,namespaceSet);
      }
      
      public function initializeLookups() : void
      {
         var i:int = 0;
         var u:uint = 0;
         var n:Number = NaN;
         var s:String = null;
         var mn:BaseMultiname = null;
         var ns:LNamespace = null;
         var nss:NamespaceSet = null;
         var idx:int = 0;
         for each(i in this._integerPool)
         {
            this._integerLookup[i] = idx++;
         }
         idx = 0;
         for each(u in this._uintPool)
         {
            this._uintLookup[u] = idx++;
         }
         idx = 0;
         for each(n in this._doublePool)
         {
            this._doubleLookup[n] = idx++;
         }
         idx = 0;
         for each(s in this._stringPool)
         {
            this._stringLookup.set(s,idx++);
         }
         idx = 0;
         for each(mn in this._multinamePool)
         {
            this._multinameLookup[mn.toString()] = idx++;
         }
         idx = 0;
         for each(ns in this._namespacePool)
         {
            this._namespaceLookup[ns.toString()] = idx++;
         }
         idx = 0;
         for each(nss in this._namespaceSetPool)
         {
            this._namespaceSetLookup[nss.toString()] = idx++;
         }
      }
      
      public function addToPool(pool:*, lookup:*, item:Object) : int
      {
         var n:* = lookup is Dictionary?lookup[item]:lookup.get(item);
         var index:int = n != null?int(n):-1;
         if(index > -1)
         {
            return index;
         }
         if(!this.locked)
         {
            index = pool.push(item) - 1;
            if(lookup is Dictionary)
            {
               lookup[item] = index;
            }
            else
            {
               lookup.set(item,index);
            }
            return index;
         }
         throw new Error(LOCKED_CONSTANTPOOL_ERROR);
      }
      
      public function equals(other:Object) : Boolean
      {
         var constantPool:ConstantPool = ConstantPool(other);
         return Assertions.assertArrayContentsEqual(this._integerPool,constantPool._integerPool) && Assertions.assertArrayContentsEqual(this._uintPool,constantPool._uintPool) && Assertions.assertArrayContentsEqual(this._doublePool,constantPool._doublePool) && Assertions.assertArrayContentsEqual(this._stringPool,constantPool._stringPool) && Assertions.assertArrayContentsEqual(this._namespacePool,constantPool._namespacePool) && Assertions.assertArrayContentsEqual(this._namespaceSetPool,constantPool._namespaceSetPool) && Assertions.assertVectorContentsEqual(this._multinamePool,constantPool._multinamePool);
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("Integer Pool: {0}\n" + "Uint Pool: {1}\n" + "Double Pool: {2}\n" + "String Pool:\n\t{3}" + "\nNamespace Pool:\n\t{4}" + "\nNamespace Set Pool:\n\t{5}" + "\nMultiname Pool:\n\t{6}",this._integerPool.join(),this._uintPool.join(),this._doublePool.join(),this._stringPool.join("\n\t"),this._namespacePool.join("\n\t"),this._namespaceSetPool.join("\n\t"),this._multinamePool.join("\n\t"));
      }
      
      public function get rawConstantPool() : ByteArray
      {
         return this._rawConstantPool;
      }
      
      public function set rawConstantPool(value:ByteArray) : void
      {
         this._rawConstantPool = value;
      }
   }
}
