package com.ankamagames.dofus.logic.game.roleplay.actions.preset
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class IdolsPresetSaveRequestAction implements Action
   {
       
      
      public var presetId:int;
      
      public var symbolId:uint;
      
      public function IdolsPresetSaveRequestAction()
      {
         super();
      }
      
      public static function create(presetId:int, symbolId:uint) : IdolsPresetSaveRequestAction
      {
         var a:IdolsPresetSaveRequestAction = new IdolsPresetSaveRequestAction();
         a.presetId = presetId;
         a.symbolId = symbolId;
         return a;
      }
   }
}
