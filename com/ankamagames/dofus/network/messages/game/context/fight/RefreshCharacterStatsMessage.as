package com.ankamagames.dofus.network.messages.game.context.fight
{
   import com.ankamagames.dofus.network.types.game.context.fight.GameFightMinimalStats;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class RefreshCharacterStatsMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6699;
       
      
      private var _isInitialized:Boolean = false;
      
      public var fighterId:Number = 0;
      
      public var stats:GameFightMinimalStats;
      
      private var _statstree:FuncTree;
      
      public function RefreshCharacterStatsMessage()
      {
         this.stats = new GameFightMinimalStats();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6699;
      }
      
      public function initRefreshCharacterStatsMessage(fighterId:Number = 0, stats:GameFightMinimalStats = null) : RefreshCharacterStatsMessage
      {
         this.fighterId = fighterId;
         this.stats = stats;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.fighterId = 0;
         this.stats = new GameFightMinimalStats();
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
         this.serializeAs_RefreshCharacterStatsMessage(output);
      }
      
      public function serializeAs_RefreshCharacterStatsMessage(output:ICustomDataOutput) : void
      {
         if(this.fighterId < -9007199254740990 || this.fighterId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.fighterId + ") on element fighterId.");
         }
         output.writeDouble(this.fighterId);
         this.stats.serializeAs_GameFightMinimalStats(output);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_RefreshCharacterStatsMessage(input);
      }
      
      public function deserializeAs_RefreshCharacterStatsMessage(input:ICustomDataInput) : void
      {
         this._fighterIdFunc(input);
         this.stats = new GameFightMinimalStats();
         this.stats.deserialize(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_RefreshCharacterStatsMessage(tree);
      }
      
      public function deserializeAsyncAs_RefreshCharacterStatsMessage(tree:FuncTree) : void
      {
         tree.addChild(this._fighterIdFunc);
         this._statstree = tree.addChild(this._statstreeFunc);
      }
      
      private function _fighterIdFunc(input:ICustomDataInput) : void
      {
         this.fighterId = input.readDouble();
         if(this.fighterId < -9007199254740990 || this.fighterId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.fighterId + ") on element of RefreshCharacterStatsMessage.fighterId.");
         }
      }
      
      private function _statstreeFunc(input:ICustomDataInput) : void
      {
         this.stats = new GameFightMinimalStats();
         this.stats.deserializeAsync(this._statstree);
      }
   }
}
