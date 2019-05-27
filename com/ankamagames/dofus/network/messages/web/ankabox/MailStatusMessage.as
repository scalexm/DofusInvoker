package com.ankamagames.dofus.network.messages.web.ankabox
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class MailStatusMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6275;
       
      
      private var _isInitialized:Boolean = false;
      
      public var unread:uint = 0;
      
      public var total:uint = 0;
      
      public function MailStatusMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6275;
      }
      
      public function initMailStatusMessage(unread:uint = 0, total:uint = 0) : MailStatusMessage
      {
         this.unread = unread;
         this.total = total;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.unread = 0;
         this.total = 0;
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
         this.serializeAs_MailStatusMessage(output);
      }
      
      public function serializeAs_MailStatusMessage(output:ICustomDataOutput) : void
      {
         if(this.unread < 0)
         {
            throw new Error("Forbidden value (" + this.unread + ") on element unread.");
         }
         output.writeVarShort(this.unread);
         if(this.total < 0)
         {
            throw new Error("Forbidden value (" + this.total + ") on element total.");
         }
         output.writeVarShort(this.total);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_MailStatusMessage(input);
      }
      
      public function deserializeAs_MailStatusMessage(input:ICustomDataInput) : void
      {
         this._unreadFunc(input);
         this._totalFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_MailStatusMessage(tree);
      }
      
      public function deserializeAsyncAs_MailStatusMessage(tree:FuncTree) : void
      {
         tree.addChild(this._unreadFunc);
         tree.addChild(this._totalFunc);
      }
      
      private function _unreadFunc(input:ICustomDataInput) : void
      {
         this.unread = input.readVarUhShort();
         if(this.unread < 0)
         {
            throw new Error("Forbidden value (" + this.unread + ") on element of MailStatusMessage.unread.");
         }
      }
      
      private function _totalFunc(input:ICustomDataInput) : void
      {
         this.total = input.readVarUhShort();
         if(this.total < 0)
         {
            throw new Error("Forbidden value (" + this.total + ") on element of MailStatusMessage.total.");
         }
      }
   }
}
