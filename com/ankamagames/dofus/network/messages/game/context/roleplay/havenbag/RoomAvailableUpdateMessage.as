package com.ankamagames.dofus.network.messages.game.context.roleplay.havenbag
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class RoomAvailableUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6630;
       
      
      private var _isInitialized:Boolean = false;
      
      public var nbRoom:uint = 0;
      
      public function RoomAvailableUpdateMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6630;
      }
      
      public function initRoomAvailableUpdateMessage(nbRoom:uint = 0) : RoomAvailableUpdateMessage
      {
         this.nbRoom = nbRoom;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.nbRoom = 0;
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
         this.serializeAs_RoomAvailableUpdateMessage(output);
      }
      
      public function serializeAs_RoomAvailableUpdateMessage(output:ICustomDataOutput) : void
      {
         if(this.nbRoom < 0 || this.nbRoom > 255)
         {
            throw new Error("Forbidden value (" + this.nbRoom + ") on element nbRoom.");
         }
         output.writeByte(this.nbRoom);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_RoomAvailableUpdateMessage(input);
      }
      
      public function deserializeAs_RoomAvailableUpdateMessage(input:ICustomDataInput) : void
      {
         this._nbRoomFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_RoomAvailableUpdateMessage(tree);
      }
      
      public function deserializeAsyncAs_RoomAvailableUpdateMessage(tree:FuncTree) : void
      {
         tree.addChild(this._nbRoomFunc);
      }
      
      private function _nbRoomFunc(input:ICustomDataInput) : void
      {
         this.nbRoom = input.readUnsignedByte();
         if(this.nbRoom < 0 || this.nbRoom > 255)
         {
            throw new Error("Forbidden value (" + this.nbRoom + ") on element of RoomAvailableUpdateMessage.nbRoom.");
         }
      }
   }
}
