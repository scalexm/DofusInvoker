package com.ankamagames.dofus.network.messages.subscription
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class AccountInformationsUpdateMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6740;
       
      
      private var _isInitialized:Boolean = false;
      
      public var subscriptionEndDate:Number = 0;
      
      public var unlimitedRestatEndDate:Number = 0;
      
      public function AccountInformationsUpdateMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6740;
      }
      
      public function initAccountInformationsUpdateMessage(subscriptionEndDate:Number = 0, unlimitedRestatEndDate:Number = 0) : AccountInformationsUpdateMessage
      {
         this.subscriptionEndDate = subscriptionEndDate;
         this.unlimitedRestatEndDate = unlimitedRestatEndDate;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.subscriptionEndDate = 0;
         this.unlimitedRestatEndDate = 0;
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
         this.serializeAs_AccountInformationsUpdateMessage(output);
      }
      
      public function serializeAs_AccountInformationsUpdateMessage(output:ICustomDataOutput) : void
      {
         if(this.subscriptionEndDate < 0 || this.subscriptionEndDate > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.subscriptionEndDate + ") on element subscriptionEndDate.");
         }
         output.writeDouble(this.subscriptionEndDate);
         if(this.unlimitedRestatEndDate < 0 || this.unlimitedRestatEndDate > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.unlimitedRestatEndDate + ") on element unlimitedRestatEndDate.");
         }
         output.writeDouble(this.unlimitedRestatEndDate);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_AccountInformationsUpdateMessage(input);
      }
      
      public function deserializeAs_AccountInformationsUpdateMessage(input:ICustomDataInput) : void
      {
         this._subscriptionEndDateFunc(input);
         this._unlimitedRestatEndDateFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_AccountInformationsUpdateMessage(tree);
      }
      
      public function deserializeAsyncAs_AccountInformationsUpdateMessage(tree:FuncTree) : void
      {
         tree.addChild(this._subscriptionEndDateFunc);
         tree.addChild(this._unlimitedRestatEndDateFunc);
      }
      
      private function _subscriptionEndDateFunc(input:ICustomDataInput) : void
      {
         this.subscriptionEndDate = input.readDouble();
         if(this.subscriptionEndDate < 0 || this.subscriptionEndDate > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.subscriptionEndDate + ") on element of AccountInformationsUpdateMessage.subscriptionEndDate.");
         }
      }
      
      private function _unlimitedRestatEndDateFunc(input:ICustomDataInput) : void
      {
         this.unlimitedRestatEndDate = input.readDouble();
         if(this.unlimitedRestatEndDate < 0 || this.unlimitedRestatEndDate > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.unlimitedRestatEndDate + ") on element of AccountInformationsUpdateMessage.unlimitedRestatEndDate.");
         }
      }
   }
}
