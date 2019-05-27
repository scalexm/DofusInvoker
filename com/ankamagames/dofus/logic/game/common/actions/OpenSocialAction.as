package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class OpenSocialAction implements Action
   {
       
      
      public var id:int;
      
      public function OpenSocialAction()
      {
         super();
      }
      
      public static function create(id:int = -1) : OpenSocialAction
      {
         var a:OpenSocialAction = new OpenSocialAction();
         a.id = id;
         return a;
      }
   }
}
