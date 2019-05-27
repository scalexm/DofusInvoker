package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HouseLockFromInsideAction implements Action
   {
       
      
      public var code:String;
      
      public function HouseLockFromInsideAction()
      {
         super();
      }
      
      public static function create(code:String) : HouseLockFromInsideAction
      {
         var action:HouseLockFromInsideAction = new HouseLockFromInsideAction();
         action.code = code;
         return action;
      }
   }
}
