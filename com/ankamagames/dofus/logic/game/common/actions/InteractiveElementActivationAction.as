package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.dofus.network.types.game.interactive.InteractiveElement;
   import com.ankamagames.jerakine.handlers.messages.Action;
   import com.ankamagames.jerakine.types.positions.MapPoint;
   
   public class InteractiveElementActivationAction implements Action
   {
       
      
      public var interactiveElement:InteractiveElement;
      
      public var position:MapPoint;
      
      public var skillInstanceId:uint;
      
      public var additionalParam:int;
      
      public function InteractiveElementActivationAction()
      {
         super();
      }
      
      public static function create(ie:InteractiveElement, position:MapPoint, skillInstanceId:uint, additionalParam:int = 0) : InteractiveElementActivationAction
      {
         var a:InteractiveElementActivationAction = new InteractiveElementActivationAction();
         a.interactiveElement = ie;
         a.position = position;
         a.skillInstanceId = skillInstanceId;
         a.additionalParam = additionalParam;
         return a;
      }
   }
}
