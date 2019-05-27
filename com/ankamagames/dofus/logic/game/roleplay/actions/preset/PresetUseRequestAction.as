package com.ankamagames.dofus.logic.game.roleplay.actions.preset
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class PresetUseRequestAction implements Action
   {
       
      
      public var presetId:uint;
      
      public function PresetUseRequestAction()
      {
         super();
      }
      
      public static function create(presetId:uint) : PresetUseRequestAction
      {
         var a:PresetUseRequestAction = new PresetUseRequestAction();
         a.presetId = presetId;
         return a;
      }
   }
}
