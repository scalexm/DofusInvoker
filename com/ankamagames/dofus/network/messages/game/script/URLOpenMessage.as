package com.ankamagames.dofus.network.messages.game.script
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class URLOpenMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6266;
       
      
      private var _isInitialized:Boolean = false;
      
      public var urlId:uint = 0;
      
      public function URLOpenMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6266;
      }
      
      public function initURLOpenMessage(urlId:uint = 0) : URLOpenMessage
      {
         this.urlId = urlId;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.urlId = 0;
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
         this.serializeAs_URLOpenMessage(output);
      }
      
      public function serializeAs_URLOpenMessage(output:ICustomDataOutput) : void
      {
         if(this.urlId < 0)
         {
            throw new Error("Forbidden value (" + this.urlId + ") on element urlId.");
         }
         output.writeByte(this.urlId);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_URLOpenMessage(input);
      }
      
      public function deserializeAs_URLOpenMessage(input:ICustomDataInput) : void
      {
         this._urlIdFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_URLOpenMessage(tree);
      }
      
      public function deserializeAsyncAs_URLOpenMessage(tree:FuncTree) : void
      {
         tree.addChild(this._urlIdFunc);
      }
      
      private function _urlIdFunc(input:ICustomDataInput) : void
      {
         this.urlId = input.readByte();
         if(this.urlId < 0)
         {
            throw new Error("Forbidden value (" + this.urlId + ") on element of URLOpenMessage.urlId.");
         }
      }
   }
}
