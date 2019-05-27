package com.ankamagames.dofus.logic.game.roleplay.actions.havenbag
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HavenbagRoomSelectedAction implements Action
   {
       
      
      public var room:uint;
      
      public function HavenbagRoomSelectedAction()
      {
         super();
      }
      
      public static function create(room:uint) : HavenbagRoomSelectedAction
      {
         var a:HavenbagRoomSelectedAction = new HavenbagRoomSelectedAction();
         a.room = room;
         return a;
      }
   }
}
