package com.ankamagames.dofus.logic.game.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class OpenSmileysAction implements Action
   {
       
      
      public var type:int;
      
      public var forceOpen:String;
      
      public function OpenSmileysAction()
      {
         super();
      }
      
      public static function create(pType:int, pForceOpen:String = "") : OpenSmileysAction
      {
         var a:OpenSmileysAction = new OpenSmileysAction();
         a.type = pType;
         a.forceOpen = pForceOpen;
         return a;
      }
   }
}
