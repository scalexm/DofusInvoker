package com.ankamagames.dofus.logic.connection.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ShowUpdaterLoginInterfaceAction implements Action
   {
       
      
      public function ShowUpdaterLoginInterfaceAction()
      {
         super();
      }
      
      public function create() : Action
      {
         return new ShowUpdaterLoginInterfaceAction();
      }
   }
}
