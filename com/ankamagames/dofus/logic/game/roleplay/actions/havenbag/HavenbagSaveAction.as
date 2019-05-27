package com.ankamagames.dofus.logic.game.roleplay.actions.havenbag
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HavenbagSaveAction implements Action
   {
       
      
      public function HavenbagSaveAction()
      {
         super();
      }
      
      public static function create() : HavenbagSaveAction
      {
         var a:HavenbagSaveAction = new HavenbagSaveAction();
         return a;
      }
   }
}
