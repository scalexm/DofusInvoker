package com.ankamagames.dofus.logic.game.common.frames
{
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.dofus.datacenter.breeds.Breed;
   import com.ankamagames.dofus.datacenter.spells.FinishMove;
   import com.ankamagames.dofus.datacenter.spells.Spell;
   import com.ankamagames.dofus.datacenter.spells.SpellVariant;
   import com.ankamagames.dofus.internalDatacenter.spells.SpellWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.logic.game.common.managers.InventoryManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.fight.frames.FightSpellCastFrame;
   import com.ankamagames.dofus.logic.game.fight.managers.CurrentPlayedFighterManager;
   import com.ankamagames.dofus.logic.game.fight.types.SpellCastInFightManager;
   import com.ankamagames.dofus.logic.game.fight.types.castSpellManager.SpellManager;
   import com.ankamagames.dofus.logic.game.roleplay.actions.FinishMoveListRequestAction;
   import com.ankamagames.dofus.logic.game.roleplay.actions.FinishMoveSetRequestAction;
   import com.ankamagames.dofus.logic.game.roleplay.actions.SpellVariantActivationRequestAction;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.lists.InventoryHookList;
   import com.ankamagames.dofus.network.enums.ShortcutBarEnum;
   import com.ankamagames.dofus.network.messages.game.context.fight.SlaveSwitchContextMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.spell.SpellVariantActivationMessage;
   import com.ankamagames.dofus.network.messages.game.context.roleplay.spell.SpellVariantActivationRequestMessage;
   import com.ankamagames.dofus.network.messages.game.finishmoves.FinishMoveListMessage;
   import com.ankamagames.dofus.network.messages.game.finishmoves.FinishMoveListRequestMessage;
   import com.ankamagames.dofus.network.messages.game.finishmoves.FinishMoveSetRequestMessage;
   import com.ankamagames.dofus.network.messages.game.inventory.spells.SpellListMessage;
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightSpellCooldown;
   import com.ankamagames.dofus.network.types.game.data.items.SpellItem;
   import com.ankamagames.dofus.network.types.game.finishmoves.FinishMoveInformations;
   import com.ankamagames.dofus.uiApi.FightApi;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.types.enums.Priority;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class SpellInventoryManagementFrame implements Frame
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(SpellInventoryManagementFrame));
       
      
      private var _fullSpellList:Array;
      
      private var _spellsGlobalCooldowns:Dictionary;
      
      public function SpellInventoryManagementFrame()
      {
         this._fullSpellList = new Array();
         this._spellsGlobalCooldowns = new Dictionary();
         super();
      }
      
      public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      public function pushed() : Boolean
      {
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         var sw:SpellWrapper = null;
         var playerId:Number = NaN;
         var spellData:Spell = null;
         var slmsg:SpellListMessage = null;
         var idsList:Array = null;
         var spellInVariantData:Spell = null;
         var sscmsg:SlaveSwitchContextMessage = null;
         var slaveId:int = 0;
         var sgcds:Vector.<GameFightSpellCooldown> = null;
         var imf:InventoryManagementFrame = null;
         var svara:SpellVariantActivationRequestAction = null;
         var svarmsg:SpellVariantActivationRequestMessage = null;
         var svamsg:SpellVariantActivationMessage = null;
         var fmlra:FinishMoveListRequestAction = null;
         var fmlrmsg:FinishMoveListRequestMessage = null;
         var fmsra:FinishMoveSetRequestAction = null;
         var fmId:int = 0;
         var fmsrmsg:FinishMoveSetRequestMessage = null;
         var fmlmsg:FinishMoveListMessage = null;
         var finishMoves:Array = null;
         var fm:FinishMove = null;
         var fmi:FinishMoveInformations = null;
         var spell:SpellItem = null;
         var variantIsActivated:Boolean = false;
         var playerBreed:Breed = null;
         var spellVariant:SpellVariant = null;
         var swBreed:Spell = null;
         var spellInvoc:SpellItem = null;
         var gfsc:GameFightSpellCooldown = null;
         var spellLevel:uint = 0;
         var gcdvalue:int = 0;
         var spellCastManager:SpellCastInFightManager = null;
         var spellManager:SpellManager = null;
         var spellKnown:Boolean = false;
         var deactivatedSpellId:int = 0;
         var variants:Array = null;
         var variant:SpellVariant = null;
         var spellIdInVariant:int = 0;
         switch(true)
         {
            case msg is SpellListMessage:
               slmsg = msg as SpellListMessage;
               playerId = PlayedCharacterManager.getInstance().id;
               this._fullSpellList[playerId] = new Array();
               idsList = new Array();
               for each(spell in slmsg.spells)
               {
                  spellData = Spell.getSpellById(spell.spellId);
                  if(!spellData.spellVariant)
                  {
                     this._fullSpellList[playerId].push(SpellWrapper.create(spell.spellId,spell.spellLevel,true,PlayedCharacterManager.getInstance().id,true));
                  }
                  else
                  {
                     for each(spellInVariantData in spellData.spellVariant.spells)
                     {
                        if(spellInVariantData.id == spell.spellId)
                        {
                           variantIsActivated = true;
                           this._fullSpellList[playerId].push(SpellWrapper.create(spellInVariantData.id,spell.spellLevel,true,PlayedCharacterManager.getInstance().id,variantIsActivated));
                        }
                        else
                        {
                           this._fullSpellList[playerId].push(SpellWrapper.create(spellInVariantData.id,0,true,PlayedCharacterManager.getInstance().id));
                        }
                        idsList.push(spellInVariantData.id);
                     }
                  }
               }
               if(slmsg.spellPrevisualization)
               {
                  playerBreed = Breed.getBreedById(PlayedCharacterManager.getInstance().infos.breed);
                  for each(spellVariant in playerBreed.breedSpellVariants)
                  {
                     for each(swBreed in spellVariant.spells)
                     {
                        if(idsList.indexOf(swBreed.id) == -1)
                        {
                           this._fullSpellList[playerId].push(SpellWrapper.create(swBreed.id,0,true,PlayedCharacterManager.getInstance().id));
                        }
                     }
                  }
               }
               PlayedCharacterManager.getInstance().spellsInventory = this._fullSpellList[playerId];
               PlayedCharacterManager.getInstance().playerSpellList = this._fullSpellList[playerId];
               KernelEventsManager.getInstance().processCallback(HookList.SpellListUpdate,this._fullSpellList[playerId]);
               return true;
            case msg is SlaveSwitchContextMessage:
               sscmsg = msg as SlaveSwitchContextMessage;
               FightApi.slaveContext = true;
               slaveId = sscmsg.slaveId;
               this._fullSpellList[slaveId] = new Array();
               for each(spellInvoc in sscmsg.slaveSpells)
               {
                  this._fullSpellList[slaveId].push(SpellWrapper.create(spellInvoc.spellId,spellInvoc.spellLevel,true,slaveId));
               }
               PlayedCharacterManager.getInstance().spellsInventory = this._fullSpellList[slaveId];
               if(!CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations(slaveId))
               {
                  CurrentPlayedFighterManager.getInstance().setCharacteristicsInformations(slaveId,sscmsg.slaveStats);
               }
               if(CurrentPlayedFighterManager.getInstance().getSpellCastManagerById(slaveId).needCooldownUpdate)
               {
                  CurrentPlayedFighterManager.getInstance().getSpellCastManagerById(slaveId).updateCooldowns();
               }
               sgcds = this._spellsGlobalCooldowns[slaveId];
               if(sgcds)
               {
                  for each(gfsc in sgcds)
                  {
                     spellCastManager = CurrentPlayedFighterManager.getInstance().getSpellCastManagerById(slaveId);
                     gcdvalue = gfsc.cooldown;
                     spellKnown = false;
                     for each(sw in this._fullSpellList[slaveId])
                     {
                        if(sw.spellId == gfsc.spellId)
                        {
                           spellKnown = true;
                           spellLevel = sw.spellLevel;
                           if(gcdvalue == -1)
                           {
                              gcdvalue = sw.spellLevelInfos.minCastInterval;
                              break;
                           }
                           break;
                        }
                     }
                     if(spellKnown)
                     {
                        if(!spellCastManager.getSpellManagerBySpellId(gfsc.spellId))
                        {
                           spellCastManager.castSpell(gfsc.spellId,spellLevel,[],false);
                        }
                        spellManager = spellCastManager.getSpellManagerBySpellId(gfsc.spellId);
                        spellManager.forceCooldown(gcdvalue);
                     }
                  }
                  sgcds.length = 0;
                  delete this._spellsGlobalCooldowns[slaveId];
               }
               KernelEventsManager.getInstance().processCallback(HookList.SpellListUpdate,this._fullSpellList[slaveId]);
               if(Kernel.getWorker().contains(FightSpellCastFrame))
               {
                  Kernel.getWorker().removeFrame(Kernel.getWorker().getFrame(FightSpellCastFrame));
               }
               imf = Kernel.getWorker().getFrame(InventoryManagementFrame) as InventoryManagementFrame;
               InventoryManager.getInstance().shortcutBarSpells = imf.getWrappersFromShortcuts(sscmsg.shortcuts);
               KernelEventsManager.getInstance().processCallback(InventoryHookList.ShortcutBarViewContent,ShortcutBarEnum.SPELL_SHORTCUT_BAR);
               return false;
            case msg is SpellVariantActivationRequestAction:
               svara = msg as SpellVariantActivationRequestAction;
               svarmsg = new SpellVariantActivationRequestMessage();
               svarmsg.initSpellVariantActivationRequestMessage(svara.spellId);
               ConnectionsHandler.getConnection().send(svarmsg);
               return true;
            case msg is SpellVariantActivationMessage:
               svamsg = msg as SpellVariantActivationMessage;
               if(svamsg.result)
               {
                  deactivatedSpellId = 0;
                  variants = SpellVariant.getSpellVariants();
                  for each(variant in variants)
                  {
                     if(variant.spellIds.indexOf(svamsg.spellId) != -1)
                     {
                        for each(spellIdInVariant in variant.spellIds)
                        {
                           if(spellIdInVariant != svamsg.spellId)
                           {
                              deactivatedSpellId = spellIdInVariant;
                           }
                        }
                     }
                  }
                  for each(sw in this._fullSpellList[PlayedCharacterManager.getInstance().id])
                  {
                     if(sw.spellId == svamsg.spellId && !sw.variantActivated)
                     {
                        sw.variantActivated = true;
                     }
                     else if(sw.spellId == deactivatedSpellId && sw.variantActivated)
                     {
                        sw.variantActivated = false;
                     }
                  }
                  KernelEventsManager.getInstance().processCallback(InventoryHookList.SpellVariantActivated,svamsg.spellId,deactivatedSpellId);
               }
               return true;
            case msg is FinishMoveListRequestAction:
               fmlra = msg as FinishMoveListRequestAction;
               fmlrmsg = new FinishMoveListRequestMessage();
               fmlrmsg.initFinishMoveListRequestMessage();
               ConnectionsHandler.getConnection().send(fmlrmsg);
               return true;
            case msg is FinishMoveSetRequestAction:
               fmsra = msg as FinishMoveSetRequestAction;
               for each(fmId in fmsra.enabledFinishedMoves)
               {
                  fmsrmsg = new FinishMoveSetRequestMessage();
                  fmsrmsg.initFinishMoveSetRequestMessage(fmId,true);
                  ConnectionsHandler.getConnection().send(fmsrmsg);
               }
               for each(fmId in fmsra.disabledFinishedMoves)
               {
                  fmsrmsg = new FinishMoveSetRequestMessage();
                  fmsrmsg.initFinishMoveSetRequestMessage(fmId,false);
                  ConnectionsHandler.getConnection().send(fmsrmsg);
               }
               return true;
            case msg is FinishMoveListMessage:
               fmlmsg = msg as FinishMoveListMessage;
               finishMoves = new Array();
               for each(fmi in fmlmsg.finishMoves)
               {
                  fm = FinishMove.getFinishMoveById(fmi.finishMoveId);
                  finishMoves.push({
                     "id":fm.id,
                     "name":Spell.getSpellById(fm.getSpellLevel().spellId).name,
                     "enabled":fmi.finishMoveState
                  });
               }
               finishMoves.sortOn("id",Array.NUMERIC);
               KernelEventsManager.getInstance().processCallback(HookList.FinishMoveList,finishMoves);
               return true;
            default:
               return false;
         }
      }
      
      public function pulled() : Boolean
      {
         return true;
      }
      
      public function getFullSpellListByOwnerId(ownerId:Number) : Array
      {
         return this._fullSpellList[ownerId];
      }
      
      public function addSpellGlobalCoolDownInfo(pEntityId:Number, pGameFightSpellCooldown:GameFightSpellCooldown) : void
      {
         if(!this._spellsGlobalCooldowns[pEntityId])
         {
            this._spellsGlobalCooldowns[pEntityId] = new Vector.<GameFightSpellCooldown>(0);
         }
         this._spellsGlobalCooldowns[pEntityId].push(pGameFightSpellCooldown);
      }
      
      public function deleteSpellsGlobalCoolDownsData() : void
      {
         var id:* = undefined;
         for(id in this._spellsGlobalCooldowns)
         {
            this._spellsGlobalCooldowns[id].length = 0;
            delete this._spellsGlobalCooldowns[id];
         }
      }
      
      public function getBreedSpellsInVariantsArray() : Array
      {
         var spellWrapper:SpellWrapper = null;
         var firstSpellId:int = 0;
         var spellId:int = 0;
         var idsPack:Vector.<uint> = null;
         var spellVariant:SpellVariant = null;
         var spellIdInVector:Vector.<uint> = null;
         var variants:Array = null;
         var playerBreedId:int = PlayedCharacterManager.getInstance().infos.breed;
         var breedData:Breed = Breed.getBreedById(playerBreedId);
         var breedSpellsId:Array = breedData.allSpellsId;
         var spellsInventory:Array = PlayedCharacterManager.getInstance().spellsInventory;
         var spells:Array = new Array();
         var variantIdsPacks:Array = new Array();
         var spellWrappersById:Dictionary = new Dictionary(true);
         var processedVariantIds:Array = new Array();
         for each(spellWrapper in spellsInventory)
         {
            if(breedSpellsId.indexOf(spellWrapper.spell.id) != -1)
            {
               spellWrappersById[spellWrapper.id] = spellWrapper;
               spellVariant = spellWrapper.spell.spellVariant;
               if(spellVariant)
               {
                  firstSpellId = spellVariant.spellIds[0];
                  if(processedVariantIds.indexOf(firstSpellId) == -1)
                  {
                     processedVariantIds.push(firstSpellId);
                     variantIdsPacks.push(spellVariant.spellIds);
                  }
               }
               else
               {
                  spellIdInVector = new Vector.<uint>();
                  spellIdInVector.push(spellWrapper.id);
                  variantIdsPacks.push(spellIdInVector);
               }
            }
         }
         for each(idsPack in variantIdsPacks)
         {
            variants = new Array();
            for each(spellId in idsPack)
            {
               if(spellWrappersById[spellId])
               {
                  variants.push(spellWrappersById[spellId]);
               }
            }
            spells.push(variants);
         }
         spells.sort(this.sortOnObtentionLevel);
         return spells;
      }
      
      public function getCommonSpellsInVariantsArray() : Array
      {
         var spellWrapper:SpellWrapper = null;
         var firstSpellId:int = 0;
         var spellId:int = 0;
         var idsPack:Vector.<uint> = null;
         var spellVariant:SpellVariant = null;
         var spellIdInVector:Vector.<uint> = null;
         var variants:Array = null;
         var playerBreedId:int = PlayedCharacterManager.getInstance().infos.breed;
         var breedData:Breed = Breed.getBreedById(playerBreedId);
         var breedSpellsId:Array = breedData.allSpellsId;
         var spellsInventory:Array = PlayedCharacterManager.getInstance().spellsInventory;
         var spells:Array = new Array();
         var variantIdsPacks:Array = new Array();
         var spellWrappersById:Dictionary = new Dictionary(true);
         var processedVariantIds:Array = new Array();
         for each(spellWrapper in spellsInventory)
         {
            if(breedSpellsId.indexOf(spellWrapper.spell.id) == -1)
            {
               spellWrappersById[spellWrapper.id] = spellWrapper;
               spellVariant = spellWrapper.spell.spellVariant;
               if(spellVariant)
               {
                  firstSpellId = spellVariant.spellIds[0];
                  if(processedVariantIds.indexOf(firstSpellId) == -1)
                  {
                     processedVariantIds.push(firstSpellId);
                     variantIdsPacks.push(spellVariant.spellIds);
                  }
               }
               else
               {
                  spellIdInVector = new Vector.<uint>();
                  spellIdInVector.push(spellWrapper.id);
                  variantIdsPacks.push(spellIdInVector);
               }
            }
         }
         for each(idsPack in variantIdsPacks)
         {
            variants = new Array();
            for each(spellId in idsPack)
            {
               if(spellWrappersById[spellId])
               {
                  variants.push(spellWrappersById[spellId]);
               }
            }
            spells.push(variants);
         }
         spells.sort(this.sortOnObtentionLevel);
         return spells;
      }
      
      private function sortOnObtentionLevel(spellsA:Object, spellsB:Object) : Number
      {
         var aObtentionLevel:int = spellsA[0].spell.getSpellLevel(0).minPlayerLevel;
         var bObtentionLevel:int = spellsB[0].spell.getSpellLevel(0).minPlayerLevel;
         var aObtentionLevelVariant1:int = 0;
         if(spellsA.length > 1)
         {
            aObtentionLevelVariant1 = spellsA[1].spell.getSpellLevel(0).minPlayerLevel;
         }
         var bObtentionLevelVariant1:int = 0;
         if(spellsB.length > 1)
         {
            bObtentionLevelVariant1 = spellsB[1].spell.getSpellLevel(0).minPlayerLevel;
         }
         if(aObtentionLevel > bObtentionLevel)
         {
            return 1;
         }
         if(aObtentionLevel < bObtentionLevel)
         {
            return -1;
         }
         if(aObtentionLevelVariant1 > bObtentionLevelVariant1)
         {
            return 1;
         }
         if(aObtentionLevelVariant1 < bObtentionLevelVariant1)
         {
            return -1;
         }
         if(spellsA[0].id > spellsB[0].id)
         {
            return 1;
         }
         if(spellsA[0].id < spellsB[0].id)
         {
            return -1;
         }
         return 0;
      }
   }
}
