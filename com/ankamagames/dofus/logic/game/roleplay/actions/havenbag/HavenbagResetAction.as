package com.ankamagames.dofus.logic.game.roleplay.actions.havenbag
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HavenbagResetAction implements Action
   {
       
      
      public function HavenbagResetAction()
      {
         super();
      }
      
      public static function create() : HavenbagResetAction
      {
         var a:HavenbagResetAction = new HavenbagResetAction();
         return a;
      }
   }
}
