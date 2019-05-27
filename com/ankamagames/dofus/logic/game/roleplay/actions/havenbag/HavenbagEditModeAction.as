package com.ankamagames.dofus.logic.game.roleplay.actions.havenbag
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HavenbagEditModeAction implements Action
   {
       
      
      public var isActive:Boolean;
      
      public function HavenbagEditModeAction()
      {
         super();
      }
      
      public static function create(isActive:Boolean) : HavenbagEditModeAction
      {
         var a:HavenbagEditModeAction = new HavenbagEditModeAction();
         a.isActive = isActive;
         return a;
      }
   }
}
