package com.ankamagames.dofus.logic.game.roleplay.actions
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class SpellVariantActivationRequestAction implements Action
   {
       
      
      public var spellId:uint;
      
      public function SpellVariantActivationRequestAction()
      {
         super();
      }
      
      public static function create(spellId:uint) : SpellVariantActivationRequestAction
      {
         var a:SpellVariantActivationRequestAction = new SpellVariantActivationRequestAction();
         a.spellId = spellId;
         return a;
      }
   }
}
