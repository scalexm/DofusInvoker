package com.ankamagames.dofus.internalDatacenter.items
{
   import com.ankamagames.berilia.managers.SlotDataHolderManager;
   import com.ankamagames.dofus.logic.game.common.managers.InventoryManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.misc.EntityLookAdapter;
   import com.ankamagames.dofus.network.types.game.presets.CharacterCharacteristicForPreset;
   import com.ankamagames.dofus.network.types.game.presets.FullStatsPreset;
   import com.ankamagames.dofus.network.types.game.presets.ItemForPreset;
   import com.ankamagames.dofus.network.types.game.presets.ItemsPreset;
   import com.ankamagames.dofus.network.types.game.presets.SpellForPreset;
   import com.ankamagames.dofus.network.types.game.presets.SpellsPreset;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   import com.ankamagames.jerakine.interfaces.ISlotData;
   import com.ankamagames.jerakine.interfaces.ISlotDataHolder;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.tiphon.types.look.TiphonEntityLook;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class BuildWrapper extends ItemWrapper implements IDataCenter
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(BuildWrapper));
      
      private static var _cache:Array = [];
       
      
      private var _uri:Uri;
      
      private var _slotDataHolderManager:SlotDataHolderManager;
      
      public var gfxId:int;
      
      public var buildName:String;
      
      public var fullStatsPreset:FullStatsPreset;
      
      public var itemsPreset:ItemsPreset;
      
      public var spellsPreset:SpellsPreset;
      
      public var equipment:Vector.<ItemWrapper>;
      
      public var hasMount:Boolean = false;
      
      public var spellShortcutsBySpellId:Array;
      
      public var statsByKeyword:Dictionary;
      
      public var characterLook:TiphonEntityLook;
      
      public function BuildWrapper()
      {
         super();
      }
      
      public static function create(id:uint, position:int = -1, name:String = "", gfxId:int = 0, fullStatsPreset:FullStatsPreset = null, itemsPreset:ItemsPreset = null, spellsPreset:SpellsPreset = null, useCache:Boolean = true) : BuildWrapper
      {
         var build:BuildWrapper = null;
         if(!_cache[id] || !useCache)
         {
            build = new BuildWrapper();
            if(useCache)
            {
               _cache[id] = build;
            }
            build._slotDataHolderManager = new SlotDataHolderManager(build);
         }
         else
         {
            build = _cache[id];
         }
         build._uri = null;
         build.id = id;
         build.gfxId = gfxId;
         _log.error("create build " + name + "    gfxId " + gfxId);
         build.buildName = name;
         if(position >= 0)
         {
            build.position = position;
         }
         build.fullStatsPreset = fullStatsPreset;
         build.itemsPreset = itemsPreset;
         build.spellsPreset = spellsPreset;
         build.prepareData();
         return build;
      }
      
      public static function refreshAllBuildHolders() : void
      {
         var wrapper:BuildWrapper = null;
         for each(wrapper in _cache)
         {
            wrapper._slotDataHolderManager.refreshAll();
         }
      }
      
      public static function getBuildWrapperById(id:uint) : BuildWrapper
      {
         return _cache[id];
      }
      
      override public function get iconUri() : Uri
      {
         if(!this._uri)
         {
            this._uri = new Uri(XmlConfig.getInstance().getEntry("config.gfx.path").concat("presets/icons.swf|icon_").concat(this.gfxId));
            _log.error("get iconUri for " + name + "    -->  " + this._uri);
         }
         return this._uri;
      }
      
      override public function get fullSizeIconUri() : Uri
      {
         return this.iconUri;
      }
      
      override public function get backGroundIconUri() : Uri
      {
         return null;
      }
      
      override public function get errorIconUri() : Uri
      {
         return null;
      }
      
      override public function get info1() : String
      {
         return null;
      }
      
      override public function get startTime() : int
      {
         return 0;
      }
      
      override public function get endTime() : int
      {
         return 0;
      }
      
      override public function set endTime(t:int) : void
      {
      }
      
      override public function get timer() : int
      {
         return 0;
      }
      
      override public function get active() : Boolean
      {
         return true;
      }
      
      override public function get isUsable() : Boolean
      {
         return true;
      }
      
      override public function toString() : String
      {
         return "[BuildWrapper " + id + " " + name + "]";
      }
      
      public function updateBuild(name:String = "", gfxId:int = 0, fullStatsPreset:FullStatsPreset = null, itemsPreset:ItemsPreset = null, spellsPreset:SpellsPreset = null) : void
      {
         this._uri = null;
         this.gfxId = gfxId;
         _log.error("update build " + name + "   gfxId " + gfxId);
         this.buildName = name;
         this.fullStatsPreset = fullStatsPreset;
         this.itemsPreset = itemsPreset;
         this.spellsPreset = spellsPreset;
         this.prepareData();
      }
      
      public function prepareData() : void
      {
         var carac:CharacterCharacteristicForPreset = null;
         var playerInventory:Vector.<ItemWrapper> = null;
         var inventoryItem:ItemWrapper = null;
         var itemForPreset:ItemForPreset = null;
         var itemFoundInInventory:Boolean = false;
         var cloneItem:ItemWrapper = null;
         var item:ItemWrapper = null;
         var sfp:SpellForPreset = null;
         this.statsByKeyword = new Dictionary();
         _log.warn("Caractéristiques");
         if(this.fullStatsPreset)
         {
            for each(carac in this.fullStatsPreset.stats)
            {
               this.statsByKeyword[carac.keyword] = carac;
               _log.warn("   - " + carac.keyword + " : " + carac.base + " + " + carac.additionnal + " + " + carac.stuff);
            }
         }
         _log.warn("Items");
         var delinkedUri:Uri = new Uri(XmlConfig.getInstance().getEntry("config.ui.skin") + "bitmap/failureSlot.png");
         this.equipment = new Vector.<ItemWrapper>();
         if(this.itemsPreset)
         {
            playerInventory = PlayedCharacterManager.getInstance().inventory;
            for each(itemForPreset in this.itemsPreset.items)
            {
               itemFoundInInventory = false;
               if(itemForPreset.objUid > 0)
               {
                  for each(inventoryItem in playerInventory)
                  {
                     if(itemForPreset.objUid == inventoryItem.objectUID)
                     {
                        cloneItem = inventoryItem.clone();
                        cloneItem.position = itemForPreset.position;
                        cloneItem.quantity = 1;
                        _log.warn("   - (i) " + cloneItem.position + " : " + cloneItem.name + "   uid " + itemForPreset.objUid + "   gid " + itemForPreset.objGid);
                        this.equipment.push(cloneItem);
                        itemFoundInInventory = true;
                        break;
                     }
                  }
               }
               if(!itemFoundInInventory)
               {
                  item = ItemWrapper.create(itemForPreset.position,itemForPreset.objUid,itemForPreset.objGid,1,null,false);
                  item.backGroundIconUri = delinkedUri;
                  item.active = false;
                  _log.warn("   - " + item.position + " : " + item.name + "   uid " + itemForPreset.objUid + "   gid " + itemForPreset.objGid);
                  this.equipment.push(item);
               }
            }
            this.characterLook = EntityLookAdapter.fromNetwork(this.itemsPreset.look);
            _log.warn(" look : " + this.characterLook);
            this.hasMount = this.itemsPreset.mountEquipped;
            _log.warn(" monture équipée : " + this.itemsPreset.mountEquipped);
         }
         _log.warn("Sorts");
         this.spellShortcutsBySpellId = [];
         if(this.spellsPreset)
         {
            for each(sfp in this.spellsPreset.spells)
            {
               this.spellShortcutsBySpellId[sfp.spellId] = sfp.shortcuts;
            }
         }
      }
      
      public function updateObject(object:ItemForPreset) : void
      {
         var oldPosition:int = 0;
         var item:ItemWrapper = null;
         var index:int = -1;
         for(var i:int = 0; i < this.equipment.length; )
         {
            if(this.equipment[i].position == object.position && this.equipment[i].hasOwnProperty("objectGID") && this.equipment[i].objectGID == object.objGid)
            {
               index = i;
               break;
            }
            i++;
         }
         if(index == -1)
         {
            return;
         }
         var delinkedUri:Uri = new Uri(XmlConfig.getInstance().getEntry("config.ui.skin") + "bitmap/failureSlot.png");
         if(object.objUid)
         {
            oldPosition = this.equipment[index].position;
            item = InventoryManager.getInstance().inventory.getItem(object.objUid);
            if(!item)
            {
               this.equipment[index].objectUID = 0;
               this.equipment[index].backGroundIconUri = delinkedUri;
            }
            else
            {
               this.equipment[index] = item.clone();
               if(this.equipment[index])
               {
                  this.equipment[index].position = oldPosition;
                  this.equipment[index].quantity = 1;
               }
            }
         }
         else
         {
            this.equipment[index].objectUID = 0;
            this.equipment[index].backGroundIconUri = delinkedUri;
         }
         _log.debug("Update de l\'item " + this.equipment[index].name + "  gid " + this.equipment[index].objectGID + ", uid " + this.equipment[index].objectUID);
      }
      
      override public function addHolder(h:ISlotDataHolder) : void
      {
         this._slotDataHolderManager.addHolder(h);
      }
      
      override public function removeHolder(h:ISlotDataHolder) : void
      {
         this._slotDataHolderManager.removeHolder(h);
      }
      
      public function setLinkedSlotData(slotData:ISlotData) : void
      {
         this._slotDataHolderManager.setLinkedSlotData(slotData);
      }
      
      override public function getIconUri(pngMode:Boolean = true) : Uri
      {
         return this.iconUri;
      }
   }
}
