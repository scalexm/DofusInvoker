package com.ankamagames.dofus.logic.game.roleplay.actions.havenbag
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class HavenbagPermissionsUpdateRequestAction implements Action
   {
       
      
      public var permissions:uint;
      
      public function HavenbagPermissionsUpdateRequestAction()
      {
         super();
      }
      
      public static function create(permissions:uint) : HavenbagPermissionsUpdateRequestAction
      {
         var a:HavenbagPermissionsUpdateRequestAction = new HavenbagPermissionsUpdateRequestAction();
         a.permissions = permissions;
         return a;
      }
   }
}
