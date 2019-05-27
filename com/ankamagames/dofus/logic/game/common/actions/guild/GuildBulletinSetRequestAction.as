package com.ankamagames.dofus.logic.game.common.actions.guild
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class GuildBulletinSetRequestAction implements Action
   {
       
      
      public var content:String;
      
      public var notifyMembers:Boolean;
      
      public function GuildBulletinSetRequestAction()
      {
         super();
      }
      
      public static function create(content:String, notifyMembers:Boolean = true) : GuildBulletinSetRequestAction
      {
         var action:GuildBulletinSetRequestAction = new GuildBulletinSetRequestAction();
         action.content = content;
         action.notifyMembers = notifyMembers;
         return action;
      }
   }
}
