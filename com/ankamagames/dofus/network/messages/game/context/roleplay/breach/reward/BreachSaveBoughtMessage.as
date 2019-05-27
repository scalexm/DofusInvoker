package com.ankamagames.dofus.network.messages.game.context.roleplay.breach.reward
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class BreachSaveBoughtMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6788;
       
      
      private var _isInitialized:Boolean = false;
      
      public var bought:Boolean = false;
      
      public function BreachSaveBoughtMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6788;
      }
      
      public function initBreachSaveBoughtMessage(bought:Boolean = false) : BreachSaveBoughtMessage
      {
         this.bought = bought;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.bought = false;
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
         this.serializeAs_BreachSaveBoughtMessage(output);
      }
      
      public function serializeAs_BreachSaveBoughtMessage(output:ICustomDataOutput) : void
      {
         output.writeBoolean(this.bought);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_BreachSaveBoughtMessage(input);
      }
      
      public function deserializeAs_BreachSaveBoughtMessage(input:ICustomDataInput) : void
      {
         this._boughtFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_BreachSaveBoughtMessage(tree);
      }
      
      public function deserializeAsyncAs_BreachSaveBoughtMessage(tree:FuncTree) : void
      {
         tree.addChild(this._boughtFunc);
      }
      
      private function _boughtFunc(input:ICustomDataInput) : void
      {
         this.bought = input.readBoolean();
      }
   }
}
