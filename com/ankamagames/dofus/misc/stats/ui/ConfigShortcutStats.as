package com.ankamagames.dofus.misc.stats.ui
{
   import com.ankamagames.berilia.types.data.Hook;
   import com.ankamagames.berilia.types.graphic.GraphicContainer;
   import com.ankamagames.berilia.types.shortcut.Bind;
   import com.ankamagames.berilia.types.shortcut.Shortcut;
   import com.ankamagames.berilia.utils.BeriliaHookList;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.misc.stats.IHookStats;
   import com.ankamagames.dofus.misc.stats.StatsAction;
   import com.ankamagames.dofus.misc.stats.custom.ShortcutsStats;
   import com.ankamagames.dofus.misc.utils.HaapiKeyManager;
   import com.ankamagames.jerakine.handlers.messages.mouse.MouseClickMessage;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.messages.Message;
   import flash.utils.getQualifiedClassName;
   
   public class ConfigShortcutStats implements IHookStats, IUiStats
   {
      
      private static const _log:Logger = Log.getLogger(getQualifiedClassName(ConfigShortcutStats));
      
      private static const CHANGE_SHORTCUT_EVENT_ID:uint = 671;
       
      
      private var _action:StatsAction;
      
      private var _changedShortcuts:Vector.<String>;
      
      private var _changedCategories:Vector.<String>;
      
      public function ConfigShortcutStats(pArgs:Array)
      {
         this._changedShortcuts = new Vector.<String>();
         this._changedCategories = new Vector.<String>();
         super();
         this._action = new StatsAction(CHANGE_SHORTCUT_EVENT_ID,false,false,true,true);
         this._action.gameSessionId = HaapiKeyManager.getInstance().getGameSessionId();
         this._action.setParam("account_id",PlayerManager.getInstance().accountId);
         this._action.setParam("character_id",PlayedCharacterManager.getInstance().extractedServerCharacterIdFromInterserverCharacterId);
         this._action.setParam("shortcuts_delete",false);
         this._action.setParam("shortcuts_change",this._changedShortcuts);
         this._action.setParam("category_change",this._changedCategories);
         this._action.start();
      }
      
      public function onHook(pHook:Hook, pArgs:Array) : void
      {
         var shortcut:Shortcut = null;
         if(pArgs[1] != null && pHook.name == BeriliaHookList.ShortcutUpdate.name && ShortcutsStats.SHORTCUTS.hasOwnProperty(pArgs[0]))
         {
            shortcut = Shortcut.getShortcutByName((pArgs[1] as Bind).targetedShortcut);
            if(this._changedShortcuts.indexOf(shortcut.name) == -1)
            {
               this._changedShortcuts.push(shortcut.name);
            }
            if(this._changedCategories.indexOf(shortcut.category.name) == -1)
            {
               this._changedCategories.push(shortcut.category.name);
            }
         }
      }
      
      public function process(pMessage:Message, pArgs:Array = null) : void
      {
         var target:GraphicContainer = null;
         if(pMessage is MouseClickMessage)
         {
            target = !!pArgs?pArgs[1]:null;
            if(target && target.name == "btn_clearShortcuts")
            {
               this._action.setParam("shortcuts_delete",true);
            }
         }
      }
      
      public function remove() : void
      {
         this._action.send();
      }
   }
}
