package org.as3commons.bytecode.io
{
   import flash.utils.ByteArray;
   import org.as3commons.bytecode.abc.AbcFile;
   import org.as3commons.bytecode.abc.BaseMultiname;
   import org.as3commons.bytecode.abc.IConstantPool;
   import org.as3commons.bytecode.abc.LNamespace;
   import org.as3commons.bytecode.abc.Multiname;
   import org.as3commons.bytecode.abc.MultinameG;
   import org.as3commons.bytecode.abc.MultinameL;
   import org.as3commons.bytecode.abc.NamespaceSet;
   import org.as3commons.bytecode.abc.QualifiedName;
   import org.as3commons.bytecode.abc.RuntimeQualifiedName;
   import org.as3commons.bytecode.abc.RuntimeQualifiedNameL;
   import org.as3commons.bytecode.abc.TraitInfo;
   import org.as3commons.bytecode.abc.enum.MultinameKind;
   import org.as3commons.bytecode.abc.enum.NamespaceKind;
   
   public class AbstractAbcDeserializer implements IAbcDeserializer
   {
      
      private static const UTF8_BAD_PREFIX:String = "UTF8_BAD";
       
      
      private var _illegalCount:uint = 0;
      
      protected var _byteStream:ByteArray;
      
      private var _constantPoolEndPosition:uint = 0;
      
      public function AbstractAbcDeserializer(byteArray:ByteArray = null)
      {
         super();
         this._byteStream = byteArray;
      }
      
      public function get byteStream() : ByteArray
      {
         return this._byteStream;
      }
      
      public function set byteStream(value:ByteArray) : void
      {
         this._byteStream = value;
      }
      
      public function get methodBodyExtractionMethod() : MethodBodyExtractionKind
      {
         return null;
      }
      
      public function set methodBodyExtractionMethod(value:MethodBodyExtractionKind) : void
      {
      }
      
      public function get constantPoolEndPosition() : uint
      {
         return this._constantPoolEndPosition;
      }
      
      public function deserializeConstantPool(pool:IConstantPool) : IConstantPool
      {
         var itemCount:int = 0;
         var i:uint = 0;
         var result:* = 0;
         var kind:uint = 0;
         var namespaceIndexRefCount:int = 0;
         var namespaceArray:Array = null;
         var j:int = 0;
         var name:String = null;
         var ns:LNamespace = null;
         var nss:NamespaceSet = null;
         var qualifiedName:QualifiedName = null;
         var paramCount:uint = 0;
         var params:Array = null;
         var ints:Vector.<int> = pool.integerPool;
         var uints:Vector.<uint> = pool.uintPool;
         var doubles:Vector.<Number> = pool.doublePool;
         var strings:Vector.<String> = pool.stringPool;
         var namespaces:Vector.<LNamespace> = pool.namespacePool;
         var namespaceSets:Vector.<NamespaceSet> = pool.namespaceSetPool;
         var multiNames:Vector.<BaseMultiname> = pool.multinamePool;
         result = int(this._byteStream.readUnsignedByte());
         if(result & 128)
         {
            result = result & 127 | this._byteStream.readUnsignedByte() << 7;
            if(result & 16384)
            {
               result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
               if(result & 2097152)
               {
                  result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                  if(result & 268435456)
                  {
                     result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                  }
               }
            }
         }
         i = 0;
         itemCount = --result;
         while(i < itemCount)
         {
            result = int(this._byteStream.readUnsignedByte());
            if(result & 128)
            {
               result = result & 127 | this._byteStream.readUnsignedByte() << 7;
               if(result & 16384)
               {
                  result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                  if(result & 2097152)
                  {
                     result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                     if(result & 268435456)
                     {
                        result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                     }
                  }
               }
            }
            ints[++i] = result;
         }
         result = int(this._byteStream.readUnsignedByte());
         if(result & 128)
         {
            result = result & 127 | this._byteStream.readUnsignedByte() << 7;
            if(result & 16384)
            {
               result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
               if(result & 2097152)
               {
                  result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                  if(result & 268435456)
                  {
                     result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                  }
               }
            }
         }
         i = 0;
         itemCount = --result;
         while(i < itemCount)
         {
            result = int(this._byteStream.readUnsignedByte());
            if(result & 128)
            {
               result = result & 127 | this._byteStream.readUnsignedByte() << 7;
               if(result & 16384)
               {
                  result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                  if(result & 2097152)
                  {
                     result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                     if(result & 268435456)
                     {
                        result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                     }
                  }
               }
            }
            uints[++i] = result;
         }
         result = int(this._byteStream.readUnsignedByte());
         if(result & 128)
         {
            result = result & 127 | this._byteStream.readUnsignedByte() << 7;
            if(result & 16384)
            {
               result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
               if(result & 2097152)
               {
                  result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                  if(result & 268435456)
                  {
                     result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                  }
               }
            }
         }
         i = 0;
         itemCount = --result;
         while(i < itemCount)
         {
            doubles[++i] = this._byteStream.readDouble();
         }
         result = int(this._byteStream.readUnsignedByte());
         if(result & 128)
         {
            result = result & 127 | this._byteStream.readUnsignedByte() << 7;
            if(result & 16384)
            {
               result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
               if(result & 2097152)
               {
                  result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                  if(result & 268435456)
                  {
                     result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                  }
               }
            }
         }
         i = 0;
         itemCount = --result;
         while(i < itemCount)
         {
            result = int(this._byteStream.readUnsignedByte());
            if(result & 128)
            {
               result = result & 127 | this._byteStream.readUnsignedByte() << 7;
               if(result & 16384)
               {
                  result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                  if(result & 2097152)
                  {
                     result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                     if(result & 268435456)
                     {
                        result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                     }
                  }
               }
            }
            strings[++i] = this._byteStream.readUTFBytes(result);
         }
         result = int(this._byteStream.readUnsignedByte());
         if(result & 128)
         {
            result = result & 127 | this._byteStream.readUnsignedByte() << 7;
            if(result & 16384)
            {
               result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
               if(result & 2097152)
               {
                  result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                  if(result & 268435456)
                  {
                     result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                  }
               }
            }
         }
         i = 0;
         itemCount = --result;
         while(i < itemCount)
         {
            kind = 255 & this._byteStream[this._byteStream.position++];
            result = int(this._byteStream.readUnsignedByte());
            if(result & 128)
            {
               result = result & 127 | this._byteStream.readUnsignedByte() << 7;
               if(result & 16384)
               {
                  result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                  if(result & 2097152)
                  {
                     result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                     if(result & 268435456)
                     {
                        result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                     }
                  }
               }
            }
            namespaces[++i] = new LNamespace(NamespaceKind.determineKind(kind),strings[result]);
         }
         result = int(this._byteStream.readUnsignedByte());
         if(result & 128)
         {
            result = result & 127 | this._byteStream.readUnsignedByte() << 7;
            if(result & 16384)
            {
               result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
               if(result & 2097152)
               {
                  result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                  if(result & 268435456)
                  {
                     result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                  }
               }
            }
         }
         i = 0;
         itemCount = --result;
         while(i < itemCount)
         {
            result = int(this._byteStream.readUnsignedByte());
            if(result & 128)
            {
               result = result & 127 | this._byteStream.readUnsignedByte() << 7;
               if(result & 16384)
               {
                  result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                  if(result & 2097152)
                  {
                     result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                     if(result & 268435456)
                     {
                        result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                     }
                  }
               }
            }
            namespaceIndexRefCount = result;
            namespaceArray = [];
            j = namespaceArray.length - 1;
            while(--namespaceIndexRefCount - -1)
            {
               result = int(this._byteStream.readUnsignedByte());
               if(result & 128)
               {
                  result = result & 127 | this._byteStream.readUnsignedByte() << 7;
                  if(result & 16384)
                  {
                     result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                     if(result & 2097152)
                     {
                        result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                        if(result & 268435456)
                        {
                           result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                        }
                     }
                  }
               }
               namespaceArray[++j] = namespaces[result];
            }
            namespaceSets[++i] = new NamespaceSet(namespaceArray);
         }
         result = int(this._byteStream.readUnsignedByte());
         if(result & 128)
         {
            result = result & 127 | this._byteStream.readUnsignedByte() << 7;
            if(result & 16384)
            {
               result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
               if(result & 2097152)
               {
                  result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                  if(result & 268435456)
                  {
                     result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                  }
               }
            }
         }
         i = 0;
         itemCount = --result;
         while(i < itemCount)
         {
            i++;
            kind = 255 & this._byteStream[this._byteStream.position++];
            if(kind == 7 || kind == 13)
            {
               result = int(this._byteStream.readUnsignedByte());
               if(result & 128)
               {
                  result = result & 127 | this._byteStream.readUnsignedByte() << 7;
                  if(result & 16384)
                  {
                     result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                     if(result & 2097152)
                     {
                        result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                        if(result & 268435456)
                        {
                           result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                        }
                     }
                  }
               }
               ns = namespaces[result];
               result = int(this._byteStream.readUnsignedByte());
               if(result & 128)
               {
                  result = result & 127 | this._byteStream.readUnsignedByte() << 7;
                  if(result & 16384)
                  {
                     result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                     if(result & 2097152)
                     {
                        result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                        if(result & 268435456)
                        {
                           result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                        }
                     }
                  }
               }
               multiNames[i] = new QualifiedName(strings[result],ns,kind == 7?MultinameKind.QNAME:MultinameKind.QNAME_A);
            }
            else if(kind == 15 || kind == 16)
            {
               result = int(this._byteStream.readUnsignedByte());
               if(result & 128)
               {
                  result = result & 127 | this._byteStream.readUnsignedByte() << 7;
                  if(result & 16384)
                  {
                     result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                     if(result & 2097152)
                     {
                        result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                        if(result & 268435456)
                        {
                           result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                        }
                     }
                  }
               }
               multiNames[i] = new RuntimeQualifiedName(strings[result],kind == 15?MultinameKind.RTQNAME:MultinameKind.RTQNAME_A);
            }
            else if(kind == 17 || kind == 18)
            {
               multiNames[i] = new RuntimeQualifiedNameL(kind == 17?MultinameKind.RTQNAME_L:MultinameKind.RTQNAME_LA);
            }
            else if(kind == 9 || kind == 14)
            {
               result = int(this._byteStream.readUnsignedByte());
               if(result & 128)
               {
                  result = result & 127 | this._byteStream.readUnsignedByte() << 7;
                  if(result & 16384)
                  {
                     result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                     if(result & 2097152)
                     {
                        result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                        if(result & 268435456)
                        {
                           result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                        }
                     }
                  }
               }
               name = strings[result];
               result = int(this._byteStream.readUnsignedByte());
               if(result & 128)
               {
                  result = result & 127 | this._byteStream.readUnsignedByte() << 7;
                  if(result & 16384)
                  {
                     result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                     if(result & 2097152)
                     {
                        result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                        if(result & 268435456)
                        {
                           result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                        }
                     }
                  }
               }
               nss = namespaceSets[result];
               multiNames[i] = new Multiname(name,nss,kind == 9?MultinameKind.MULTINAME:MultinameKind.MULTINAME_A);
            }
            else if(kind == 27 || kind == 28)
            {
               result = int(this._byteStream.readUnsignedByte());
               if(result & 128)
               {
                  result = result & 127 | this._byteStream.readUnsignedByte() << 7;
                  if(result & 16384)
                  {
                     result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                     if(result & 2097152)
                     {
                        result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                        if(result & 268435456)
                        {
                           result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                        }
                     }
                  }
               }
               multiNames[i] = new MultinameL(namespaceSets[result],kind == 27?MultinameKind.MULTINAME_L:MultinameKind.MULTINAME_LA);
            }
            else if(kind == 29)
            {
               result = int(this._byteStream.readUnsignedByte());
               if(result & 128)
               {
                  result = result & 127 | this._byteStream.readUnsignedByte() << 7;
                  if(result & 16384)
                  {
                     result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                     if(result & 2097152)
                     {
                        result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                        if(result & 268435456)
                        {
                           result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                        }
                     }
                  }
               }
               qualifiedName = multiNames[result] as QualifiedName;
               result = int(this._byteStream.readUnsignedByte());
               if(result & 128)
               {
                  result = result & 127 | this._byteStream.readUnsignedByte() << 7;
                  if(result & 16384)
                  {
                     result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                     if(result & 2097152)
                     {
                        result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                        if(result & 268435456)
                        {
                           result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                        }
                     }
                  }
               }
               paramCount = result;
               params = [];
               j = 0;
               while(paramCount--)
               {
                  result = int(this._byteStream.readUnsignedByte());
                  if(result & 128)
                  {
                     result = result & 127 | this._byteStream.readUnsignedByte() << 7;
                     if(result & 16384)
                     {
                        result = result & 16383 | this._byteStream.readUnsignedByte() << 14;
                        if(result & 2097152)
                        {
                           result = result & 2097151 | this._byteStream.readUnsignedByte() << 21;
                           if(result & 268435456)
                           {
                              result = result & 268435455 | this._byteStream.readUnsignedByte() << 28;
                           }
                        }
                     }
                  }
                  params[j++] = multiNames[result];
               }
               multiNames[i] = new MultinameG(qualifiedName,params,MultinameKind.GENERIC);
            }
         }
         this._constantPoolEndPosition = this._byteStream.position;
         return pool;
      }
      
      public function deserialize(positionInByteArrayToReadFrom:int = 0) : AbcFile
      {
         return null;
      }
      
      public function deserializeClassInfos(abcFile:AbcFile, pool:IConstantPool, classCount:int) : void
      {
      }
      
      public function deserializeMethodBodies(abcFile:AbcFile, pool:IConstantPool) : void
      {
      }
      
      public function deserializeScriptInfos(abcFile:AbcFile) : void
      {
      }
      
      public function deserializeInstanceInfo(abcFile:AbcFile, pool:IConstantPool) : int
      {
         return 0;
      }
      
      public function deserializeMetadata(abcFile:AbcFile, pool:IConstantPool) : void
      {
      }
      
      public function deserializeMethodInfos(abcFile:AbcFile, pool:IConstantPool) : void
      {
      }
      
      public function deserializeTraitsInfo(abcFile:AbcFile, byteStream:ByteArray, isStatic:Boolean = false, className:String = "") : Vector.<TraitInfo>
      {
         return null;
      }
   }
}
