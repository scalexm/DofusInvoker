package com.ankamagames.dofus.logic.game.common.actions.social
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ContactsListRequestAction implements Action
   {
       
      
      public function ContactsListRequestAction()
      {
         super();
      }
      
      public static function create() : ContactsListRequestAction
      {
         var a:ContactsListRequestAction = new ContactsListRequestAction();
         return a;
      }
   }
}
