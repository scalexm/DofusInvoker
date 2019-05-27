package com.ankamagames.dofus.logic.game.roleplay.actions.havenbag
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HavenbagInvitePlayerAction implements Action
   {
       
      
      public var guestId:Number;
      
      public var invite:Boolean;
      
      public function HavenbagInvitePlayerAction()
      {
         super();
      }
      
      public static function create(guestId:Number, invite:Boolean) : HavenbagInvitePlayerAction
      {
         var a:HavenbagInvitePlayerAction = new HavenbagInvitePlayerAction();
         a.guestId = guestId;
         a.invite = invite;
         return a;
      }
   }
}
