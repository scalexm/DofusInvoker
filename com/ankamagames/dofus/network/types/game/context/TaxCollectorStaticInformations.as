package com.ankamagames.dofus.network.types.game.context
{
   import com.ankamagames.dofus.network.types.game.context.roleplay.GuildInformations;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class TaxCollectorStaticInformations implements INetworkType
   {
      
      public static const protocolId:uint = 147;
       
      
      public var firstNameId:uint = 0;
      
      public var lastNameId:uint = 0;
      
      public var guildIdentity:GuildInformations;
      
      private var _guildIdentitytree:FuncTree;
      
      public function TaxCollectorStaticInformations()
      {
         this.guildIdentity = new GuildInformations();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 147;
      }
      
      public function initTaxCollectorStaticInformations(firstNameId:uint = 0, lastNameId:uint = 0, guildIdentity:GuildInformations = null) : TaxCollectorStaticInformations
      {
         this.firstNameId = firstNameId;
         this.lastNameId = lastNameId;
         this.guildIdentity = guildIdentity;
         return this;
      }
      
      public function reset() : void
      {
         this.firstNameId = 0;
         this.lastNameId = 0;
         this.guildIdentity = new GuildInformations();
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_TaxCollectorStaticInformations(output);
      }
      
      public function serializeAs_TaxCollectorStaticInformations(output:ICustomDataOutput) : void
      {
         if(this.firstNameId < 0)
         {
            throw new Error("Forbidden value (" + this.firstNameId + ") on element firstNameId.");
         }
         output.writeVarShort(this.firstNameId);
         if(this.lastNameId < 0)
         {
            throw new Error("Forbidden value (" + this.lastNameId + ") on element lastNameId.");
         }
         output.writeVarShort(this.lastNameId);
         this.guildIdentity.serializeAs_GuildInformations(output);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_TaxCollectorStaticInformations(input);
      }
      
      public function deserializeAs_TaxCollectorStaticInformations(input:ICustomDataInput) : void
      {
         this._firstNameIdFunc(input);
         this._lastNameIdFunc(input);
         this.guildIdentity = new GuildInformations();
         this.guildIdentity.deserialize(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_TaxCollectorStaticInformations(tree);
      }
      
      public function deserializeAsyncAs_TaxCollectorStaticInformations(tree:FuncTree) : void
      {
         tree.addChild(this._firstNameIdFunc);
         tree.addChild(this._lastNameIdFunc);
         this._guildIdentitytree = tree.addChild(this._guildIdentitytreeFunc);
      }
      
      private function _firstNameIdFunc(input:ICustomDataInput) : void
      {
         this.firstNameId = input.readVarUhShort();
         if(this.firstNameId < 0)
         {
            throw new Error("Forbidden value (" + this.firstNameId + ") on element of TaxCollectorStaticInformations.firstNameId.");
         }
      }
      
      private function _lastNameIdFunc(input:ICustomDataInput) : void
      {
         this.lastNameId = input.readVarUhShort();
         if(this.lastNameId < 0)
         {
            throw new Error("Forbidden value (" + this.lastNameId + ") on element of TaxCollectorStaticInformations.lastNameId.");
         }
      }
      
      private function _guildIdentitytreeFunc(input:ICustomDataInput) : void
      {
         this.guildIdentity = new GuildInformations();
         this.guildIdentity.deserializeAsync(this._guildIdentitytree);
      }
   }
}
