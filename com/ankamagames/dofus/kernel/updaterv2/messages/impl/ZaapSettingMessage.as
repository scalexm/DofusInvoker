package com.ankamagames.dofus.kernel.updaterv2.messages.impl
{
   import com.ankamagames.dofus.kernel.updaterv2.messages.IUpdaterInputMessage;
   
   public class ZaapSettingMessage implements IUpdaterInputMessage
   {
       
      
      private var _name:String;
      
      private var _value:String;
      
      private var _error:int;
      
      public function ZaapSettingMessage(name:String, value:String, error:int = 0)
      {
         super();
         this._name = name;
         this._value = value;
         this._error = error;
      }
      
      public function deserialize(data:Object) : void
      {
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get value() : String
      {
         return this._value;
      }
      
      public function get error() : int
      {
         return this._error;
      }
   }
}
