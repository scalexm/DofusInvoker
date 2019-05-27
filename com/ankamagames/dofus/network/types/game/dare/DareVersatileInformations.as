package com.ankamagames.dofus.network.types.game.dare
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class DareVersatileInformations implements INetworkType
   {
      
      public static const protocolId:uint = 504;
       
      
      public var dareId:Number = 0;
      
      public var countEntrants:uint = 0;
      
      public var countWinners:uint = 0;
      
      public function DareVersatileInformations()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 504;
      }
      
      public function initDareVersatileInformations(dareId:Number = 0, countEntrants:uint = 0, countWinners:uint = 0) : DareVersatileInformations
      {
         this.dareId = dareId;
         this.countEntrants = countEntrants;
         this.countWinners = countWinners;
         return this;
      }
      
      public function reset() : void
      {
         this.dareId = 0;
         this.countEntrants = 0;
         this.countWinners = 0;
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_DareVersatileInformations(output);
      }
      
      public function serializeAs_DareVersatileInformations(output:ICustomDataOutput) : void
      {
         if(this.dareId < 0 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element dareId.");
         }
         output.writeDouble(this.dareId);
         if(this.countEntrants < 0)
         {
            throw new Error("Forbidden value (" + this.countEntrants + ") on element countEntrants.");
         }
         output.writeInt(this.countEntrants);
         if(this.countWinners < 0)
         {
            throw new Error("Forbidden value (" + this.countWinners + ") on element countWinners.");
         }
         output.writeInt(this.countWinners);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareVersatileInformations(input);
      }
      
      public function deserializeAs_DareVersatileInformations(input:ICustomDataInput) : void
      {
         this._dareIdFunc(input);
         this._countEntrantsFunc(input);
         this._countWinnersFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareVersatileInformations(tree);
      }
      
      public function deserializeAsyncAs_DareVersatileInformations(tree:FuncTree) : void
      {
         tree.addChild(this._dareIdFunc);
         tree.addChild(this._countEntrantsFunc);
         tree.addChild(this._countWinnersFunc);
      }
      
      private function _dareIdFunc(input:ICustomDataInput) : void
      {
         this.dareId = input.readDouble();
         if(this.dareId < 0 || this.dareId > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.dareId + ") on element of DareVersatileInformations.dareId.");
         }
      }
      
      private function _countEntrantsFunc(input:ICustomDataInput) : void
      {
         this.countEntrants = input.readInt();
         if(this.countEntrants < 0)
         {
            throw new Error("Forbidden value (" + this.countEntrants + ") on element of DareVersatileInformations.countEntrants.");
         }
      }
      
      private function _countWinnersFunc(input:ICustomDataInput) : void
      {
         this.countWinners = input.readInt();
         if(this.countWinners < 0)
         {
            throw new Error("Forbidden value (" + this.countWinners + ") on element of DareVersatileInformations.countWinners.");
         }
      }
   }
}
