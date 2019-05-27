package com.ankamagames.dofus.network.types.game.friend
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class AbstractContactInformations implements INetworkType
   {
      
      public static const protocolId:uint = 380;
       
      
      public var accountId:uint = 0;
      
      public var accountName:String = "";
      
      public function AbstractContactInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 380;
      }
      
      public function initAbstractContactInformations(accountId:uint = 0, accountName:String = "") : AbstractContactInformations
      {
         this.accountId = accountId;
         this.accountName = accountName;
         return this;
      }
      
      public function reset() : void
      {
         this.accountId = 0;
         this.accountName = "";
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_AbstractContactInformations(output);
      }
      
      public function serializeAs_AbstractContactInformations(output:ICustomDataOutput) : void
      {
         if(this.accountId < 0)
         {
            throw new Error("Forbidden value (" + this.accountId + ") on element accountId.");
         }
         output.writeInt(this.accountId);
         output.writeUTF(this.accountName);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_AbstractContactInformations(input);
      }
      
      public function deserializeAs_AbstractContactInformations(input:ICustomDataInput) : void
      {
         this._accountIdFunc(input);
         this._accountNameFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_AbstractContactInformations(tree);
      }
      
      public function deserializeAsyncAs_AbstractContactInformations(tree:FuncTree) : void
      {
         tree.addChild(this._accountIdFunc);
         tree.addChild(this._accountNameFunc);
      }
      
      private function _accountIdFunc(input:ICustomDataInput) : void
      {
         this.accountId = input.readInt();
         if(this.accountId < 0)
         {
            throw new Error("Forbidden value (" + this.accountId + ") on element of AbstractContactInformations.accountId.");
         }
      }
      
      private function _accountNameFunc(input:ICustomDataInput) : void
      {
         this.accountName = input.readUTF();
      }
   }
}
