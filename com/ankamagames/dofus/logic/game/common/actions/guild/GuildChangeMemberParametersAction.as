package com.ankamagames.dofus.logic.game.common.actions.guild
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GuildChangeMemberParametersAction implements Action
   {
       
      
      public var memberId:Number;
      
      public var rank:uint;
      
      public var experienceGivenPercent:uint;
      
      public var rights:Array;
      
      public function GuildChangeMemberParametersAction()
      {
         super();
      }
      
      public static function create(pMemberId:Number, pRank:uint, pExperienceGivenPercent:uint, pRights:Array) : GuildChangeMemberParametersAction
      {
         var action:GuildChangeMemberParametersAction = new GuildChangeMemberParametersAction();
         action.memberId = pMemberId;
         action.rank = pRank;
         action.experienceGivenPercent = pExperienceGivenPercent;
         action.rights = pRights;
         return action;
      }
   }
}
