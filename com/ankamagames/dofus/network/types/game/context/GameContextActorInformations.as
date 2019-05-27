package com.ankamagames.dofus.network.types.game.context
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class GameContextActorInformations implements INetworkType
   {
      
      public static const protocolId:uint = 150;
       
      
      public var contextualId:Number = 0;
      
      public var look:EntityLook;
      
      public var disposition:EntityDispositionInformations;
      
      private var _looktree:FuncTree;
      
      private var _dispositiontree:FuncTree;
      
      public function GameContextActorInformations()
      {
         this.look = new EntityLook();
         this.disposition = new EntityDispositionInformations();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 150;
      }
      
      public function initGameContextActorInformations(contextualId:Number = 0, look:EntityLook = null, disposition:EntityDispositionInformations = null) : GameContextActorInformations
      {
         this.contextualId = contextualId;
         this.look = look;
         this.disposition = disposition;
         return this;
      }
      
      public function reset() : void
      {
         this.contextualId = 0;
         this.look = new EntityLook();
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_GameContextActorInformations(output);
      }
      
      public function serializeAs_GameContextActorInformations(output:ICustomDataOutput) : void
      {
         if(this.contextualId < -9007199254740990 || this.contextualId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.contextualId + ") on element contextualId.");
         }
         output.writeDouble(this.contextualId);
         this.look.serializeAs_EntityLook(output);
         output.writeShort(this.disposition.getTypeId());
         this.disposition.serialize(output);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_GameContextActorInformations(input);
      }
      
      public function deserializeAs_GameContextActorInformations(input:ICustomDataInput) : void
      {
         this._contextualIdFunc(input);
         this.look = new EntityLook();
         this.look.deserialize(input);
         var _id3:uint = input.readUnsignedShort();
         this.disposition = ProtocolTypeManager.getInstance(EntityDispositionInformations,_id3);
         this.disposition.deserialize(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_GameContextActorInformations(tree);
      }
      
      public function deserializeAsyncAs_GameContextActorInformations(tree:FuncTree) : void
      {
         tree.addChild(this._contextualIdFunc);
         this._looktree = tree.addChild(this._looktreeFunc);
         this._dispositiontree = tree.addChild(this._dispositiontreeFunc);
      }
      
      private function _contextualIdFunc(input:ICustomDataInput) : void
      {
         this.contextualId = input.readDouble();
         if(this.contextualId < -9007199254740990 || this.contextualId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.contextualId + ") on element of GameContextActorInformations.contextualId.");
         }
      }
      
      private function _looktreeFunc(input:ICustomDataInput) : void
      {
         this.look = new EntityLook();
         this.look.deserializeAsync(this._looktree);
      }
      
      private function _dispositiontreeFunc(input:ICustomDataInput) : void
      {
         var _id:uint = input.readUnsignedShort();
         this.disposition = ProtocolTypeManager.getInstance(EntityDispositionInformations,_id);
         this.disposition.deserializeAsync(this._dispositiontree);
      }
   }
}
