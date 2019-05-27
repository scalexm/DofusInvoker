package com.ankamagames.dofus.network.messages.game.context.fight
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.character.characteristic.CharacterCharacteristicsInformations;
   import com.ankamagames.dofus.network.types.game.data.items.SpellItem;
   import com.ankamagames.dofus.network.types.game.shortcut.Shortcut;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class SlaveSwitchContextMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6214;
       
      
      private var _isInitialized:Boolean = false;
      
      public var masterId:Number = 0;
      
      public var slaveId:Number = 0;
      
      public var slaveSpells:Vector.<SpellItem>;
      
      public var slaveStats:CharacterCharacteristicsInformations;
      
      public var shortcuts:Vector.<Shortcut>;
      
      private var _slaveSpellstree:FuncTree;
      
      private var _slaveStatstree:FuncTree;
      
      private var _shortcutstree:FuncTree;
      
      public function SlaveSwitchContextMessage()
      {
         this.slaveSpells = new Vector.<SpellItem>();
         this.slaveStats = new CharacterCharacteristicsInformations();
         this.shortcuts = new Vector.<Shortcut>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6214;
      }
      
      public function initSlaveSwitchContextMessage(masterId:Number = 0, slaveId:Number = 0, slaveSpells:Vector.<SpellItem> = null, slaveStats:CharacterCharacteristicsInformations = null, shortcuts:Vector.<Shortcut> = null) : SlaveSwitchContextMessage
      {
         this.masterId = masterId;
         this.slaveId = slaveId;
         this.slaveSpells = slaveSpells;
         this.slaveStats = slaveStats;
         this.shortcuts = shortcuts;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.masterId = 0;
         this.slaveId = 0;
         this.slaveSpells = new Vector.<SpellItem>();
         this.slaveStats = new CharacterCharacteristicsInformations();
         this._isInitialized = false;
      }
      
      override public function pack(output:ICustomDataOutput) : void
      {
         var data:ByteArray = new ByteArray();
         this.serialize(new CustomDataWrapper(data));
         writePacket(output,this.getMessageId(),data);
      }
      
      override public function unpack(input:ICustomDataInput, length:uint) : void
      {
         this.deserialize(input);
      }
      
      override public function unpackAsync(input:ICustomDataInput, length:uint) : FuncTree
      {
         var tree:FuncTree = new FuncTree();
         tree.setRoot(input);
         this.deserializeAsync(tree);
         return tree;
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_SlaveSwitchContextMessage(output);
      }
      
      public function serializeAs_SlaveSwitchContextMessage(output:ICustomDataOutput) : void
      {
         if(this.masterId < -9007199254740990 || this.masterId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.masterId + ") on element masterId.");
         }
         output.writeDouble(this.masterId);
         if(this.slaveId < -9007199254740990 || this.slaveId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.slaveId + ") on element slaveId.");
         }
         output.writeDouble(this.slaveId);
         output.writeShort(this.slaveSpells.length);
         for(var _i3:uint = 0; _i3 < this.slaveSpells.length; _i3++)
         {
            (this.slaveSpells[_i3] as SpellItem).serializeAs_SpellItem(output);
         }
         this.slaveStats.serializeAs_CharacterCharacteristicsInformations(output);
         output.writeShort(this.shortcuts.length);
         for(var _i5:uint = 0; _i5 < this.shortcuts.length; _i5++)
         {
            output.writeShort((this.shortcuts[_i5] as Shortcut).getTypeId());
            (this.shortcuts[_i5] as Shortcut).serialize(output);
         }
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_SlaveSwitchContextMessage(input);
      }
      
      public function deserializeAs_SlaveSwitchContextMessage(input:ICustomDataInput) : void
      {
         var _item3:SpellItem = null;
         var _id5:uint = 0;
         var _item5:Shortcut = null;
         this._masterIdFunc(input);
         this._slaveIdFunc(input);
         var _slaveSpellsLen:uint = input.readUnsignedShort();
         for(var _i3:uint = 0; _i3 < _slaveSpellsLen; _i3++)
         {
            _item3 = new SpellItem();
            _item3.deserialize(input);
            this.slaveSpells.push(_item3);
         }
         this.slaveStats = new CharacterCharacteristicsInformations();
         this.slaveStats.deserialize(input);
         var _shortcutsLen:uint = input.readUnsignedShort();
         for(var _i5:uint = 0; _i5 < _shortcutsLen; _i5++)
         {
            _id5 = input.readUnsignedShort();
            _item5 = ProtocolTypeManager.getInstance(Shortcut,_id5);
            _item5.deserialize(input);
            this.shortcuts.push(_item5);
         }
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_SlaveSwitchContextMessage(tree);
      }
      
      public function deserializeAsyncAs_SlaveSwitchContextMessage(tree:FuncTree) : void
      {
         tree.addChild(this._masterIdFunc);
         tree.addChild(this._slaveIdFunc);
         this._slaveSpellstree = tree.addChild(this._slaveSpellstreeFunc);
         this._slaveStatstree = tree.addChild(this._slaveStatstreeFunc);
         this._shortcutstree = tree.addChild(this._shortcutstreeFunc);
      }
      
      private function _masterIdFunc(input:ICustomDataInput) : void
      {
         this.masterId = input.readDouble();
         if(this.masterId < -9007199254740990 || this.masterId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.masterId + ") on element of SlaveSwitchContextMessage.masterId.");
         }
      }
      
      private function _slaveIdFunc(input:ICustomDataInput) : void
      {
         this.slaveId = input.readDouble();
         if(this.slaveId < -9007199254740990 || this.slaveId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.slaveId + ") on element of SlaveSwitchContextMessage.slaveId.");
         }
      }
      
      private function _slaveSpellstreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._slaveSpellstree.addChild(this._slaveSpellsFunc);
         }
      }
      
      private function _slaveSpellsFunc(input:ICustomDataInput) : void
      {
         var _item:SpellItem = new SpellItem();
         _item.deserialize(input);
         this.slaveSpells.push(_item);
      }
      
      private function _slaveStatstreeFunc(input:ICustomDataInput) : void
      {
         this.slaveStats = new CharacterCharacteristicsInformations();
         this.slaveStats.deserializeAsync(this._slaveStatstree);
      }
      
      private function _shortcutstreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._shortcutstree.addChild(this._shortcutsFunc);
         }
      }
      
      private function _shortcutsFunc(input:ICustomDataInput) : void
      {
         var _id:uint = input.readUnsignedShort();
         var _item:Shortcut = ProtocolTypeManager.getInstance(Shortcut,_id);
         _item.deserialize(input);
         this.shortcuts.push(_item);
      }
   }
}
