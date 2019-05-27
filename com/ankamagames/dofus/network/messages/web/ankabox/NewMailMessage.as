package com.ankamagames.dofus.network.messages.web.ankabox
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class NewMailMessage extends MailStatusMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6292;
       
      
      private var _isInitialized:Boolean = false;
      
      public var sendersAccountId:Vector.<uint>;
      
      private var _sendersAccountIdtree:FuncTree;
      
      public function NewMailMessage()
      {
         this.sendersAccountId = new Vector.<uint>();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return super.isInitialized && this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6292;
      }
      
      public function initNewMailMessage(unread:uint = 0, total:uint = 0, sendersAccountId:Vector.<uint> = null) : NewMailMessage
      {
         super.initMailStatusMessage(unread,total);
         this.sendersAccountId = sendersAccountId;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.sendersAccountId = new Vector.<uint>();
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
      
      override public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_NewMailMessage(output);
      }
      
      public function serializeAs_NewMailMessage(output:ICustomDataOutput) : void
      {
         super.serializeAs_MailStatusMessage(output);
         output.writeShort(this.sendersAccountId.length);
         for(var _i1:uint = 0; _i1 < this.sendersAccountId.length; _i1++)
         {
            if(this.sendersAccountId[_i1] < 0)
            {
               throw new Error("Forbidden value (" + this.sendersAccountId[_i1] + ") on element 1 (starting at 1) of sendersAccountId.");
            }
            output.writeInt(this.sendersAccountId[_i1]);
         }
      }
      
      override public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_NewMailMessage(input);
      }
      
      public function deserializeAs_NewMailMessage(input:ICustomDataInput) : void
      {
         var _val1:uint = 0;
         super.deserialize(input);
         var _sendersAccountIdLen:uint = input.readUnsignedShort();
         for(var _i1:uint = 0; _i1 < _sendersAccountIdLen; _i1++)
         {
            _val1 = input.readInt();
            if(_val1 < 0)
            {
               throw new Error("Forbidden value (" + _val1 + ") on elements of sendersAccountId.");
            }
            this.sendersAccountId.push(_val1);
         }
      }
      
      override public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_NewMailMessage(tree);
      }
      
      public function deserializeAsyncAs_NewMailMessage(tree:FuncTree) : void
      {
         super.deserializeAsync(tree);
         this._sendersAccountIdtree = tree.addChild(this._sendersAccountIdtreeFunc);
      }
      
      private function _sendersAccountIdtreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._sendersAccountIdtree.addChild(this._sendersAccountIdFunc);
         }
      }
      
      private function _sendersAccountIdFunc(input:ICustomDataInput) : void
      {
         var _val:uint = input.readInt();
         if(_val < 0)
         {
            throw new Error("Forbidden value (" + _val + ") on elements of sendersAccountId.");
         }
         this.sendersAccountId.push(_val);
      }
   }
}
