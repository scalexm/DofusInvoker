package com.ankamagames.dofus.network.messages.game.context.roleplay.breach.meeting
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class BreachInvitationRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6794;
       
      
      private var _isInitialized:Boolean = false;
      
      public var guest:Number = 0;
      
      public function BreachInvitationRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6794;
      }
      
      public function initBreachInvitationRequestMessage(guest:Number = 0) : BreachInvitationRequestMessage
      {
         this.guest = guest;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.guest = 0;
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
         this.serializeAs_BreachInvitationRequestMessage(output);
      }
      
      public function serializeAs_BreachInvitationRequestMessage(output:ICustomDataOutput) : void
      {
         if(this.guest < 0 || this.guest > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.guest + ") on element guest.");
         }
         output.writeVarLong(this.guest);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_BreachInvitationRequestMessage(input);
      }
      
      public function deserializeAs_BreachInvitationRequestMessage(input:ICustomDataInput) : void
      {
         this._guestFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_BreachInvitationRequestMessage(tree);
      }
      
      public function deserializeAsyncAs_BreachInvitationRequestMessage(tree:FuncTree) : void
      {
         tree.addChild(this._guestFunc);
      }
      
      private function _guestFunc(input:ICustomDataInput) : void
      {
         this.guest = input.readVarUhLong();
         if(this.guest < 0 || this.guest > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.guest + ") on element of BreachInvitationRequestMessage.guest.");
         }
      }
   }
}
