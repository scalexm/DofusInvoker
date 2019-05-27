package com.ankamagames.dofus.network.messages.handshake
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class ProtocolRequired extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 1;
       
      
      private var _isInitialized:Boolean = false;
      
      public var requiredVersion:uint = 0;
      
      public var currentVersion:uint = 0;
      
      public function ProtocolRequired()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 1;
      }
      
      public function initProtocolRequired(requiredVersion:uint = 0, currentVersion:uint = 0) : ProtocolRequired
      {
         this.requiredVersion = requiredVersion;
         this.currentVersion = currentVersion;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.requiredVersion = 0;
         this.currentVersion = 0;
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
         this.serializeAs_ProtocolRequired(output);
      }
      
      public function serializeAs_ProtocolRequired(output:ICustomDataOutput) : void
      {
         if(this.requiredVersion < 0)
         {
            throw new Error("Forbidden value (" + this.requiredVersion + ") on element requiredVersion.");
         }
         output.writeInt(this.requiredVersion);
         if(this.currentVersion < 0)
         {
            throw new Error("Forbidden value (" + this.currentVersion + ") on element currentVersion.");
         }
         output.writeInt(this.currentVersion);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_ProtocolRequired(input);
      }
      
      public function deserializeAs_ProtocolRequired(input:ICustomDataInput) : void
      {
         this._requiredVersionFunc(input);
         this._currentVersionFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_ProtocolRequired(tree);
      }
      
      public function deserializeAsyncAs_ProtocolRequired(tree:FuncTree) : void
      {
         tree.addChild(this._requiredVersionFunc);
         tree.addChild(this._currentVersionFunc);
      }
      
      private function _requiredVersionFunc(input:ICustomDataInput) : void
      {
         this.requiredVersion = input.readInt();
         if(this.requiredVersion < 0)
         {
            throw new Error("Forbidden value (" + this.requiredVersion + ") on element of ProtocolRequired.requiredVersion.");
         }
      }
      
      private function _currentVersionFunc(input:ICustomDataInput) : void
      {
         this.currentVersion = input.readInt();
         if(this.currentVersion < 0)
         {
            throw new Error("Forbidden value (" + this.currentVersion + ") on element of ProtocolRequired.currentVersion.");
         }
      }
   }
}
