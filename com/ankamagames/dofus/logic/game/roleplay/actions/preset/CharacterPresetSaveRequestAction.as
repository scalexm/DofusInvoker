package com.ankamagames.dofus.logic.game.roleplay.actions.preset
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class CharacterPresetSaveRequestAction implements Action
   {
       
      
      public var presetId:uint;
      
      public var symbolId:uint;
      
      public var name:String;
      
      public var fullSave:Boolean;
      
      public function CharacterPresetSaveRequestAction()
      {
         super();
      }
      
      public static function create(presetId:uint, symbolId:uint, name:String, fullSave:Boolean) : CharacterPresetSaveRequestAction
      {
         var a:CharacterPresetSaveRequestAction = new CharacterPresetSaveRequestAction();
         a.presetId = presetId;
         a.symbolId = symbolId;
         a.name = name;
         a.fullSave = fullSave;
         return a;
      }
   }
}
