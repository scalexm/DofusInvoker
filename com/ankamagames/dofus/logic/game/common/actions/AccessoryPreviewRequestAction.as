package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class AccessoryPreviewRequestAction implements Action
   {
       
      
      public var itemGIDs:Vector.<uint>;
      
      public function AccessoryPreviewRequestAction()
      {
         super();
      }
      
      public static function create(itemGIDs:Vector.<uint>) : AccessoryPreviewRequestAction
      {
         var action:AccessoryPreviewRequestAction = new AccessoryPreviewRequestAction();
         action.itemGIDs = itemGIDs;
         return action;
      }
   }
}
