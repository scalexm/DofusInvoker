package com.ankamagames.dofus.logic.game.common.actions.chat
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class MoodSmileyRequestAction implements Action
   {
       
      
      public var smileyId:uint;
      
      public function MoodSmileyRequestAction()
      {
         super();
      }
      
      public static function create(id:uint) : MoodSmileyRequestAction
      {
         var a:MoodSmileyRequestAction = new MoodSmileyRequestAction();
         a.smileyId = id;
         return a;
      }
   }
}
