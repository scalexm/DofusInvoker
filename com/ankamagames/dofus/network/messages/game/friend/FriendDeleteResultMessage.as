package com.ankamagames.dofus.network.messages.game.friend
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class FriendDeleteResultMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5601;
       
      
      private var _isInitialized:Boolean = false;
      
      public var success:Boolean = false;
      
      public var name:String = "";
      
      public function FriendDeleteResultMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5601;
      }
      
      public function initFriendDeleteResultMessage(success:Boolean = false, name:String = "") : FriendDeleteResultMessage
      {
         this.success = success;
         this.name = name;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.success = false;
         this.name = "";
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
         this.serializeAs_FriendDeleteResultMessage(output);
      }
      
      public function serializeAs_FriendDeleteResultMessage(output:ICustomDataOutput) : void
      {
         output.writeBoolean(this.success);
         output.writeUTF(this.name);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_FriendDeleteResultMessage(input);
      }
      
      public function deserializeAs_FriendDeleteResultMessage(input:ICustomDataInput) : void
      {
         this._successFunc(input);
         this._nameFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_FriendDeleteResultMessage(tree);
      }
      
      public function deserializeAsyncAs_FriendDeleteResultMessage(tree:FuncTree) : void
      {
         tree.addChild(this._successFunc);
         tree.addChild(this._nameFunc);
      }
      
      private function _successFunc(input:ICustomDataInput) : void
      {
         this.success = input.readBoolean();
      }
      
      private function _nameFunc(input:ICustomDataInput) : void
      {
         this.name = input.readUTF();
      }
   }
}
