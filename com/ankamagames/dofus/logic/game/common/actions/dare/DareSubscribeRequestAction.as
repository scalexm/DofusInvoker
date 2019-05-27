package com.ankamagames.dofus.logic.game.common.actions.dare
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class DareSubscribeRequestAction implements Action
   {
       
      
      public var dareId:Number;
      
      public var subscribe:Boolean;
      
      public function DareSubscribeRequestAction()
      {
         super();
      }
      
      public static function create(dareId:Number, subscribe:Boolean) : DareSubscribeRequestAction
      {
         var a:DareSubscribeRequestAction = new DareSubscribeRequestAction();
         a.dareId = dareId;
         a.subscribe = subscribe;
         return a;
      }
   }
}
