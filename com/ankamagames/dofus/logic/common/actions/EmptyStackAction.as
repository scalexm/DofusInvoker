package com.ankamagames.dofus.logic.common.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class EmptyStackAction implements Action
   {
       
      
      public function EmptyStackAction()
      {
         super();
      }
      
      public static function create() : EmptyStackAction
      {
         return new EmptyStackAction();
      }
   }
}
