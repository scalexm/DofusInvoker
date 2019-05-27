package com.ankamagames.dofus.logic.game.fight.steps
{
   import com.ankamagames.dofus.datacenter.spells.SpellState;
   import com.ankamagames.dofus.logic.game.fight.fightEvents.FightEventsHelper;
   import com.ankamagames.dofus.logic.game.fight.types.FightEventEnum;
   import com.ankamagames.jerakine.sequencer.AbstractSequencable;
   
   public class FightEnteringStateStep extends AbstractSequencable implements IFightStep
   {
       
      
      private var _fighterId:Number;
      
      private var _stateId:int;
      
      private var _durationString:String;
      
      public function FightEnteringStateStep(fighterId:Number, stateId:int, durationString:String)
      {
         super();
         this._fighterId = fighterId;
         this._stateId = stateId;
         this._durationString = durationString;
      }
      
      public function get stepType() : String
      {
         return "enteringState";
      }
      
      override public function start() : void
      {
         if(!SpellState.getSpellStateById(this._stateId).isSilent)
         {
            FightEventsHelper.sendFightEvent(FightEventEnum.FIGHTER_ENTERING_STATE,[this._fighterId,this._stateId,this._durationString],this._fighterId,-1,false,2);
         }
         executeCallbacks();
      }
      
      public function get targets() : Vector.<Number>
      {
         return new <Number>[this._fighterId];
      }
   }
}
