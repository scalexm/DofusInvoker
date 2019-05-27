package com.ankamagames.dofus.logic.game.roleplay.actions.havenbag
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HavenbagEnterAction implements Action
   {
       
      
      public var ownerId:Number;
      
      public function HavenbagEnterAction()
      {
         super();
      }
      
      public static function create(ownerId:Number = -1) : HavenbagEnterAction
      {
         var a:HavenbagEnterAction = new HavenbagEnterAction();
         a.ownerId = ownerId;
         return a;
      }
   }
}
