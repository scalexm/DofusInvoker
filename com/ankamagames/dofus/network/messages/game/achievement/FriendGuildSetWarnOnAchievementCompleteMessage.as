package com.ankamagames.dofus.network.messages.game.achievement
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class FriendGuildSetWarnOnAchievementCompleteMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6382;
       
      
      private var _isInitialized:Boolean = false;
      
      public var enable:Boolean = false;
      
      public function FriendGuildSetWarnOnAchievementCompleteMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6382;
      }
      
      public function initFriendGuildSetWarnOnAchievementCompleteMessage(enable:Boolean = false) : FriendGuildSetWarnOnAchievementCompleteMessage
      {
         this.enable = enable;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.enable = false;
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
         this.serializeAs_FriendGuildSetWarnOnAchievementCompleteMessage(output);
      }
      
      public function serializeAs_FriendGuildSetWarnOnAchievementCompleteMessage(output:ICustomDataOutput) : void
      {
         output.writeBoolean(this.enable);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_FriendGuildSetWarnOnAchievementCompleteMessage(input);
      }
      
      public function deserializeAs_FriendGuildSetWarnOnAchievementCompleteMessage(input:ICustomDataInput) : void
      {
         this._enableFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_FriendGuildSetWarnOnAchievementCompleteMessage(tree);
      }
      
      public function deserializeAsyncAs_FriendGuildSetWarnOnAchievementCompleteMessage(tree:FuncTree) : void
      {
         tree.addChild(this._enableFunc);
      }
      
      private function _enableFunc(input:ICustomDataInput) : void
      {
         this.enable = input.readBoolean();
      }
   }
}
