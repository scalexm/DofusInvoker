package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HouseKickAction implements Action
   {
       
      
      public var id:Number;
      
      public function HouseKickAction()
      {
         super();
      }
      
      public static function create(id:Number) : HouseKickAction
      {
         var action:HouseKickAction = new HouseKickAction();
         action.id = id;
         return action;
      }
   }
}
