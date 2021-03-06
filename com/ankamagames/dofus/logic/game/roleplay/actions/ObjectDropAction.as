package com.ankamagames.dofus.logic.game.roleplay.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ObjectDropAction implements Action
   {
       
      
      public var objectUID:uint;
      
      public var objectGID:uint;
      
      public var quantity:uint;
      
      public function ObjectDropAction()
      {
         super();
      }
      
      public static function create(pObjectUID:uint, pObjectGID:uint, pQuantity:uint) : ObjectDropAction
      {
         var a:ObjectDropAction = new ObjectDropAction();
         a.objectUID = pObjectUID;
         a.objectGID = pObjectGID;
         a.quantity = pQuantity;
         return a;
      }
   }
}
