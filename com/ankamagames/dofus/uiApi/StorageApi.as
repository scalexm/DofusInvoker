package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.dofus.datacenter.items.Item;
   import com.ankamagames.dofus.datacenter.items.ItemType;
   import com.ankamagames.dofus.datacenter.jobs.Skill;
   import com.ankamagames.dofus.datacenter.livingObjects.Pet;
   import com.ankamagames.dofus.datacenter.mounts.RideFood;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.MountWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.SimpleTextureWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.MountFrame;
   import com.ankamagames.dofus.logic.game.common.managers.InventoryManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.StorageOptionManager;
   import com.ankamagames.dofus.logic.game.common.misc.IInventoryView;
   import com.ankamagames.dofus.network.enums.ShortcutBarEnum;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.jerakine.utils.misc.StringUtils;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class StorageApi implements IApi
   {
      
      private static const _log:Logger = Log.getLogger(getQualifiedClassName(StorageApi));
      
      private static var _lastItemPosition:Array = new Array();
      
      public static const ITEM_TYPE_TO_SERVER_POSITION:Array = [[],[0],[1],[2,4],[3],[5],[],[15],[1],[],[6],[7],[8],[9,10,11,12,13,14],[],[20],[21],[22,23],[24,25],[26],[27],[16],[],[28],[8,16],[30]];
       
      
      public function StorageApi()
      {
         super();
      }
      
      [Untrusted]
      public function itemSuperTypeToServerPosition(superTypeId:uint) : Array
      {
         return ITEM_TYPE_TO_SERVER_POSITION[superTypeId];
      }
      
      [Untrusted]
      public function serverPositionsToItemSuperType(position:int) : Array
      {
         var superTypes:Array = [];
         var i:int = 0;
         for(var typesCount:int = ITEM_TYPE_TO_SERVER_POSITION.length; i < typesCount; )
         {
            if(ITEM_TYPE_TO_SERVER_POSITION[i].length && ITEM_TYPE_TO_SERVER_POSITION[i].indexOf(position) != -1)
            {
               superTypes.push(i);
            }
            i++;
         }
         return superTypes;
      }
      
      [Untrusted]
      public function getInventoryItemsForSuperType(id:int) : Vector.<ItemWrapper>
      {
         var itemList:Vector.<ItemWrapper> = new Vector.<ItemWrapper>();
         var inventory:Vector.<ItemWrapper> = InventoryManager.getInstance().inventory.getView("storage").content;
         var itemsCount:int = inventory.length;
         for(var i:int = 0; i < itemsCount; )
         {
            if((inventory[i] as ItemWrapper).type.superTypeId == id)
            {
               itemList.push(inventory[i]);
            }
            i++;
         }
         return itemList;
      }
      
      [Untrusted]
      public function getLivingObjectFood(itemType:int) : Vector.<ItemWrapper>
      {
         var item:ItemWrapper = null;
         var itemList:Vector.<ItemWrapper> = new Vector.<ItemWrapper>();
         var inventory:Vector.<ItemWrapper> = InventoryManager.getInstance().inventory.getView("storage").content;
         var nb:int = inventory.length;
         for(var i:int = 0; i < nb; )
         {
            item = inventory[i];
            if(!item.isLivingObject && item.type.id == itemType)
            {
               itemList.push(item);
            }
            i++;
         }
         return itemList;
      }
      
      [Untrusted]
      public function getPetFood(id:int) : Vector.<ItemWrapper>
      {
         var inventory:Vector.<ItemWrapper> = null;
         var foodItems:Vector.<int> = null;
         var foodTypeItems:Vector.<int> = null;
         var nb:int = 0;
         var i:int = 0;
         var item:ItemWrapper = null;
         var itemList:Vector.<ItemWrapper> = new Vector.<ItemWrapper>();
         var pet:Pet = Pet.getPetById(id);
         if(pet)
         {
            inventory = InventoryManager.getInstance().inventory.getView("storage").content;
            foodItems = Pet.getPetById(id).foodItems;
            foodTypeItems = Pet.getPetById(id).foodTypes;
            nb = inventory.length;
            for(i = 0; i < nb; )
            {
               item = inventory[i];
               if(foodItems.indexOf(item.objectGID) > -1 || foodTypeItems.indexOf(item.typeId) > -1)
               {
                  itemList.push(item);
               }
               i++;
            }
         }
         return itemList;
      }
      
      [Untrusted]
      public function getRideFoodsFor(familyId:int) : Array
      {
         var rideFood:RideFood = null;
         var item:ItemWrapper = null;
         var it:Item = null;
         var itemList:Array = new Array();
         var inventory:Vector.<ItemWrapper> = InventoryManager.getInstance().inventory.getView("storage").content;
         var rideFoods:Array = RideFood.getRideFoods();
         var gids:Array = new Array();
         var typeIds:Array = new Array();
         for each(rideFood in rideFoods)
         {
            if(rideFood.familyId == familyId)
            {
               if(rideFood.gid != 0)
               {
                  gids.push(rideFood.gid);
               }
               if(rideFood.typeId != 0)
               {
                  typeIds.push(rideFood.typeId);
               }
            }
         }
         for each(item in inventory)
         {
            it = Item.getItemById(item.objectGID);
            if(gids.indexOf(item.objectGID) != -1 || typeIds.indexOf(it.typeId) != -1)
            {
               itemList.push(item);
            }
         }
         return itemList;
      }
      
      [Untrusted]
      public function getViewContent(name:String) : Vector.<ItemWrapper>
      {
         var view:IInventoryView = InventoryManager.getInstance().inventory.getView(name);
         if(view)
         {
            return view.content;
         }
         return null;
      }
      
      [Untrusted]
      public function getShortcutBarContent(barType:uint) : Array
      {
         if(barType == ShortcutBarEnum.GENERAL_SHORTCUT_BAR)
         {
            return InventoryManager.getInstance().shortcutBarItems;
         }
         if(barType == ShortcutBarEnum.SPELL_SHORTCUT_BAR)
         {
            return InventoryManager.getInstance().shortcutBarSpells;
         }
         return new Array();
      }
      
      [Untrusted]
      public function getFakeItemMount() : MountWrapper
      {
         if(PlayedCharacterManager.getInstance().mount)
         {
            return MountWrapper.create();
         }
         return null;
      }
      
      [Untrusted]
      public function getFakeItemMountOrRedCross() : Object
      {
         if(PlayedCharacterManager.getInstance().mount)
         {
            return MountWrapper.create();
         }
         var emptyUri:Uri = new Uri(XmlConfig.getInstance().getEntry("config.ui.skin") + "bitmap/failureSlot.png");
         var emptyWrapper:SimpleTextureWrapper = SimpleTextureWrapper.create(emptyUri);
         return emptyWrapper;
      }
      
      [Untrusted]
      public function getBestEquipablePosition(item:Object) : int
      {
         var cat:int = 0;
         var type:ItemType = null;
         var equipement:Object = null;
         var freeSlot:int = 0;
         var pos:int = 0;
         var lastIndex:int = 0;
         var superTypeId:int = item.type.superTypeId;
         if(item && (item.isLivingObject || item.isWrapperObject))
         {
            cat = 0;
            if(item.isLivingObject)
            {
               cat = item.livingObjectCategory;
            }
            else
            {
               cat = item.wrapperObjectCategory;
            }
            type = ItemType.getItemTypeById(cat);
            if(type)
            {
               superTypeId = type.superTypeId;
            }
         }
         var possiblePosition:Object = this.itemSuperTypeToServerPosition(superTypeId);
         if(possiblePosition && possiblePosition.length)
         {
            equipement = this.getViewContent("equipment");
            freeSlot = -1;
            for each(pos in possiblePosition)
            {
               if(equipement[pos] && equipement[pos].objectGID == item.objectGID && (item.typeId != 9 || item.belongsToSet))
               {
                  freeSlot = pos;
                  break;
               }
            }
            if(freeSlot == -1)
            {
               for each(pos in possiblePosition)
               {
                  if(!equipement[pos])
                  {
                     freeSlot = pos;
                     break;
                  }
               }
            }
            if(freeSlot == -1)
            {
               if(!_lastItemPosition[item.type.superTypeId])
               {
                  _lastItemPosition[item.type.superTypeId] = 0;
               }
               lastIndex = ++_lastItemPosition[item.type.superTypeId];
               if(lastIndex >= possiblePosition.length)
               {
                  lastIndex = 0;
               }
               _lastItemPosition[item.type.superTypeId] = lastIndex;
               freeSlot = possiblePosition[lastIndex];
            }
         }
         return freeSlot;
      }
      
      [Untrusted]
      public function addItemMask(itemUID:int, name:String, quantity:int) : void
      {
         InventoryManager.getInstance().inventory.addItemMask(itemUID,name,quantity);
      }
      
      [Untrusted]
      public function removeItemMask(itemUID:int, name:String) : void
      {
         InventoryManager.getInstance().inventory.removeItemMask(itemUID,name);
      }
      
      [Untrusted]
      public function removeAllItemMasks(name:String) : void
      {
         InventoryManager.getInstance().inventory.removeAllItemMasks(name);
      }
      
      [Untrusted]
      public function releaseHooks() : void
      {
         InventoryManager.getInstance().inventory.releaseHooks();
      }
      
      [Untrusted]
      public function releaseBankHooks() : void
      {
         InventoryManager.getInstance().bankInventory.releaseHooks();
      }
      
      [Untrusted]
      public function dracoTurkyInventoryWeight() : uint
      {
         var mf:MountFrame = Kernel.getWorker().getFrame(MountFrame) as MountFrame;
         return mf.inventoryWeight;
      }
      
      [Untrusted]
      public function dracoTurkyMaxInventoryWeight() : uint
      {
         var mf:MountFrame = Kernel.getWorker().getFrame(MountFrame) as MountFrame;
         return mf.inventoryMaxWeight;
      }
      
      [Untrusted]
      public function getStorageTypes(category:int) : Array
      {
         var entry:Object = null;
         var array:Array = new Array();
         var dict:Dictionary = StorageOptionManager.getInstance().getCategoryTypes(category);
         if(!dict)
         {
            return null;
         }
         for each(entry in dict)
         {
            array.push(entry);
         }
         array.sort(this.sortStorageTypes);
         return array;
      }
      
      private function sortStorageTypes(a:Object, b:Object) : int
      {
         return -StringUtils.noAccent(b.name).localeCompare(StringUtils.noAccent(a.name));
      }
      
      [Untrusted]
      public function getBankStorageTypes(category:int) : Array
      {
         var entry:Object = null;
         var array:Array = new Array();
         var dict:Dictionary = StorageOptionManager.getInstance().getBankCategoryTypes(category);
         if(!dict)
         {
            return null;
         }
         for each(entry in dict)
         {
            array.push(entry);
         }
         array.sortOn("name");
         return array;
      }
      
      [Untrusted]
      public function setDisplayedCategory(category:int) : void
      {
         StorageOptionManager.getInstance().category = category;
      }
      
      [Untrusted]
      public function setDisplayedBankCategory(category:int) : void
      {
         StorageOptionManager.getInstance().bankCategory = category;
      }
      
      [Untrusted]
      public function getDisplayedCategory() : int
      {
         return StorageOptionManager.getInstance().category;
      }
      
      [Untrusted]
      public function getDisplayedBankCategory() : int
      {
         return StorageOptionManager.getInstance().bankCategory;
      }
      
      [Untrusted]
      public function setStorageFilter(typeId:int) : void
      {
         StorageOptionManager.getInstance().filter = typeId;
      }
      
      [Untrusted]
      public function setBankStorageFilter(typeId:int) : void
      {
         StorageOptionManager.getInstance().bankFilter = typeId;
      }
      
      [Untrusted]
      public function getStorageFilter() : int
      {
         return StorageOptionManager.getInstance().filter;
      }
      
      [Untrusted]
      public function getBankStorageFilter() : int
      {
         return StorageOptionManager.getInstance().bankFilter;
      }
      
      [Untrusted]
      public function updateStorageView() : void
      {
         StorageOptionManager.getInstance().updateStorageView();
      }
      
      [Untrusted]
      public function updateBankStorageView() : void
      {
         StorageOptionManager.getInstance().updateBankStorageView();
      }
      
      [Untrusted]
      public function sort(sortField:int, revert:Boolean) : void
      {
         StorageOptionManager.getInstance().sortRevert = revert;
         StorageOptionManager.getInstance().sortField = sortField;
      }
      
      [Untrusted]
      public function resetSort() : void
      {
         StorageOptionManager.getInstance().resetSort();
      }
      
      [Untrusted]
      public function sortBank(sortField:int, revert:Boolean) : void
      {
         StorageOptionManager.getInstance().sortBankRevert = revert;
         StorageOptionManager.getInstance().sortBankField = sortField;
      }
      
      [Untrusted]
      public function resetBankSort() : void
      {
         StorageOptionManager.getInstance().resetBankSort();
      }
      
      [Untrusted]
      public function getSortFields() : Array
      {
         return StorageOptionManager.getInstance().sortFields;
      }
      
      [Untrusted]
      public function getSortBankFields() : Array
      {
         return StorageOptionManager.getInstance().sortBankFields;
      }
      
      [Untrusted]
      public function unsort() : void
      {
         StorageOptionManager.getInstance().sortField = StorageOptionManager.SORT_FIELD_NONE;
      }
      
      [Untrusted]
      public function unsortBank() : void
      {
         StorageOptionManager.getInstance().sortBankField = StorageOptionManager.SORT_FIELD_NONE;
      }
      
      [Untrusted]
      public function enableBidHouseFilter(allowedTypes:Object, maxItemLevel:uint) : void
      {
         var entry:uint = 0;
         var vtypes:Vector.<uint> = new Vector.<uint>();
         for each(entry in allowedTypes)
         {
            vtypes.push(entry);
         }
         StorageOptionManager.getInstance().enableBidHouseFilter(vtypes,maxItemLevel);
      }
      
      [Untrusted]
      public function disableBidHouseFilter() : void
      {
         StorageOptionManager.getInstance().disableBidHouseFilter();
      }
      
      [Untrusted]
      public function getIsBidHouseFilterEnabled() : Boolean
      {
         return StorageOptionManager.getInstance().getIsBidHouseFilterEnabled();
      }
      
      [Untrusted]
      public function enableSmithMagicFilter(skill:Object) : void
      {
         StorageOptionManager.getInstance().enableSmithMagicFilter(skill as Skill);
      }
      
      [Untrusted]
      public function disableSmithMagicFilter() : void
      {
         StorageOptionManager.getInstance().disableSmithMagicFilter();
      }
      
      [Untrusted]
      public function getIsCraftFilterEnabled() : Boolean
      {
         return StorageOptionManager.getInstance().getIsCraftFilterEnabled();
      }
      
      [Untrusted]
      public function enableCraftFilter(skill:Object, jobLevel:int) : void
      {
         StorageOptionManager.getInstance().enableCraftFilter(skill as Skill,jobLevel);
      }
      
      [Untrusted]
      public function disableCraftFilter() : void
      {
         StorageOptionManager.getInstance().disableCraftFilter();
      }
      
      [Untrusted]
      public function getIsSmithMagicFilterEnabled() : Boolean
      {
         return StorageOptionManager.getInstance().getIsSmithMagicFilterEnabled();
      }
      
      [Untrusted]
      public function getItemMaskCount(objectUID:int, mask:String) : int
      {
         return InventoryManager.getInstance().inventory.getItemMaskCount(objectUID,mask);
      }
   }
}
