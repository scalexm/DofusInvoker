package com.ankamagames.atouin.types
{
   import com.ankamagames.jerakine.interfaces.ICustomUnicNameGetter;
   import com.ankamagames.tiphon.display.TiphonSprite;
   import com.ankamagames.tiphon.types.look.TiphonEntityLook;
   
   public class WorldEntitySprite extends TiphonSprite implements ICustomUnicNameGetter
   {
       
      
      private var _cellId:int;
      
      private var _identifier:int;
      
      private var _name:String;
      
      public function WorldEntitySprite(look:TiphonEntityLook, cellId:int, identifier:int)
      {
         super(look);
         this._name = "mapGfx::" + identifier;
         this._cellId = cellId;
         this._identifier = identifier;
      }
      
      public function get cellId() : int
      {
         return this._cellId;
      }
      
      public function get identifier() : int
      {
         return this._identifier;
      }
      
      public function get customUnicName() : String
      {
         return this._name;
      }
   }
}
