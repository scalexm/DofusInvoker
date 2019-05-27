package com.ankamagames.dofus.logic.connection.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ServerSelectionAction implements Action
   {
       
      
      public var serverId:int;
      
      public function ServerSelectionAction()
      {
         super();
      }
      
      public static function create(serverId:int) : ServerSelectionAction
      {
         var a:ServerSelectionAction = new ServerSelectionAction();
         a.serverId = serverId;
         return a;
      }
   }
}
