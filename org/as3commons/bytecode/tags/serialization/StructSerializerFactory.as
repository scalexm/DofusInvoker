package org.as3commons.bytecode.tags.serialization
{
   import flash.utils.Dictionary;
   import org.as3commons.bytecode.tags.struct.FillStyle;
   import org.as3commons.bytecode.tags.struct.RGB;
   import org.as3commons.bytecode.tags.struct.RGBA;
   import org.as3commons.bytecode.tags.struct.Symbol;
   
   public class StructSerializerFactory implements IStructSerializerFactory
   {
       
      
      private var _createdFactories:Dictionary;
      
      private var _factoryClasses:Dictionary;
      
      public function StructSerializerFactory()
      {
         super();
         this.initFactory();
      }
      
      protected function initFactory() : void
      {
         this._createdFactories = new Dictionary();
         this._factoryClasses = new Dictionary();
         this._factoryClasses[FillStyle] = FillStyleSerializer;
         this._factoryClasses[RGB] = RGBSerializer;
         this._factoryClasses[RGBA] = RGBASerializer;
         this._factoryClasses[Symbol] = SymbolSerializer;
      }
      
      public function createSerializer(structClass:Class) : IStructSerializer
      {
         if(this._createdFactories[structClass] == null)
         {
            if(this._factoryClasses[structClass] != null)
            {
               this._createdFactories[structClass] = new this._factoryClasses[structClass]();
            }
            else
            {
               throw new Error("Unable to create serializer for struct class " + structClass);
            }
         }
         return this._createdFactories[structClass];
      }
   }
}
