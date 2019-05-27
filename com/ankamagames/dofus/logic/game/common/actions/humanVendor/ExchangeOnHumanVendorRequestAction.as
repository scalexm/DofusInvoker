package com.ankamagames.dofus.logic.game.common.actions.humanVendor
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ExchangeOnHumanVendorRequestAction implements Action
   {
       
      
      public var humanVendorId:Number;
      
      public var humanVendorCell:int;
      
      public function ExchangeOnHumanVendorRequestAction()
      {
         super();
      }
      
      public static function create(pHumanVendorId:Number, pHumanVendorCell:uint) : ExchangeOnHumanVendorRequestAction
      {
         var a:ExchangeOnHumanVendorRequestAction = new ExchangeOnHumanVendorRequestAction();
         a.humanVendorId = pHumanVendorId;
         a.humanVendorCell = pHumanVendorCell;
         return a;
      }
   }
}
