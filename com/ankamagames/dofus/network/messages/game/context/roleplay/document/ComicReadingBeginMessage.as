package com.ankamagames.dofus.network.messages.game.context.roleplay.document
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class ComicReadingBeginMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6536;
       
      
      private var _isInitialized:Boolean = false;
      
      public var comicId:uint = 0;
      
      public function ComicReadingBeginMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6536;
      }
      
      public function initComicReadingBeginMessage(comicId:uint = 0) : ComicReadingBeginMessage
      {
         this.comicId = comicId;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.comicId = 0;
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
         this.serializeAs_ComicReadingBeginMessage(output);
      }
      
      public function serializeAs_ComicReadingBeginMessage(output:ICustomDataOutput) : void
      {
         if(this.comicId < 0)
         {
            throw new Error("Forbidden value (" + this.comicId + ") on element comicId.");
         }
         output.writeVarShort(this.comicId);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_ComicReadingBeginMessage(input);
      }
      
      public function deserializeAs_ComicReadingBeginMessage(input:ICustomDataInput) : void
      {
         this._comicIdFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_ComicReadingBeginMessage(tree);
      }
      
      public function deserializeAsyncAs_ComicReadingBeginMessage(tree:FuncTree) : void
      {
         tree.addChild(this._comicIdFunc);
      }
      
      private function _comicIdFunc(input:ICustomDataInput) : void
      {
         this.comicId = input.readVarUhShort();
         if(this.comicId < 0)
         {
            throw new Error("Forbidden value (" + this.comicId + ") on element of ComicReadingBeginMessage.comicId.");
         }
      }
   }
}
