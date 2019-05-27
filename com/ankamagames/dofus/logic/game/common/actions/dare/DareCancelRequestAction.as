package com.ankamagames.dofus.logic.game.common.actions.dare
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class DareCancelRequestAction implements Action
   {
       
      
      public var dareId:Number;
      
      public function DareCancelRequestAction()
      {
         super();
      }
      
      public static function create(dareId:Number) : DareCancelRequestAction
      {
         var a:DareCancelRequestAction = new DareCancelRequestAction();
         a.dareId = dareId;
         return a;
      }
   }
}
