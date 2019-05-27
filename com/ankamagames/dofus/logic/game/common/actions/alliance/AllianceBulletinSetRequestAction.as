package com.ankamagames.dofus.logic.game.common.actions.alliance
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class AllianceBulletinSetRequestAction implements Action
   {
       
      
      public var content:String;
      
      public var notifyMembers:Boolean;
      
      public function AllianceBulletinSetRequestAction()
      {
         super();
      }
      
      public static function create(content:String, notifyMembers:Boolean = true) : AllianceBulletinSetRequestAction
      {
         var action:AllianceBulletinSetRequestAction = new AllianceBulletinSetRequestAction();
         action.content = content;
         action.notifyMembers = notifyMembers;
         return action;
      }
   }
}
