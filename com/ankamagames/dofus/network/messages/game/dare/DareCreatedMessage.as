package com.ankamagames.dofus.network.messages.game.dare
{
   import com.ankamagames.dofus.network.types.game.dare.DareInformations;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class DareCreatedMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6668;
       
      
      private var _isInitialized:Boolean = false;
      
      public var dareInfos:DareInformations;
      
      public var needNotifications:Boolean = false;
      
      private var _dareInfostree:FuncTree;
      
      public function DareCreatedMessage()
      {
         this.dareInfos = new DareInformations();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6668;
      }
      
      public function initDareCreatedMessage(dareInfos:DareInformations = null, needNotifications:Boolean = false) : DareCreatedMessage
      {
         this.dareInfos = dareInfos;
         this.needNotifications = needNotifications;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.dareInfos = new DareInformations();
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
         this.serializeAs_DareCreatedMessage(output);
      }
      
      public function serializeAs_DareCreatedMessage(output:ICustomDataOutput) : void
      {
         this.dareInfos.serializeAs_DareInformations(output);
         output.writeBoolean(this.needNotifications);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareCreatedMessage(input);
      }
      
      public function deserializeAs_DareCreatedMessage(input:ICustomDataInput) : void
      {
         this.dareInfos = new DareInformations();
         this.dareInfos.deserialize(input);
         this._needNotificationsFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareCreatedMessage(tree);
      }
      
      public function deserializeAsyncAs_DareCreatedMessage(tree:FuncTree) : void
      {
         this._dareInfostree = tree.addChild(this._dareInfostreeFunc);
         tree.addChild(this._needNotificationsFunc);
      }
      
      private function _dareInfostreeFunc(input:ICustomDataInput) : void
      {
         this.dareInfos = new DareInformations();
         this.dareInfos.deserializeAsync(this._dareInfostree);
      }
      
      private function _needNotificationsFunc(input:ICustomDataInput) : void
      {
         this.needNotifications = input.readBoolean();
      }
   }
}
