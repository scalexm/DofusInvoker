package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class OpenSubhintListAction implements Action
   {
       
      
      public function OpenSubhintListAction()
      {
         super();
      }
      
      public static function create() : OpenSubhintListAction
      {
         var a:OpenSubhintListAction = new OpenSubhintListAction();
         return a;
      }
   }
}
