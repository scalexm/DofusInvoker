package com.ankamagames.dofus.logic.game.fight.steps
{
   import com.ankamagames.dofus.datacenter.spells.SpellState;
   import com.ankamagames.dofus.logic.game.fight.fightEvents.FightEventsHelper;
   import com.ankamagames.dofus.logic.game.fight.types.FightEventEnum;
   import com.ankamagames.jerakine.sequencer.AbstractSequencable;
   
   public class FightLeavingStateStep extends AbstractSequencable implements IFightStep
   {
       
      
      private var _fighterId:Number;
      
      private var _stateId:int;
      
      public function FightLeavingStateStep(fighterId:Number, stateId:int)
      {
         super();
         this._fighterId = fighterId;
         this._stateId = stateId;
      }
      
      public function get stepType() : String
      {
         return "leavingState";
      }
      
      override public function start() : void
      {
         if(!SpellState.getSpellStateById(this._stateId).isSilent)
         {
            FightEventsHelper.sendFightEvent(FightEventEnum.FIGHTER_LEAVING_STATE,[this._fighterId,this._stateId],this._fighterId,-1,false,2);
         }
         executeCallbacks();
      }
      
      public function get targets() : Vector.<Number>
      {
         return new <Number>[this._fighterId];
      }
   }
}
