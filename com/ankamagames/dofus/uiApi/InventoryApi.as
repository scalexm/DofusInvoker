package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.MountWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.QuantifiedItemWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.SimpleTextureWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.PointCellFrame;
   import com.ankamagames.dofus.logic.game.common.managers.InventoryManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.network.ProtocolConstantsEnum;
   import com.ankamagames.dofus.network.enums.CharacterInventoryPositionEnum;
   import com.ankamagames.dofus.network.types.game.data.items.effects.ObjectEffect;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.types.Uri;
   import flash.utils.getQualifiedClassName;
   
   [InstanciedApi]
   public class InventoryApi implements IApi
   {
       
      
      protected var _log:Logger;
      
      private var _module:UiModule;
      
      public function InventoryApi()
      {
         this._log = Log.getLogger(getQualifiedClassName(InventoryApi));
         super();
      }
      
      [ApiData(name="module")]
      public function set module(value:UiModule) : void
      {
         this._module = value;
      }
      
      [Trusted]
      public function destroy() : void
      {
         this._module = null;
      }
      
      [Untrusted]
      public function getStorageObjectGID(pObjectGID:uint, quantity:uint = 1) : Object
      {
         var iw:ItemWrapper = null;
         var returnItems:Array = new Array();
         var numberReturn:uint = 0;
         var inventory:Vector.<ItemWrapper> = InventoryManager.getInstance().realInventory;
         for each(iw in inventory)
         {
            if(!(iw.objectGID != pObjectGID || iw.position < 63 || iw.linked))
            {
               if(iw.quantity >= quantity - numberReturn)
               {
                  returnItems.push({
                     "objectUID":iw.objectUID,
                     "quantity":quantity - numberReturn
                  });
                  numberReturn = quantity;
                  return returnItems;
               }
               returnItems.push({
                  "objectUID":iw.objectUID,
                  "quantity":iw.quantity
               });
               numberReturn = numberReturn + iw.quantity;
            }
         }
         return null;
      }
      
      [Untrusted]
      public function getStorageObjectsByType(objectType:uint) : Array
      {
         var iw:ItemWrapper = null;
         var returnItems:Array = new Array();
         var inventory:Vector.<ItemWrapper> = InventoryManager.getInstance().realInventory;
         for each(iw in inventory)
         {
            if(!(iw.typeId != objectType || iw.position < 63))
            {
               returnItems.push(iw);
            }
         }
         return returnItems;
      }
      
      [Untrusted]
      public function getItemQty(pObjectGID:uint, pObjectUID:uint = 0) : uint
      {
         var item:ItemWrapper = null;
         var quantity:uint = 0;
         var inventory:Vector.<ItemWrapper> = InventoryManager.getInstance().realInventory;
         for each(item in inventory)
         {
            if(!(item.position < 63 || item.objectGID != pObjectGID || pObjectUID > 0 && item.objectUID != pObjectUID))
            {
               quantity = quantity + item.quantity;
            }
         }
         return quantity;
      }
      
      [Untrusted]
      public function getItemByGID(objectGID:uint) : ItemWrapper
      {
         var item:ItemWrapper = null;
         var inventory:Vector.<ItemWrapper> = InventoryManager.getInstance().realInventory;
         for each(item in inventory)
         {
            if(item.position < 63 || item.objectGID != objectGID)
            {
               continue;
            }
            return item;
         }
         return null;
      }
      
      [Untrusted]
      public function getItemFromInventoryByUID(objectUID:uint) : ItemWrapper
      {
         var item:ItemWrapper = null;
         var inventory:Vector.<ItemWrapper> = InventoryManager.getInstance().realInventory;
         for each(item in inventory)
         {
            if(item.objectUID == objectUID)
            {
               return item;
            }
         }
         return null;
      }
      
      [Untrusted]
      public function getQuantifiedItemByGIDInInventoryOrMakeUpOne(objectGID:uint) : QuantifiedItemWrapper
      {
         var qiw:QuantifiedItemWrapper = null;
         var item:ItemWrapper = null;
         var inventory:Vector.<ItemWrapper> = InventoryManager.getInstance().realInventory;
         var iw:ItemWrapper = null;
         for each(item in inventory)
         {
            if(item.position < 63 || item.objectGID != objectGID)
            {
               continue;
            }
            iw = item;
            break;
         }
         if(iw)
         {
            qiw = QuantifiedItemWrapper.create(iw.position,iw.objectUID,objectGID,iw.quantity,iw.effectsList,false);
         }
         else
         {
            qiw = QuantifiedItemWrapper.create(0,0,objectGID,0,new Vector.<ObjectEffect>(),false);
         }
         return qiw;
      }
      
      [Untrusted]
      public function getItem(objectUID:uint) : ItemWrapper
      {
         return InventoryManager.getInstance().inventory.getItem(objectUID);
      }
      
      [Untrusted]
      public function getEquipementItemByPosition(pPosition:uint) : ItemWrapper
      {
         if(pPosition > CharacterInventoryPositionEnum.ACCESSORY_POSITION_SHIELD && pPosition != CharacterInventoryPositionEnum.INVENTORY_POSITION_ENTITY && pPosition != CharacterInventoryPositionEnum.INVENTORY_POSITION_COSTUME)
         {
            return null;
         }
         var equipementList:Vector.<ItemWrapper> = InventoryManager.getInstance().inventory.getView("equipment").content;
         return equipementList[pPosition];
      }
      
      [Untrusted]
      public function getEquipement() : Vector.<ItemWrapper>
      {
         var equipementList:Vector.<ItemWrapper> = InventoryManager.getInstance().inventory.getView("equipment").content;
         return equipementList;
      }
      
      [Untrusted]
      public function getEquipementForPreset() : Array
      {
         var emptyUri:Uri = null;
         var pos:int = 0;
         var objExists:Boolean = false;
         var item:ItemWrapper = null;
         var mountFakeItemWrapper:MountWrapper = null;
         var itemsCount:int = InventoryManager.getInstance().getMaxItemsCountForPreset();
         var equipmentList:Vector.<ItemWrapper> = InventoryManager.getInstance().inventory.getView("equipment").content;
         var equipmentPreset:Array = new Array(itemsCount);
         for(var i:int = 0; i < itemsCount; )
         {
            pos = InventoryManager.getInstance().getPositionForPresetItemIndex(i);
            objExists = false;
            for each(item in equipmentList)
            {
               if(item && item.position == pos)
               {
                  equipmentPreset[i] = item;
                  objExists = true;
               }
               else if(pos == CharacterInventoryPositionEnum.ACCESSORY_POSITION_PETS && PlayedCharacterManager.getInstance().isRidding)
               {
                  mountFakeItemWrapper = MountWrapper.create();
                  equipmentPreset[i] = mountFakeItemWrapper;
                  objExists = true;
               }
            }
            if(!objExists)
            {
               emptyUri = new Uri(XmlConfig.getInstance().getEntry("config.ui.skin") + "texture/slot/tx_slot_" + this.getSlotNameByPositionId(i) + ".png");
               equipmentPreset[i] = SimpleTextureWrapper.create(emptyUri);
            }
            i++;
         }
         return equipmentPreset;
      }
      
      private function getSlotNameByPositionId(i:int) : String
      {
         var pos:int = InventoryManager.getInstance().getPositionForPresetItemIndex(i);
         switch(pos)
         {
            case CharacterInventoryPositionEnum.ACCESSORY_POSITION_AMULET:
               return "collar";
            case CharacterInventoryPositionEnum.ACCESSORY_POSITION_WEAPON:
               return "weapon";
            case CharacterInventoryPositionEnum.INVENTORY_POSITION_RING_LEFT:
            case CharacterInventoryPositionEnum.INVENTORY_POSITION_RING_RIGHT:
               return "ring";
            case CharacterInventoryPositionEnum.ACCESSORY_POSITION_BELT:
               return "belt";
            case CharacterInventoryPositionEnum.ACCESSORY_POSITION_BOOTS:
               return "shoe";
            case CharacterInventoryPositionEnum.ACCESSORY_POSITION_HAT:
               return "helmet";
            case CharacterInventoryPositionEnum.ACCESSORY_POSITION_CAPE:
               return "cape";
            case CharacterInventoryPositionEnum.ACCESSORY_POSITION_PETS:
               return "pet";
            case CharacterInventoryPositionEnum.INVENTORY_POSITION_DOFUS_1:
            case CharacterInventoryPositionEnum.INVENTORY_POSITION_DOFUS_2:
            case CharacterInventoryPositionEnum.INVENTORY_POSITION_DOFUS_3:
            case CharacterInventoryPositionEnum.INVENTORY_POSITION_DOFUS_4:
            case CharacterInventoryPositionEnum.INVENTORY_POSITION_DOFUS_5:
            case CharacterInventoryPositionEnum.INVENTORY_POSITION_DOFUS_6:
               return "dofus";
            case CharacterInventoryPositionEnum.ACCESSORY_POSITION_SHIELD:
               return "shield";
            case CharacterInventoryPositionEnum.INVENTORY_POSITION_ENTITY:
               return "companon";
            case CharacterInventoryPositionEnum.INVENTORY_POSITION_COSTUME:
               return "costume";
            default:
               return "companon";
         }
      }
      
      [Untrusted]
      public function getVoidItemForPreset(index:int) : SimpleTextureWrapper
      {
         var emptyUri:Uri = null;
         emptyUri = new Uri(XmlConfig.getInstance().getEntry("config.ui.skin") + "texture/slot/tx_slot_" + this.getSlotNameByPositionId(index) + ".png");
         return SimpleTextureWrapper.create(emptyUri);
      }
      
      [Untrusted]
      public function getMaxItemsCountForPreset() : int
      {
         return InventoryManager.getInstance().getMaxItemsCountForPreset();
      }
      
      [Untrusted]
      public function getPositionForPresetItemIndex(index:int) : int
      {
         return InventoryManager.getInstance().getPositionForPresetItemIndex(index);
      }
      
      [Untrusted]
      public function getInvisibleEquipmentPositions() : Array
      {
         var invisiblePositions:Array = new Array();
         invisiblePositions.push(CharacterInventoryPositionEnum.INVENTORY_POSITION_MUTATION);
         invisiblePositions.push(CharacterInventoryPositionEnum.INVENTORY_POSITION_BOOST_FOOD);
         invisiblePositions.push(CharacterInventoryPositionEnum.INVENTORY_POSITION_FIRST_BONUS);
         invisiblePositions.push(CharacterInventoryPositionEnum.INVENTORY_POSITION_SECOND_BONUS);
         invisiblePositions.push(CharacterInventoryPositionEnum.INVENTORY_POSITION_FIRST_MALUS);
         invisiblePositions.push(CharacterInventoryPositionEnum.INVENTORY_POSITION_SECOND_MALUS);
         invisiblePositions.push(CharacterInventoryPositionEnum.INVENTORY_POSITION_ROLEPLAY_BUFFER);
         invisiblePositions.push(CharacterInventoryPositionEnum.INVENTORY_POSITION_FOLLOWER);
         invisiblePositions.push(CharacterInventoryPositionEnum.ACCESSORY_POSITION_RIDE_HARNESS);
         invisiblePositions.push(CharacterInventoryPositionEnum.INVENTORY_POSITION_NOT_EQUIPED);
         return invisiblePositions;
      }
      
      [Untrusted]
      public function getCurrentWeapon() : ItemWrapper
      {
         return this.getEquipementItemByPosition(CharacterInventoryPositionEnum.ACCESSORY_POSITION_WEAPON) as ItemWrapper;
      }
      
      [Untrusted]
      public function getBuilds() : Array
      {
         var emptyUri:Uri = new Uri(XmlConfig.getInstance().getEntry("config.ui.skin").concat("texture/slot/emptySlot.png"));
         var maxBuildCount:int = ProtocolConstantsEnum.MAX_PRESET_COUNT;
         var builds:Array = InventoryManager.getInstance().builds;
         var displayablesBuilds:Array = new Array();
         for(var i:int = 0; i < maxBuildCount; i++)
         {
            if(builds[i])
            {
               displayablesBuilds.push(builds[i]);
            }
            else
            {
               displayablesBuilds.push(SimpleTextureWrapper.create(emptyUri));
            }
         }
         return displayablesBuilds;
      }
      
      [Untrusted]
      public function setBuildId(id:int) : void
      {
         InventoryManager.getInstance().currentBuildId = id;
      }
      
      [Untrusted]
      public function getBuildId() : int
      {
         return InventoryManager.getInstance().currentBuildId;
      }
      
      [Trusted]
      public function removeSelectedItem() : Boolean
      {
         if(!Kernel.getWorker().contains(PointCellFrame))
         {
            return false;
         }
         PointCellFrame.getInstance().cancelShow();
         return true;
      }
   }
}
