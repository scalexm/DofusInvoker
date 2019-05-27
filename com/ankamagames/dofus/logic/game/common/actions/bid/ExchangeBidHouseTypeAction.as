package com.ankamagames.dofus.logic.game.common.actions.bid
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeBidHouseTypeAction implements Action
   {
       
      
      public var type:uint;
      
      public var follow:Boolean;
      
      public function ExchangeBidHouseTypeAction()
      {
         super();
      }
      
      public static function create(pType:uint, pFollow:Boolean) : ExchangeBidHouseTypeAction
      {
         var a:ExchangeBidHouseTypeAction = new ExchangeBidHouseTypeAction();
         a.type = pType;
         a.follow = pFollow;
         return a;
      }
   }
}
