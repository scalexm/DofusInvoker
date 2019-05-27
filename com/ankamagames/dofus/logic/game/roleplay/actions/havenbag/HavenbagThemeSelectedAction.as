package com.ankamagames.dofus.logic.game.roleplay.actions.havenbag
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HavenbagThemeSelectedAction implements Action
   {
       
      
      public var themeId:int;
      
      public function HavenbagThemeSelectedAction()
      {
         super();
      }
      
      public static function create(themeId:int) : HavenbagThemeSelectedAction
      {
         var a:HavenbagThemeSelectedAction = new HavenbagThemeSelectedAction();
         a.themeId = themeId;
         return a;
      }
   }
}
