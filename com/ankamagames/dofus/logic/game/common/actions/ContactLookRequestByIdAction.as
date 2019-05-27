package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ContactLookRequestByIdAction implements Action
   {
       
      
      private var _contactType:uint;
      
      private var _entityId:Number;
      
      public function ContactLookRequestByIdAction()
      {
         super();
      }
      
      public static function create(pContactType:uint, pEntityId:Number) : ContactLookRequestByIdAction
      {
         var clrbia:ContactLookRequestByIdAction = new ContactLookRequestByIdAction();
         clrbia._contactType = pContactType;
         clrbia._entityId = pEntityId;
         return clrbia;
      }
      
      public function get contactType() : uint
      {
         return this._contactType;
      }
      
      public function get entityId() : Number
      {
         return this._entityId;
      }
   }
}
