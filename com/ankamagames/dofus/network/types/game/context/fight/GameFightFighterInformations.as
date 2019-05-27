package com.ankamagames.dofus.network.types.game.context.fight
{
   import com.ankamagames.dofus.network.ProtocolTypeManager;
   import com.ankamagames.dofus.network.types.game.context.EntityDispositionInformations;
   import com.ankamagames.dofus.network.types.game.context.GameContextActorInformations;
   import com.ankamagames.dofus.network.types.game.look.EntityLook;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class GameFightFighterInformations extends GameContextActorInformations implements INetworkType
   {
      
      public static const protocolId:uint = 143;
       
      
      public var teamId:uint = 2;
      
      public var wave:uint = 0;
      
      public var alive:Boolean = false;
      
      public var stats:GameFightMinimalStats;
      
      public var previousPositions:Vector.<uint>;
      
      private var _statstree:FuncTree;
      
      private var _previousPositionstree:FuncTree;
      
      public function GameFightFighterInformations()
      {
         this.stats = new GameFightMinimalStats();
         this.previousPositions = new Vector.<uint>();
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 143;
      }
      
      public function initGameFightFighterInformations(contextualId:Number = 0, look:EntityLook = null, disposition:EntityDispositionInformations = null, teamId:uint = 2, wave:uint = 0, alive:Boolean = false, stats:GameFightMinimalStats = null, previousPositions:Vector.<uint> = null) : GameFightFighterInformations
      {
         super.initGameContextActorInformations(contextualId,look,disposition);
         this.teamId = teamId;
         this.wave = wave;
         this.alive = alive;
         this.stats = stats;
         this.previousPositions = previousPositions;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.teamId = 2;
         this.wave = 0;
         this.alive = false;
         this.stats = new GameFightMinimalStats();
      }
      
      override public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_GameFightFighterInformations(output);
      }
      
      public function serializeAs_GameFightFighterInformations(output:ICustomDataOutput) : void
      {
         super.serializeAs_GameContextActorInformations(output);
         output.writeByte(this.teamId);
         if(this.wave < 0)
         {
            throw new Error("Forbidden value (" + this.wave + ") on element wave.");
         }
         output.writeByte(this.wave);
         output.writeBoolean(this.alive);
         output.writeShort(this.stats.getTypeId());
         this.stats.serialize(output);
         output.writeShort(this.previousPositions.length);
         for(var _i5:uint = 0; _i5 < this.previousPositions.length; _i5++)
         {
            if(this.previousPositions[_i5] < 0 || this.previousPositions[_i5] > 559)
            {
               throw new Error("Forbidden value (" + this.previousPositions[_i5] + ") on element 5 (starting at 1) of previousPositions.");
            }
            output.writeVarShort(this.previousPositions[_i5]);
         }
      }
      
      override public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_GameFightFighterInformations(input);
      }
      
      public function deserializeAs_GameFightFighterInformations(input:ICustomDataInput) : void
      {
         var _val5:uint = 0;
         super.deserialize(input);
         this._teamIdFunc(input);
         this._waveFunc(input);
         this._aliveFunc(input);
         var _id4:uint = input.readUnsignedShort();
         this.stats = ProtocolTypeManager.getInstance(GameFightMinimalStats,_id4);
         this.stats.deserialize(input);
         var _previousPositionsLen:uint = input.readUnsignedShort();
         for(var _i5:uint = 0; _i5 < _previousPositionsLen; _i5++)
         {
            _val5 = input.readVarUhShort();
            if(_val5 < 0 || _val5 > 559)
            {
               throw new Error("Forbidden value (" + _val5 + ") on elements of previousPositions.");
            }
            this.previousPositions.push(_val5);
         }
      }
      
      override public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_GameFightFighterInformations(tree);
      }
      
      public function deserializeAsyncAs_GameFightFighterInformations(tree:FuncTree) : void
      {
         super.deserializeAsync(tree);
         tree.addChild(this._teamIdFunc);
         tree.addChild(this._waveFunc);
         tree.addChild(this._aliveFunc);
         this._statstree = tree.addChild(this._statstreeFunc);
         this._previousPositionstree = tree.addChild(this._previousPositionstreeFunc);
      }
      
      private function _teamIdFunc(input:ICustomDataInput) : void
      {
         this.teamId = input.readByte();
         if(this.teamId < 0)
         {
            throw new Error("Forbidden value (" + this.teamId + ") on element of GameFightFighterInformations.teamId.");
         }
      }
      
      private function _waveFunc(input:ICustomDataInput) : void
      {
         this.wave = input.readByte();
         if(this.wave < 0)
         {
            throw new Error("Forbidden value (" + this.wave + ") on element of GameFightFighterInformations.wave.");
         }
      }
      
      private function _aliveFunc(input:ICustomDataInput) : void
      {
         this.alive = input.readBoolean();
      }
      
      private function _statstreeFunc(input:ICustomDataInput) : void
      {
         var _id:uint = input.readUnsignedShort();
         this.stats = ProtocolTypeManager.getInstance(GameFightMinimalStats,_id);
         this.stats.deserializeAsync(this._statstree);
      }
      
      private function _previousPositionstreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._previousPositionstree.addChild(this._previousPositionsFunc);
         }
      }
      
      private function _previousPositionsFunc(input:ICustomDataInput) : void
      {
         var _val:uint = input.readVarUhShort();
         if(_val < 0 || _val > 559)
         {
            throw new Error("Forbidden value (" + _val + ") on elements of previousPositions.");
         }
         this.previousPositions.push(_val);
      }
   }
}
