package com.ankamagames.dofus.misc.lists
{
   import com.ankamagames.dofus.logic.game.common.actions.breach.BreachExitRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.breach.BreachInvitationAnswerAction;
   import com.ankamagames.dofus.logic.game.common.actions.breach.BreachInvitationRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.breach.BreachKickRequestAction;
   import com.ankamagames.dofus.logic.game.common.actions.breach.BreachRewardBuyAction;
   import com.ankamagames.dofus.logic.game.common.actions.breach.BreachSaveBuyAction;
   import com.ankamagames.dofus.logic.game.common.actions.breach.BreachTeleportRequestAction;
   import com.ankamagames.dofus.misc.utils.DofusApiAction;
   
   public class ApiBreachActionList
   {
      
      public static const BreachInvitationRequest:DofusApiAction = new DofusApiAction("BreachInvitationRequest",BreachInvitationRequestAction);
      
      public static const BreachInvitationAnswer:DofusApiAction = new DofusApiAction("BreachInvitationAnswer",BreachInvitationAnswerAction);
      
      public static const BreachKickRequest:DofusApiAction = new DofusApiAction("BreachKickRequest",BreachKickRequestAction);
      
      public static const BreachSaveBuy:DofusApiAction = new DofusApiAction("BreachSaveBuy",BreachSaveBuyAction);
      
      public static const BreachRewardBuy:DofusApiAction = new DofusApiAction("BreachRewardBuy",BreachRewardBuyAction);
      
      public static const BreachExitRequest:DofusApiAction = new DofusApiAction("BreachExitRequest",BreachExitRequestAction);
      
      public static const BreachTeleportRequest:DofusApiAction = new DofusApiAction("BreachTeleportRequest",BreachTeleportRequestAction);
       
      
      public function ApiBreachActionList()
      {
         super();
      }
   }
}
