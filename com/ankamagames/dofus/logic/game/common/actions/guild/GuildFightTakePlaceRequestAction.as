package com.ankamagames.dofus.logic.game.common.actions.guild
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GuildFightTakePlaceRequestAction implements Action
   {
       
      
      public var taxCollectorId:Number;
      
      public var replacedCharacterId:Number;
      
      public function GuildFightTakePlaceRequestAction()
      {
         super();
      }
      
      public static function create(pTaxCollectorId:Number, replacedCharacterId:Number) : GuildFightTakePlaceRequestAction
      {
         var action:GuildFightTakePlaceRequestAction = new GuildFightTakePlaceRequestAction();
         action.taxCollectorId = pTaxCollectorId;
         action.replacedCharacterId = replacedCharacterId;
         return action;
      }
   }
}
