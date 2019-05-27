package com.ankamagames.dofus.logic.game.roleplay.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class TeleportRequestAction implements Action
   {
       
      
      public var mapId:Number;
      
      public var sourceType:uint;
      
      public var destinationType:uint;
      
      public var cost:uint;
      
      public function TeleportRequestAction()
      {
         super();
      }
      
      public static function create(sourceType:uint, destinationType:uint, mapId:Number, cost:uint) : TeleportRequestAction
      {
         var action:TeleportRequestAction = new TeleportRequestAction();
         action.sourceType = sourceType;
         action.destinationType = destinationType;
         action.mapId = mapId;
         action.cost = cost;
         return action;
      }
   }
}
