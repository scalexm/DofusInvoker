package com.ankamagames.dofus.internalDatacenter.communication
{
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class CraftSmileyItem implements IDataCenter
   {
       
      
      public var playerId:Number;
      
      public var iconId:int;
      
      public var craftResult:uint;
      
      public function CraftSmileyItem(pPlayerId:Number, pIconId:int, pCraftResult:uint)
      {
         super();
         this.playerId = pPlayerId;
         this.iconId = pIconId;
         this.craftResult = pCraftResult;
      }
   }
}
