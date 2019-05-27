package com.ankamagames.dofus.logic.game.common.actions.alliance
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class AllianceMotdSetRequestAction implements Action
   {
       
      
      public var content:String;
      
      public function AllianceMotdSetRequestAction()
      {
         super();
      }
      
      public static function create(content:String) : AllianceMotdSetRequestAction
      {
         var action:AllianceMotdSetRequestAction = new AllianceMotdSetRequestAction();
         action.content = content;
         return action;
      }
   }
}
