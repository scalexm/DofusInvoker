package com.ankamagames.dofus.network.messages.game.dare
{
   import com.ankamagames.dofus.network.types.game.dare.DareCriteria;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.BooleanByteWrapper;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class DareCreationRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6665;
       
      
      private var _isInitialized:Boolean = false;
      
      public var subscriptionFee:Number = 0;
      
      public var jackpot:Number = 0;
      
      public var maxCountWinners:uint = 0;
      
      public var delayBeforeStart:uint = 0;
      
      public var duration:uint = 0;
      
      public var isPrivate:Boolean = false;
      
      public var isForGuild:Boolean = false;
      
      public var isForAlliance:Boolean = false;
      
      public var needNotifications:Boolean = false;
      
      public var criterions:Vector.<DareCriteria>;
      
      private var _criterionstree:FuncTree;
      
      public function DareCreationRequestMessage()
      {
         this.criterions = new Vector.<DareCriteria>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6665;
      }
      
      public function initDareCreationRequestMessage(subscriptionFee:Number = 0, jackpot:Number = 0, maxCountWinners:uint = 0, delayBeforeStart:uint = 0, duration:uint = 0, isPrivate:Boolean = false, isForGuild:Boolean = false, isForAlliance:Boolean = false, needNotifications:Boolean = false, criterions:Vector.<DareCriteria> = null) : DareCreationRequestMessage
      {
         this.subscriptionFee = subscriptionFee;
         this.jackpot = jackpot;
         this.maxCountWinners = maxCountWinners;
         this.delayBeforeStart = delayBeforeStart;
         this.duration = duration;
         this.isPrivate = isPrivate;
         this.isForGuild = isForGuild;
         this.isForAlliance = isForAlliance;
         this.needNotifications = needNotifications;
         this.criterions = criterions;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.subscriptionFee = 0;
         this.jackpot = 0;
         this.maxCountWinners = 0;
         this.delayBeforeStart = 0;
         this.duration = 0;
         this.isPrivate = false;
         this.isForGuild = false;
         this.isForAlliance = false;
         this.needNotifications = false;
         this.criterions = new Vector.<DareCriteria>();
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
         this.serializeAs_DareCreationRequestMessage(output);
      }
      
      public function serializeAs_DareCreationRequestMessage(output:ICustomDataOutput) : void
      {
         var _box0:uint = 0;
         _box0 = BooleanByteWrapper.setFlag(_box0,0,this.isPrivate);
         _box0 = BooleanByteWrapper.setFlag(_box0,1,this.isForGuild);
         _box0 = BooleanByteWrapper.setFlag(_box0,2,this.isForAlliance);
         _box0 = BooleanByteWrapper.setFlag(_box0,3,this.needNotifications);
         output.writeByte(_box0);
         if(this.subscriptionFee < 0 || this.subscriptionFee > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.subscriptionFee + ") on element subscriptionFee.");
         }
         output.writeVarLong(this.subscriptionFee);
         if(this.jackpot < 0 || this.jackpot > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.jackpot + ") on element jackpot.");
         }
         output.writeVarLong(this.jackpot);
         if(this.maxCountWinners < 0 || this.maxCountWinners > 65535)
         {
            throw new Error("Forbidden value (" + this.maxCountWinners + ") on element maxCountWinners.");
         }
         output.writeShort(this.maxCountWinners);
         if(this.delayBeforeStart < 0 || this.delayBeforeStart > 4294967295)
         {
            throw new Error("Forbidden value (" + this.delayBeforeStart + ") on element delayBeforeStart.");
         }
         output.writeUnsignedInt(this.delayBeforeStart);
         if(this.duration < 0 || this.duration > 4294967295)
         {
            throw new Error("Forbidden value (" + this.duration + ") on element duration.");
         }
         output.writeUnsignedInt(this.duration);
         output.writeShort(this.criterions.length);
         for(var _i10:uint = 0; _i10 < this.criterions.length; _i10++)
         {
            (this.criterions[_i10] as DareCriteria).serializeAs_DareCriteria(output);
         }
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareCreationRequestMessage(input);
      }
      
      public function deserializeAs_DareCreationRequestMessage(input:ICustomDataInput) : void
      {
         var _item10:DareCriteria = null;
         this.deserializeByteBoxes(input);
         this._subscriptionFeeFunc(input);
         this._jackpotFunc(input);
         this._maxCountWinnersFunc(input);
         this._delayBeforeStartFunc(input);
         this._durationFunc(input);
         var _criterionsLen:uint = input.readUnsignedShort();
         for(var _i10:uint = 0; _i10 < _criterionsLen; _i10++)
         {
            _item10 = new DareCriteria();
            _item10.deserialize(input);
            this.criterions.push(_item10);
         }
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareCreationRequestMessage(tree);
      }
      
      public function deserializeAsyncAs_DareCreationRequestMessage(tree:FuncTree) : void
      {
         tree.addChild(this.deserializeByteBoxes);
         tree.addChild(this._subscriptionFeeFunc);
         tree.addChild(this._jackpotFunc);
         tree.addChild(this._maxCountWinnersFunc);
         tree.addChild(this._delayBeforeStartFunc);
         tree.addChild(this._durationFunc);
         this._criterionstree = tree.addChild(this._criterionstreeFunc);
      }
      
      private function deserializeByteBoxes(input:ICustomDataInput) : void
      {
         var _box0:uint = input.readByte();
         this.isPrivate = BooleanByteWrapper.getFlag(_box0,0);
         this.isForGuild = BooleanByteWrapper.getFlag(_box0,1);
         this.isForAlliance = BooleanByteWrapper.getFlag(_box0,2);
         this.needNotifications = BooleanByteWrapper.getFlag(_box0,3);
      }
      
      private function _subscriptionFeeFunc(input:ICustomDataInput) : void
      {
         this.subscriptionFee = input.readVarUhLong();
         if(this.subscriptionFee < 0 || this.subscriptionFee > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.subscriptionFee + ") on element of DareCreationRequestMessage.subscriptionFee.");
         }
      }
      
      private function _jackpotFunc(input:ICustomDataInput) : void
      {
         this.jackpot = input.readVarUhLong();
         if(this.jackpot < 0 || this.jackpot > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.jackpot + ") on element of DareCreationRequestMessage.jackpot.");
         }
      }
      
      private function _maxCountWinnersFunc(input:ICustomDataInput) : void
      {
         this.maxCountWinners = input.readUnsignedShort();
         if(this.maxCountWinners < 0 || this.maxCountWinners > 65535)
         {
            throw new Error("Forbidden value (" + this.maxCountWinners + ") on element of DareCreationRequestMessage.maxCountWinners.");
         }
      }
      
      private function _delayBeforeStartFunc(input:ICustomDataInput) : void
      {
         this.delayBeforeStart = input.readUnsignedInt();
         if(this.delayBeforeStart < 0 || this.delayBeforeStart > 4294967295)
         {
            throw new Error("Forbidden value (" + this.delayBeforeStart + ") on element of DareCreationRequestMessage.delayBeforeStart.");
         }
      }
      
      private function _durationFunc(input:ICustomDataInput) : void
      {
         this.duration = input.readUnsignedInt();
         if(this.duration < 0 || this.duration > 4294967295)
         {
            throw new Error("Forbidden value (" + this.duration + ") on element of DareCreationRequestMessage.duration.");
         }
      }
      
      private function _criterionstreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._criterionstree.addChild(this._criterionsFunc);
         }
      }
      
      private function _criterionsFunc(input:ICustomDataInput) : void
      {
         var _item:DareCriteria = new DareCriteria();
         _item.deserialize(input);
         this.criterions.push(_item);
      }
   }
}
