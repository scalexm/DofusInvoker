package com.ankamagames.dofus.logic.game.common.actions.guild
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GuildFactsRequestAction implements Action
   {
       
      
      public var guildId:uint;
      
      public function GuildFactsRequestAction()
      {
         super();
      }
      
      public static function create(guildId:uint) : GuildFactsRequestAction
      {
         var action:GuildFactsRequestAction = new GuildFactsRequestAction();
         action.guildId = guildId;
         return action;
      }
   }
}
