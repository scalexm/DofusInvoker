package com.ankamagames.dofus.logic.game.common.actions.jobs
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class JobCrafterContactLookRequestAction implements Action
   {
       
      
      public var crafterId:Number;
      
      public function JobCrafterContactLookRequestAction()
      {
         super();
      }
      
      public static function create(crafterId:Number) : JobCrafterContactLookRequestAction
      {
         var act:JobCrafterContactLookRequestAction = new JobCrafterContactLookRequestAction();
         act.crafterId = crafterId;
         return act;
      }
   }
}
