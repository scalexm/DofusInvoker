package com.ankamagames.dofus.logic.game.common.actions.roleplay
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class JoinFightRequestAction implements Action
   {
       
      
      public var fightId:uint;
      
      public var teamLeaderId:Number;
      
      public function JoinFightRequestAction()
      {
         super();
      }
      
      public static function create(fightId:uint, teamLeaderId:Number) : JoinFightRequestAction
      {
         var a:JoinFightRequestAction = new JoinFightRequestAction();
         a.fightId = fightId;
         a.teamLeaderId = teamLeaderId;
         return a;
      }
   }
}
