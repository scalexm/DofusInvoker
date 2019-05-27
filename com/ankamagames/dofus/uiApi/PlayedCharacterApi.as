package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.dofus.datacenter.appearance.Ornament;
   import com.ankamagames.dofus.datacenter.appearance.Title;
   import com.ankamagames.dofus.datacenter.breeds.Breed;
   import com.ankamagames.dofus.datacenter.spells.Spell;
   import com.ankamagames.dofus.datacenter.spells.SpellLevel;
   import com.ankamagames.dofus.datacenter.world.SubArea;
   import com.ankamagames.dofus.internalDatacenter.DataEnum;
   import com.ankamagames.dofus.internalDatacenter.house.HouseWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.BuildWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.IdolsPresetWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.WeaponWrapper;
   import com.ankamagames.dofus.internalDatacenter.spells.SpellWrapper;
   import com.ankamagames.dofus.internalDatacenter.world.WorldPointWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.AbstractEntitiesFrame;
   import com.ankamagames.dofus.logic.game.common.frames.HouseFrame;
   import com.ankamagames.dofus.logic.game.common.frames.PlayedCharacterUpdatesFrame;
   import com.ankamagames.dofus.logic.game.common.frames.SpellInventoryManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.TinselFrame;
   import com.ankamagames.dofus.logic.game.common.managers.EntitiesLooksManager;
   import com.ankamagames.dofus.logic.game.common.managers.InventoryManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.misc.DofusEntities;
   import com.ankamagames.dofus.logic.game.fight.frames.FightContextFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightEntitiesFrame;
   import com.ankamagames.dofus.logic.game.fight.frames.FightPreparationFrame;
   import com.ankamagames.dofus.logic.game.fight.managers.CurrentPlayedFighterManager;
   import com.ankamagames.dofus.logic.game.roleplay.frames.HavenbagFrame;
   import com.ankamagames.dofus.logic.game.roleplay.frames.RoleplayContextFrame;
   import com.ankamagames.dofus.logic.game.roleplay.frames.RoleplayEntitiesFrame;
   import com.ankamagames.dofus.logic.game.roleplay.types.CharacterTooltipInformation;
   import com.ankamagames.dofus.misc.EntityLookAdapter;
   import com.ankamagames.dofus.network.enums.AlignmentSideEnum;
   import com.ankamagames.dofus.network.enums.CharacterInventoryPositionEnum;
   import com.ankamagames.dofus.network.enums.PlayerLifeStatusEnum;
   import com.ankamagames.dofus.network.enums.SubEntityBindingPointCategoryEnum;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterSpellModification;
   import com.ankamagames.dofus.network.types.game.character.choice.CharacterBaseInformations;
   import com.ankamagames.dofus.network.types.game.character.restriction.ActorRestrictionsInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayActorInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayCharacterInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.GameRolePlayMutantInformations;
   import com.ankamagames.dofus.network.types.game.context.roleplay.HumanOptionTitle;
   import com.ankamagames.dofus.types.data.PlayerSetInfo;
   import com.ankamagames.dofus.types.entities.AnimatedCharacter;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.tiphon.types.look.TiphonEntityLook;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class PlayedCharacterApi implements IApi
   {
      
      public static var MEMORY_LOG:Dictionary = new Dictionary(true);
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(PlayedCharacterApi));
      
      private static var _instance:PlayedCharacterApi;
       
      
      public function PlayedCharacterApi()
      {
         super();
         MEMORY_LOG[this] = 1;
         _instance = this;
      }
      
      public static function getInstance() : PlayedCharacterApi
      {
         return _instance;
      }
      
      [Untrusted]
      public function characteristics() : CharacterCharacteristicsInformations
      {
         return PlayedCharacterManager.getInstance().characteristics;
      }
      
      [Untrusted]
      public function getPlayedCharacterInfo() : Object
      {
         var i:CharacterBaseInformations = PlayedCharacterManager.getInstance().infos;
         if(!i)
         {
            return null;
         }
         var o:Object = new Object();
         o.id = i.id;
         o.breed = i.breed;
         o.level = i.level;
         o.limitedLevel = PlayedCharacterManager.getInstance().limitedLevel;
         o.sex = i.sex;
         o.name = i.name;
         if(PlayedCharacterManager.getInstance().realEntityLook)
         {
            o.entityLook = EntityLookAdapter.fromNetwork(PlayedCharacterManager.getInstance().realEntityLook);
         }
         else
         {
            o.entityLook = EntityLookAdapter.fromNetwork(i.entityLook);
         }
         o.realEntityLook = (o.entityLook as TiphonEntityLook).clone();
         if(this.isCreature() && PlayedCharacterManager.getInstance().realEntityLook)
         {
            o.entityLook = EntityLookAdapter.fromNetwork(PlayedCharacterManager.getInstance().realEntityLook);
         }
         var ridderLook:TiphonEntityLook = TiphonEntityLook(o.entityLook).getSubEntity(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_MOUNT_DRIVER,0);
         if(ridderLook)
         {
            if(ridderLook.getBone() == 2)
            {
               ridderLook.setBone(1);
            }
            o.entityLook = ridderLook;
         }
         return o;
      }
      
      [Untrusted]
      public function getCurrentEntityLook() : Object
      {
         var look:TiphonEntityLook = null;
         var entity:AnimatedCharacter = DofusEntities.getEntity(PlayedCharacterManager.getInstance().id) as AnimatedCharacter;
         if(entity)
         {
            look = entity.look.clone();
         }
         else
         {
            look = EntityLookAdapter.fromNetwork(PlayedCharacterManager.getInstance().infos.entityLook);
         }
         return look;
      }
      
      [Untrusted]
      public function getInventory() : Vector.<ItemWrapper>
      {
         return InventoryManager.getInstance().realInventory;
      }
      
      [Untrusted]
      public function getEquipment() : Array
      {
         var item:* = undefined;
         var equipment:Array = new Array();
         for each(item in PlayedCharacterManager.getInstance().inventory)
         {
            if(item.position <= CharacterInventoryPositionEnum.ACCESSORY_POSITION_SHIELD)
            {
               equipment.push(item);
            }
         }
         return equipment;
      }
      
      [Untrusted]
      public function getSpellInventory() : Array
      {
         return PlayedCharacterManager.getInstance().spellsInventory;
      }
      
      [Untrusted]
      public function getSpells(returnBreedSpells:Boolean) : Array
      {
         var spim:SpellInventoryManagementFrame = Kernel.getWorker().getFrame(SpellInventoryManagementFrame) as SpellInventoryManagementFrame;
         if(returnBreedSpells)
         {
            return spim.getBreedSpellsInVariantsArray();
         }
         return spim.getCommonSpellsInVariantsArray();
      }
      
      [Untrusted]
      public function getBreedSpellActivatedIds() : Array
      {
         var spellWrapper:SpellWrapper = null;
         var spellsInventory:Array = PlayedCharacterManager.getInstance().spellsInventory;
         var activatedSpellIds:Array = new Array();
         var playerBreedId:int = PlayedCharacterManager.getInstance().infos.breed;
         var breedData:Breed = Breed.getBreedById(playerBreedId);
         var breedSpellsId:Array = breedData.allSpellsId;
         for each(spellWrapper in spellsInventory)
         {
            if(spellWrapper.variantActivated && breedSpellsId.indexOf(spellWrapper.id) != -1)
            {
               activatedSpellIds.push(spellWrapper.id);
            }
         }
         return activatedSpellIds;
      }
      
      [Untrusted]
      public function getJobs() : Array
      {
         return PlayedCharacterManager.getInstance().jobs;
      }
      
      [Untrusted]
      public function getMount() : Object
      {
         return PlayedCharacterManager.getInstance().mount;
      }
      
      [Untrusted]
      public function getTitle() : Title
      {
         var title:Title = null;
         var playerInfo:GameRolePlayCharacterInformations = null;
         var option:* = undefined;
         var title2:Title = null;
         var titleId:int = (Kernel.getWorker().getFrame(TinselFrame) as TinselFrame).currentTitle;
         if(titleId)
         {
            title = Title.getTitleById(titleId);
            return title;
         }
         playerInfo = this.getEntityInfos();
         if(playerInfo && playerInfo.humanoidInfo)
         {
            for each(option in playerInfo.humanoidInfo.options)
            {
               if(option is HumanOptionTitle)
               {
                  titleId = option.titleId;
               }
            }
            title2 = Title.getTitleById(titleId);
            return title2;
         }
         return null;
      }
      
      [Untrusted]
      public function getOrnament() : Ornament
      {
         var ornament:Ornament = null;
         var ornamentId:int = (Kernel.getWorker().getFrame(TinselFrame) as TinselFrame).currentOrnament;
         if(ornamentId)
         {
            ornament = Ornament.getOrnamentById(ornamentId);
            return ornament;
         }
         return null;
      }
      
      [Untrusted]
      public function getKnownTitles() : Vector.<uint>
      {
         return (Kernel.getWorker().getFrame(TinselFrame) as TinselFrame).knownTitles;
      }
      
      [Untrusted]
      public function getKnownOrnaments() : Vector.<uint>
      {
         return (Kernel.getWorker().getFrame(TinselFrame) as TinselFrame).knownOrnaments;
      }
      
      [Untrusted]
      public function titlesOrnamentsAskedBefore() : Boolean
      {
         return (Kernel.getWorker().getFrame(TinselFrame) as TinselFrame).titlesOrnamentsAskedBefore;
      }
      
      [Untrusted]
      public function getEntityInfos() : GameRolePlayCharacterInformations
      {
         var entitiesFrame:AbstractEntitiesFrame = null;
         if(this.isInFight())
         {
            entitiesFrame = Kernel.getWorker().getFrame(FightEntitiesFrame) as AbstractEntitiesFrame;
         }
         else
         {
            entitiesFrame = Kernel.getWorker().getFrame(RoleplayEntitiesFrame) as AbstractEntitiesFrame;
         }
         if(!entitiesFrame)
         {
            return null;
         }
         var playerInfo:GameRolePlayCharacterInformations = entitiesFrame.getEntityInfos(PlayedCharacterManager.getInstance().id) as GameRolePlayCharacterInformations;
         return playerInfo;
      }
      
      [Untrusted]
      public function getEntityTooltipInfos() : CharacterTooltipInformation
      {
         var playerInfo:GameRolePlayCharacterInformations = this.getEntityInfos();
         if(!playerInfo)
         {
            return null;
         }
         var tooltipInfos:CharacterTooltipInformation = new CharacterTooltipInformation(playerInfo,0);
         return tooltipInfos;
      }
      
      [Untrusted]
      public function getKamasMaxLimit() : Number
      {
         var playedCharacterFrame:PlayedCharacterUpdatesFrame = Kernel.getWorker().getFrame(PlayedCharacterUpdatesFrame) as PlayedCharacterUpdatesFrame;
         if(playedCharacterFrame)
         {
            return playedCharacterFrame.kamasLimit;
         }
         return 0;
      }
      
      [Untrusted]
      public function inventoryWeight() : uint
      {
         return PlayedCharacterManager.getInstance().inventoryWeight;
      }
      
      [Untrusted]
      public function inventoryWeightMax() : uint
      {
         return PlayedCharacterManager.getInstance().inventoryWeightMax;
      }
      
      [Untrusted]
      public function isIncarnation() : Boolean
      {
         return PlayedCharacterManager.getInstance().isIncarnation;
      }
      
      [Untrusted]
      public function isMutated() : Boolean
      {
         return PlayedCharacterManager.getInstance().isMutated;
      }
      
      [Untrusted]
      public function isInHouse() : Boolean
      {
         return PlayedCharacterManager.getInstance().isInHouse;
      }
      
      [Untrusted]
      public function isInExchange() : Boolean
      {
         return PlayedCharacterManager.getInstance().isInExchange;
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
      public function isInParty() : Boolean
      {
         return PlayedCharacterManager.getInstance().isInParty;
      }
      
      [Untrusted]
      public function isPartyLeader() : Boolean
      {
         return PlayedCharacterManager.getInstance().isPartyLeader;
      }
      
      [Untrusted]
      public function isRidding() : Boolean
      {
         return PlayedCharacterManager.getInstance().isRidding;
      }
      
      [Untrusted]
      public function isPetsMounting() : Boolean
      {
         return PlayedCharacterManager.getInstance().isPetsMounting;
      }
      
      [Untrusted]
      public function hasCompanion() : Boolean
      {
         return PlayedCharacterManager.getInstance().hasCompanion;
      }
      
      [Untrusted]
      public function id() : Number
      {
         return PlayedCharacterManager.getInstance().id;
      }
      
      [Untrusted]
      public function restrictions() : ActorRestrictionsInformations
      {
         return PlayedCharacterManager.getInstance().restrictions;
      }
      
      [Untrusted]
      public function isMutant() : Boolean
      {
         var rcf:RoleplayContextFrame = Kernel.getWorker().getFrame(RoleplayContextFrame) as RoleplayContextFrame;
         var infos:GameRolePlayActorInformations = rcf.entitiesFrame.getEntityInfos(PlayedCharacterManager.getInstance().id) as GameRolePlayActorInformations;
         return infos is GameRolePlayMutantInformations;
      }
      
      [Untrusted]
      public function publicMode() : Boolean
      {
         return PlayedCharacterManager.getInstance().publicMode;
      }
      
      [Untrusted]
      public function artworkId() : int
      {
         return PlayedCharacterManager.getInstance().artworkId;
      }
      
      [Untrusted]
      public function isCreature() : Boolean
      {
         return EntitiesLooksManager.getInstance().isCreature(this.id());
      }
      
      [Untrusted]
      public function getBone() : uint
      {
         var i:CharacterBaseInformations = PlayedCharacterManager.getInstance().infos;
         return EntityLookAdapter.fromNetwork(i.entityLook).getBone();
      }
      
      [Untrusted]
      public function getSkin() : uint
      {
         var i:CharacterBaseInformations = PlayedCharacterManager.getInstance().infos;
         if(EntityLookAdapter.fromNetwork(i.entityLook) && EntityLookAdapter.fromNetwork(i.entityLook).getSkins() && EntityLookAdapter.fromNetwork(i.entityLook).getSkins().length > 0)
         {
            return EntityLookAdapter.fromNetwork(i.entityLook).getSkins()[0];
         }
         return 0;
      }
      
      [Untrusted]
      public function getColors() : Object
      {
         var i:CharacterBaseInformations = PlayedCharacterManager.getInstance().infos;
         return EntityLookAdapter.fromNetwork(i.entityLook).getColors();
      }
      
      [Untrusted]
      public function getSubentityColors() : Object
      {
         var i:CharacterBaseInformations = PlayedCharacterManager.getInstance().infos;
         var subTel:TiphonEntityLook = EntityLookAdapter.fromNetwork(i.entityLook).getSubEntity(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_MOUNT_DRIVER,0);
         if(!subTel && PlayedCharacterManager.getInstance().realEntityLook)
         {
            subTel = EntityLookAdapter.fromNetwork(PlayedCharacterManager.getInstance().realEntityLook).getSubEntity(SubEntityBindingPointCategoryEnum.HOOK_POINT_CATEGORY_MOUNT_DRIVER,0);
         }
         return !!subTel?subTel.getColors():null;
      }
      
      [Untrusted]
      public function getAlignmentSide() : int
      {
         if(PlayedCharacterManager.getInstance().characteristics)
         {
            return PlayedCharacterManager.getInstance().characteristics.alignmentInfos.alignmentSide;
         }
         return AlignmentSideEnum.ALIGNMENT_NEUTRAL;
      }
      
      [Untrusted]
      public function getAlignmentValue() : uint
      {
         return PlayedCharacterManager.getInstance().characteristics.alignmentInfos.alignmentValue;
      }
      
      [Untrusted]
      public function getAlignmentAggressableStatus() : uint
      {
         return PlayedCharacterManager.getInstance().characteristics.alignmentInfos.aggressable;
      }
      
      [Untrusted]
      public function getAlignmentGrade() : uint
      {
         return PlayedCharacterManager.getInstance().characteristics.alignmentInfos.alignmentGrade;
      }
      
      [Untrusted]
      public function getMaxSummonedCreature() : uint
      {
         return CurrentPlayedFighterManager.getInstance().getMaxSummonedCreature();
      }
      
      [Untrusted]
      public function getCurrentSummonedCreature() : uint
      {
         return CurrentPlayedFighterManager.getInstance().getCurrentSummonedCreature();
      }
      
      [Untrusted]
      public function canSummon() : Boolean
      {
         return CurrentPlayedFighterManager.getInstance().canSummon();
      }
      
      [Untrusted]
      public function getSpell(spellId:uint) : SpellWrapper
      {
         return CurrentPlayedFighterManager.getInstance().getSpellById(spellId);
      }
      
      [Untrusted]
      public function canCastThisSpell(spellId:uint, lvl:uint) : Boolean
      {
         return CurrentPlayedFighterManager.getInstance().canCastThisSpell(spellId,lvl);
      }
      
      [Untrusted]
      public function canCastThisSpellWithResult(spellId:uint, lvl:uint, target:Number = 0) : String
      {
         var resultA:Array = ["."];
         CurrentPlayedFighterManager.getInstance().canCastThisSpell(spellId,lvl,target,resultA);
         return resultA[0];
      }
      
      [Untrusted]
      public function canCastThisSpellOnTarget(spellId:uint, lvl:uint, pTargetId:Number) : Boolean
      {
         return CurrentPlayedFighterManager.getInstance().canCastThisSpell(spellId,lvl,pTargetId);
      }
      
      [Untrusted]
      public function getSpellModification(spellId:uint, carac:int) : int
      {
         var modif:CharacterSpellModification = CurrentPlayedFighterManager.getInstance().getSpellModifications(spellId,carac);
         if(modif && modif.value)
         {
            return modif.value.alignGiftBonus + modif.value.base + modif.value.additionnal + modif.value.contextModif + modif.value.objectsAndMountBonus;
         }
         return 0;
      }
      
      [Untrusted]
      public function getSpellModifications(spellId:uint) : Vector.<CharacterSpellModification>
      {
         var spellModif:CharacterSpellModification = null;
         var spellModifs:Vector.<CharacterSpellModification> = new Vector.<CharacterSpellModification>(0);
         for each(spellModif in CurrentPlayedFighterManager.getInstance().getCharacteristicsInformations().spellModifications)
         {
            if(spellModif.spellId == spellId)
            {
               spellModifs.push(spellModif);
            }
         }
         return spellModifs;
      }
      
      [Untrusted]
      public function isInHisHouse() : Boolean
      {
         return PlayedCharacterManager.getInstance().isInHisHouse;
      }
      
      [Untrusted]
      public function getPlayerHouses() : Vector.<HouseWrapper>
      {
         return (Kernel.getWorker().getFrame(HouseFrame) as HouseFrame).accountHouses;
      }
      
      [Untrusted]
      public function currentMap() : WorldPointWrapper
      {
         return PlayedCharacterManager.getInstance().currentMap;
      }
      
      [Untrusted]
      public function currentSubArea() : SubArea
      {
         return PlayedCharacterManager.getInstance().currentSubArea;
      }
      
      [Untrusted]
      public function isInTutorialArea() : Boolean
      {
         var subarea:SubArea = PlayedCharacterManager.getInstance().currentSubArea;
         return subarea && subarea.id == DataEnum.SUBAREA_TUTORIAL;
      }
      
      [Untrusted]
      public function state() : uint
      {
         return PlayedCharacterManager.getInstance().state;
      }
      
      [Untrusted]
      public function isAlive() : Boolean
      {
         return PlayedCharacterManager.getInstance().state == PlayerLifeStatusEnum.STATUS_ALIVE_AND_KICKING;
      }
      
      [Untrusted]
      public function getFollowingPlayerIds() : Vector.<Number>
      {
         return PlayedCharacterManager.getInstance().followingPlayerIds;
      }
      
      [Untrusted]
      public function getPlayerSet(objectGID:uint) : PlayerSetInfo
      {
         return PlayedCharacterUpdatesFrame(Kernel.getWorker().getFrame(PlayedCharacterUpdatesFrame)).getPlayerSet(objectGID);
      }
      
      [Untrusted]
      public function getWeapon() : WeaponWrapper
      {
         var build:BuildWrapper = null;
         var iw:ItemWrapper = null;
         if(InventoryManager.getInstance().currentBuildId != -1)
         {
            for each(build in InventoryManager.getInstance().builds)
            {
               if(build.id == InventoryManager.getInstance().currentBuildId)
               {
                  break;
               }
            }
            for each(iw in build.equipment)
            {
               if(iw is WeaponWrapper)
               {
                  break;
               }
            }
            if(iw as WeaponWrapper)
            {
               return iw as WeaponWrapper;
            }
            return null;
         }
         return PlayedCharacterManager.getInstance().currentWeapon;
      }
      
      [Untrusted]
      public function getExperienceBonusPercent() : int
      {
         return PlayedCharacterManager.getInstance().experiencePercent;
      }
      
      [Untrusted]
      public function getAchievementPoints() : int
      {
         return PlayedCharacterManager.getInstance().achievementPoints;
      }
      
      [Untrusted]
      public function getWaitingGifts() : Array
      {
         return PlayedCharacterManager.getInstance().waitingGifts;
      }
      
      [Untrusted]
      public function getSoloIdols() : Vector.<uint>
      {
         return PlayedCharacterManager.getInstance().soloIdols;
      }
      
      [Untrusted]
      public function getPartyIdols() : Vector.<uint>
      {
         return PlayedCharacterManager.getInstance().partyIdols;
      }
      
      [Untrusted]
      public function setPartyIdols(pIdols:Vector.<uint>) : void
      {
         PlayedCharacterManager.getInstance().partyIdols = pIdols;
      }
      
      [Untrusted]
      public function getIdolsPresets() : Vector.<IdolsPresetWrapper>
      {
         return PlayedCharacterManager.getInstance().idolsPresets;
      }
      
      [Untrusted]
      public function knowSpell(pSpellId:uint) : int
      {
         var obtentionSpellLevel:uint = 0;
         var playerSpellLevel:uint = 0;
         var sp:SpellWrapper = null;
         var disable:Boolean = false;
         var spellWrapper:SpellWrapper = null;
         var spellLevelZero:SpellLevel = null;
         var spell:Spell = Spell.getSpellById(pSpellId);
         var spellLevel:SpellLevel = SpellLevel.getLevelById(pSpellId);
         if(pSpellId == 0)
         {
            obtentionSpellLevel = 0;
         }
         else
         {
            spellLevelZero = spell.getSpellLevel(1);
            obtentionSpellLevel = spellLevelZero.minPlayerLevel;
         }
         var spellInv:Array = this.getSpellInventory();
         for each(sp in spellInv)
         {
            if(sp.spellId == pSpellId)
            {
               playerSpellLevel = sp.spellLevel;
            }
         }
         disable = true;
         for each(spellWrapper in spellInv)
         {
            if(spellWrapper.spellId == pSpellId)
            {
               disable = false;
            }
         }
         if(disable)
         {
            return -1;
         }
         return playerSpellLevel;
      }
      
      [Untrusted]
      public function isInHisHavenbag() : Boolean
      {
         return PlayedCharacterManager.getInstance().isInHisHavenbag;
      }
      
      [Untrusted]
      public function isInHavenbag() : Boolean
      {
         return PlayedCharacterManager.getInstance().isInHavenbag;
      }
      
      [Untrusted]
      public function havenbagSharePermissions() : uint
      {
         var hbFrame:HavenbagFrame = Kernel.getWorker().getFrame(HavenbagFrame) as HavenbagFrame;
         return hbFrame.sharePermissions;
      }
      
      [Untrusted]
      public function isInBreach() : Boolean
      {
         return PlayedCharacterManager.getInstance().isInBreach;
      }
      
      [Untrusted]
      public function isInAnomaly() : Boolean
      {
         return PlayedCharacterManager.getInstance().isInAnomaly;
      }
   }
}
