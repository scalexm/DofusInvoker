package com.ankamagames.dofus.logic.game.common.actions.dare
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class DareInformationsRequestAction implements Action
   {
       
      
      public var dareId:Number;
      
      public function DareInformationsRequestAction()
      {
         super();
      }
      
      public static function create(dareId:Number) : DareInformationsRequestAction
      {
         var a:DareInformationsRequestAction = new DareInformationsRequestAction();
         a.dareId = dareId;
         return a;
      }
   }
}
