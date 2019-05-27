package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.Berilia;
   import com.ankamagames.berilia.components.SubhintComponent;
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.berilia.types.graphic.GraphicContainer;
   import com.ankamagames.berilia.types.graphic.UiRootContainer;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.internalDatacenter.tutorial.SubhintWrapper;
   import com.ankamagames.dofus.internalDatacenter.world.WorldPointWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.common.managers.PlayerManager;
   import com.ankamagames.dofus.logic.common.managers.UiHintManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.SubhintEditorManager;
   import com.ankamagames.dofus.logic.game.common.managers.SubhintManager;
   import com.ankamagames.dofus.logic.game.fight.frames.FightContextFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightPreparationFrame;
   import com.ankamagames.dofus.misc.utils.SubhintInspector;
   import com.ankamagames.dofus.network.enums.BuildTypeEnum;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.OptionManager;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   [InstanciedApi]
   public class UiTutoApi implements IApi
   {
      
      public static var MEMORY_LOG:Dictionary = new Dictionary(true);
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(UiTutoApi));
      
      private static var _instance:UiTutoApi;
       
      
      private var _module:UiModule;
      
      private var _currentUi:UiRootContainer;
      
      public function UiTutoApi()
      {
         super();
         MEMORY_LOG[this] = 1;
         _instance = this;
      }
      
      public static function getInstance() : UiTutoApi
      {
         return _instance;
      }
      
      [ApiData(name="module")]
      public function set module(value:UiModule) : void
      {
         if(!this._module)
         {
            this._module = value;
         }
      }
      
      [ApiData(name="currentUi")]
      public function set currentUi(value:UiRootContainer) : void
      {
         if(!this._currentUi)
         {
            this._currentUi = value;
         }
      }
      
      [Trusted]
      public function destroy() : void
      {
         this._currentUi = null;
         this._module = null;
      }
      
      [Trusted]
      public function getSubhintInspector() : SubhintInspector
      {
         return SubhintInspector.getInstance();
      }
      
      [Untrusted]
      public function getSubhints() : void
      {
         SubhintEditorManager.getInstance().getSubhints();
      }
      
      [Untrusted]
      public function updateSubhint(data:Object) : void
      {
         SubhintEditorManager.getInstance().putSubhints(data);
      }
      
      [Untrusted]
      public function moveSubhint(data:Object) : void
      {
         SubhintEditorManager.getInstance().moveSubhint(data);
      }
      
      [Untrusted]
      public function createSubhint(data:Object) : void
      {
         SubhintEditorManager.getInstance().postSubhints(data);
      }
      
      [Untrusted]
      public function deleteSubhint(data:Object) : void
      {
         SubhintEditorManager.getInstance().deleteSubhint(data);
      }
      
      [Untrusted]
      public function previewSubhint(data:Object) : void
      {
         var index:int = (data.hint_parent_uid as String).indexOf("_");
         var uiName:String = "";
         if(index != -1)
         {
            uiName = (data.hint_parent_uid as String).substring(0,index);
         }
         else
         {
            uiName = data.hint_parent_uid;
         }
         var uiRoot:UiRootContainer = this.getUiClass(uiName) as UiRootContainer;
         UiHintManager.subhintPreview(data,uiRoot,this._module);
      }
      
      [Untrusted]
      public function closeSubhintPreview() : void
      {
         UiHintManager.closeSubhintPreview();
      }
      
      [Untrusted]
      public function isInFight() : Boolean
      {
         return Kernel.getWorker().getFrame(FightContextFrame) != null;
      }
      
      [Untrusted]
      public function isInPreFight() : Boolean
      {
         return Kernel.getWorker().contains(FightPreparationFrame) || Kernel.getWorker().isBeingAdded(FightPreparationFrame);
      }
      
      [Untrusted]
      public function isSpectator() : Boolean
      {
         return PlayedCharacterManager.getInstance().isSpectator;
      }
      
      [Untrusted]
      public function isInTutorialArea() : Boolean
      {
         return PlayedCharacterApi.getInstance().isInTutorialArea();
      }
      
      [Untrusted]
      public function currentMap() : WorldPointWrapper
      {
         return PlayedCharacterManager.getInstance().currentMap;
      }
      
      [Untrusted]
      public function getCurrentTarget() : UiRootContainer
      {
         return UiHintManager.currentTarget;
      }
      
      [Untrusted]
      public function getSubhintDataArrayWithParentUID(parentUID:String) : Array
      {
         if(BuildInfos.BUILD_TYPE >= BuildTypeEnum.INTERNAL)
         {
            return SubhintEditorManager.subhintDictionary[parentUID];
         }
         return SubhintManager.subhintDictionary[parentUID];
      }
      
      [Untrusted]
      public function getSubhintData() : Dictionary
      {
         return SubhintEditorManager.subhintDictionary;
      }
      
      [Untrusted]
      public function guidedActivated() : Boolean
      {
         var inFight:Boolean = this.isInFight();
         var inPreFight:Boolean = this.isInPreFight();
         var spec:Boolean = this.isSpectator();
         if((inFight || inPreFight) && !spec)
         {
            return false;
         }
         return OptionManager.getOptionManager("dofus")["showUIHints"];
      }
      
      [Untrusted]
      public function canDisplayHelp(uirc:UiRootContainer = null) : Boolean
      {
         var data:* = undefined;
         if(!uirc)
         {
            uirc = this._currentUi;
         }
         var currentUiBtnHelp:GraphicContainer = uirc.getElement("btn_help");
         var tab:String = "";
         var uiRoot:UiRootContainer = uirc;
         var dataArray:Array = [];
         var ttTarget:GraphicContainer = UiHintManager.getHelpButton(uirc);
         do
         {
            if("currentTabName" in uiRoot.uiClass)
            {
               tab = uiRoot.uiClass.currentTabName == ""?"":"_" + uiRoot.uiClass.currentTabName;
            }
            else
            {
               tab = "";
            }
            dataArray = dataArray.concat(this.getSubhintDataArrayWithParentUID(uiRoot.uiData.name + (tab == ""?"":tab)));
            if(tab != "")
            {
               dataArray = dataArray.concat(this.getSubhintDataArrayWithParentUID(uiRoot.uiData.name));
            }
            uiRoot = uiRoot.parentUiRoot;
         }
         while(uiRoot);
         
         var hasData:Boolean = false;
         for each(data in dataArray)
         {
            if(data)
            {
               hasData = true;
               break;
            }
         }
         if(ttTarget)
         {
            if(currentUiBtnHelp && currentUiBtnHelp != ttTarget)
            {
               currentUiBtnHelp.visible = false;
            }
            ttTarget.visible = hasData;
         }
         if(!ttTarget || !ttTarget.visible)
         {
            return false;
         }
         var specialUi:Boolean = false;
         if(uirc.name == "idolsTab" && (this.currentMap().mapId == 153092356 || this.currentMap().mapId == 153093380) || uirc.name == "craft" && this.currentMap().mapId == 153093380)
         {
            specialUi = true;
         }
         var displayHelp:Boolean = !this.isInTutorialArea() && !specialUi;
         if(!displayHelp)
         {
            ttTarget.visible = false;
         }
         else if(uirc.parentUiRoot && currentUiBtnHelp)
         {
            currentUiBtnHelp.visible = false;
         }
         return displayHelp;
      }
      
      [Untrusted]
      public function subHintsAreDisplayed(target:UiRootContainer) : Boolean
      {
         return UiHintManager.subHints && UiHintManager.subHints.length > 0 && target == this.getCurrentTarget();
      }
      
      [Untrusted]
      public function uiTutoTabLaunch() : void
      {
         if(this._currentUi.name.indexOf("tooltip_") != -1)
         {
            return;
         }
         this.closeSubHints();
         var tab:String = !!this._currentUi.uiClass.currentTabName?this._currentUi.uiClass.currentTabName:"";
         if(this.canDisplayHelp() && this.guidedActivated() && !this.getGuidedAlreadyDone(tab))
         {
            this.showSubHints(tab,false);
         }
      }
      
      [Untrusted]
      public function showSubhintOnUiLoaded(uiRoot:UiRootContainer) : void
      {
         var tab:String = "";
         if(uiRoot.uiClass.hasOwnProperty("currentTabName"))
         {
            tab = !!uiRoot.uiClass.currentTabName?uiRoot.uiClass.currentTabName:"";
         }
         if(uiRoot.restoreSnapshotAfterLoading && tab != "")
         {
            return;
         }
         this.closeSubHints();
         if(this.canDisplayHelp() && this.guidedActivated() && !this.getGuidedAlreadyDone(tab) && !uiRoot.childUiRoot)
         {
            this.showSubHints(tab,false);
         }
      }
      
      [Untrusted]
      public function showSubHints(tabDisplayed:String = "", onClick:Boolean = true) : void
      {
         if(!UiHintManager.subHints || UiHintManager.subHints.length <= 0)
         {
            UiHintManager.createSubHints(this._currentUi,this._module,tabDisplayed,this.mergeData(this._currentUi,this.guidedActivated(),tabDisplayed,onClick));
         }
         else
         {
            UiHintManager.closeHints(this.getCurrentTarget());
            if(this._currentUi && this.getCurrentTarget() && this._currentUi.uiData.name != this.getCurrentTarget().uiData.name && !this.sameParentContainer(this._currentUi,this.getCurrentTarget()))
            {
               UiHintManager.createSubHints(this._currentUi,this._module,tabDisplayed,this.mergeData(this._currentUi,this.guidedActivated(),tabDisplayed,onClick));
            }
         }
      }
      
      [Untrusted]
      public function mergeData(uiRoot:UiRootContainer, guided:Boolean, tab:String = "", onClick:Boolean = true) : Boolean
      {
         var sh:SubhintWrapper = null;
         var dataArray:Array = this.getSubhintDataArrayWithParentUID(uiRoot.uiData.name + (tab == ""?"":"_" + tab));
         var creationDate:Number = PlayerManager.getInstance().accountCreation;
         var seeOnlyNewSubhints:Boolean = false;
         if(guided && !this.getGuidedAlreadyDone(tab) && !onClick)
         {
            do
            {
               if(!this.getSpecificGuidedAlreadyDone(uiRoot.uiData.name))
               {
                  if(dataArray)
                  {
                     UiHintManager.allTargets.unshift([uiRoot,[]]);
                     if(UiHintManager.specificGuidedAlreadyDone[uiRoot.uiData.name] == null)
                     {
                        for each(sh in dataArray)
                        {
                           if(SubhintManager.maxSubhintDate > creationDate)
                           {
                              seeOnlyNewSubhints = true;
                              break;
                           }
                        }
                        for each(sh in dataArray)
                        {
                           if(seeOnlyNewSubhints && sh && sh.hint_creation_date > creationDate)
                           {
                              UiHintManager.allTargets[0][1].push(sh);
                           }
                           else if(!seeOnlyNewSubhints)
                           {
                              UiHintManager.allTargets[0][1].push(sh);
                           }
                        }
                     }
                     else
                     {
                        for each(sh in dataArray)
                        {
                           UiHintManager.allTargets[0][1].push(sh);
                        }
                     }
                  }
                  if(tab)
                  {
                     dataArray = this.getSubhintDataArrayWithParentUID(uiRoot.uiData.name);
                     if(dataArray)
                     {
                        UiHintManager.allTargets.unshift([uiRoot,[]]);
                        if(UiHintManager.specificGuidedAlreadyDone[uiRoot.uiData.name] == null)
                        {
                           for each(sh in dataArray)
                           {
                              if(SubhintManager.maxSubhintDate > creationDate)
                              {
                                 seeOnlyNewSubhints = true;
                                 break;
                              }
                           }
                           for each(sh in dataArray)
                           {
                              if(seeOnlyNewSubhints && sh && sh.hint_creation_date > creationDate)
                              {
                                 UiHintManager.allTargets[0][1].push(sh);
                              }
                              else if(!seeOnlyNewSubhints)
                              {
                                 UiHintManager.allTargets[0][1].push(sh);
                              }
                           }
                        }
                        else
                        {
                           for each(sh in dataArray)
                           {
                              UiHintManager.allTargets[0][1].push(sh);
                           }
                        }
                     }
                  }
               }
               uiRoot = uiRoot.parentUiRoot;
               if(uiRoot)
               {
                  dataArray = this.getSubhintDataArrayWithParentUID(uiRoot.uiData.name);
                  tab = "";
               }
            }
            while(uiRoot);
            
            return true;
         }
         if(onClick)
         {
            do
            {
               if(dataArray)
               {
                  UiHintManager.allTargets.unshift([uiRoot,[]]);
                  for each(sh in dataArray)
                  {
                     UiHintManager.allTargets[0][1].push(sh);
                  }
               }
               if(tab)
               {
                  dataArray = this.getSubhintDataArrayWithParentUID(uiRoot.uiData.name);
                  if(dataArray)
                  {
                     UiHintManager.allTargets.unshift([uiRoot,[]]);
                     for each(sh in dataArray)
                     {
                        UiHintManager.allTargets[0][1].push(sh);
                     }
                  }
               }
               uiRoot = uiRoot.parentUiRoot;
               if(uiRoot)
               {
                  dataArray = this.getSubhintDataArrayWithParentUID(uiRoot.uiData.name);
                  tab = "";
               }
            }
            while(uiRoot);
            
            return false;
         }
         return true;
      }
      
      [Untrusted]
      public function showNextSubHint(order:int) : void
      {
         UiHintManager.showNextSubHint(order);
      }
      
      [Untrusted]
      public function skipTuto() : void
      {
         UiHintManager.skipHints();
      }
      
      [Untrusted]
      public function closeSubHints() : void
      {
         UiHintManager.closeHints(this._currentUi);
      }
      
      [Untrusted]
      public function closeEndTooltip() : void
      {
         UiHintManager.closeEndTooltipHelp();
      }
      
      [Untrusted]
      public function getGuidedAlreadyDone(tabDisplayed:String = "") : Boolean
      {
         if(UiHintManager.howManyGuidedAlreadyDone() <= 0)
         {
            UiHintManager.reloadHintState();
         }
         var tempCurrentUiName:String = UiHintManager.getNameId(this._currentUi,this._currentUi.uiData.name + (tabDisplayed == ""?"":"_" + tabDisplayed));
         return UiHintManager.guidedAlreadyDone[tempCurrentUiName];
      }
      
      [Untrusted]
      public function getSpecificGuidedAlreadyDone(tabDisplayed:String = "") : Boolean
      {
         if(UiHintManager.howManyGuidedAlreadyDone() <= 0)
         {
            UiHintManager.reloadHintState();
         }
         return UiHintManager.specificGuidedAlreadyDone[tabDisplayed];
      }
      
      [Untrusted]
      public function sameParentContainer(target:GraphicContainer, currentTarget:GraphicContainer) : Boolean
      {
         if(!target || !currentTarget)
         {
            return false;
         }
         var targetRoot:UiRootContainer = target as UiRootContainer;
         var currentTargetRoot:UiRootContainer = currentTarget as UiRootContainer;
         if(targetRoot.uiData.name == currentTargetRoot.uiData.name)
         {
            return true;
         }
         if(currentTargetRoot.parentUiRoot)
         {
            if(targetRoot.uiData.name == currentTargetRoot.parentUiRoot.uiData.name)
            {
               return true;
            }
            return this.sameParentContainer(target,currentTargetRoot.parentUiRoot);
         }
         if(targetRoot.parentUiRoot)
         {
            return this.sameParentContainer(targetRoot.parentUiRoot,currentTargetRoot);
         }
         return false;
      }
      
      [Untrusted]
      public function highLightSubhint(anchoredElementName:String, value:Boolean) : void
      {
         var sh:SubhintComponent = null;
         for each(sh in UiHintManager.subHints)
         {
            if(sh.target.name == anchoredElementName)
            {
               sh.highLight(value);
               break;
            }
         }
      }
      
      [Untrusted]
      public function getSubHintlist() : Array
      {
         return UiHintManager.subHints;
      }
      
      [Untrusted]
      public function getNumberOfSubHints() : int
      {
         return !!UiHintManager.subHints?int(UiHintManager.subHints.length):0;
      }
      
      [Untrusted]
      public function displayTutoOfSelectedTab(container:GraphicContainer, target:Object) : void
      {
         if(!this.getGuidedAlreadyDone(!!target?target.name:""))
         {
            this.closeSubHints();
            this.showSubHints(!!target?target.name:"");
         }
         else
         {
            this.closeSubHints();
         }
      }
      
      [Untrusted]
      public function resetGuidedUiHints() : void
      {
         UiHintManager.resetHintState();
      }
      
      [Untrusted]
      public function getUiClass(uiClassName:String) : UiRootContainer
      {
         var ui:UiRootContainer = null;
         var uiList:Dictionary = Berilia.getInstance().uiList;
         for each(ui in uiList)
         {
            if(ui.uiData.name == uiClassName)
            {
               return ui;
            }
         }
         return null;
      }
      
      [Untrusted]
      public function getAllOpenedUiWithSubHints() : Array
      {
         var ui:UiRootContainer = null;
         var uiList:Dictionary = Berilia.getInstance().uiList;
         var res:Array = [];
         for each(ui in uiList)
         {
            if(ui.getElement("btn_help"))
            {
               res.push(ui);
            }
         }
         return res;
      }
   }
}
