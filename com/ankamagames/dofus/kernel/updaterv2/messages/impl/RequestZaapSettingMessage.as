package com.ankamagames.dofus.kernel.updaterv2.messages.impl
{
   import com.ankamagames.dofus.kernel.updaterv2.messages.IUpdaterOutputMessage;
   
   public class RequestZaapSettingMessage implements IUpdaterOutputMessage
   {
       
      
      private var _name:String;
      
      public function RequestZaapSettingMessage(name:String)
      {
         super();
         this._name = name;
      }
      
      public function serialize() : String
      {
         return null;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}
