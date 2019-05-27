package com.ankamagames.dofus.logic.game.common.actions.mount
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeHandleMountStableAction implements Action
   {
       
      
      public var ridesId:Array;
      
      public var actionType:int;
      
      public function ExchangeHandleMountStableAction()
      {
         super();
      }
      
      public static function create(actionType:uint, mountsId:Array) : ExchangeHandleMountStableAction
      {
         var act:ExchangeHandleMountStableAction = new ExchangeHandleMountStableAction();
         act.actionType = actionType;
         act.ridesId = mountsId;
         return act;
      }
   }
}
