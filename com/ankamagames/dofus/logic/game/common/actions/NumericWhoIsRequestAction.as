package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class NumericWhoIsRequestAction implements Action
   {
       
      
      public var playerId:Number;
      
      public function NumericWhoIsRequestAction()
      {
         super();
      }
      
      public static function create(playerId:Number) : NumericWhoIsRequestAction
      {
         var a:NumericWhoIsRequestAction = new NumericWhoIsRequestAction();
         a.playerId = playerId;
         return a;
      }
   }
}
