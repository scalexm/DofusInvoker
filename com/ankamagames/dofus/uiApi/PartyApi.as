package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.dofus.internalDatacenter.arena.ArenaRankInfosWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.PartyManagementFrame;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.utils.getQualifiedClassName;
   
   [InstanciedApi]
   public class PartyApi implements IApi
   {
       
      
      private var _module:UiModule;
      
      protected var _log:Logger;
      
      public function PartyApi()
      {
         this._log = Log.getLogger(getQualifiedClassName(PartyApi));
         super();
      }
      
      private function get partyManagementFrame() : PartyManagementFrame
      {
         return Kernel.getWorker().getFrame(PartyManagementFrame) as PartyManagementFrame;
      }
      
      [ApiData(name="module")]
      public function set module(value:UiModule) : void
      {
         this._module = value;
      }
      
      [Trusted]
      public function destroy() : void
      {
         this._module = null;
      }
      
      [Untrusted]
      public function getPartyMembers(typeId:int = 0) : Object
      {
         if(typeId == 1)
         {
            return this.partyManagementFrame.arenaPartyMembers;
         }
         return this.partyManagementFrame.partyMembers;
      }
      
      [Untrusted]
      public function getPartyLeaderId(partyId:int) : Number
      {
         var pMember:Object = null;
         if(partyId == this.partyManagementFrame.arenaPartyId)
         {
            for each(pMember in this.partyManagementFrame.arenaPartyMembers)
            {
               if(pMember.isLeader)
               {
                  return pMember.id;
               }
            }
         }
         else if(partyId == this.partyManagementFrame.partyId)
         {
            for each(pMember in this.partyManagementFrame.partyMembers)
            {
               if(pMember.isLeader)
               {
                  return pMember.id;
               }
            }
         }
         return -1;
      }
      
      [Untrusted]
      public function isInParty(pPlayerId:Number) : Boolean
      {
         var pMember:Object = null;
         for each(pMember in this.partyManagementFrame.partyMembers)
         {
            if(pPlayerId == pMember.id)
            {
               return true;
            }
         }
         for each(pMember in this.partyManagementFrame.arenaPartyMembers)
         {
            if(pPlayerId == pMember.id)
            {
               return true;
            }
         }
         return false;
      }
      
      [Untrusted]
      public function getPartyId() : int
      {
         return this.partyManagementFrame.partyId;
      }
      
      [Untrusted]
      public function isArenaRegistered() : Boolean
      {
         return this.partyManagementFrame.isArenaRegistered;
      }
      
      [Untrusted]
      public function getArenaCurrentStatus() : int
      {
         return this.partyManagementFrame.arenaCurrentStatus;
      }
      
      [Untrusted]
      public function getArenaPartyId() : int
      {
         return this.partyManagementFrame.arenaPartyId;
      }
      
      [Untrusted]
      public function getArenaLeader() : Object
      {
         return this.partyManagementFrame.arenaLeader;
      }
      
      [Untrusted]
      public function getArenaReadyPartyMemberIds() : Object
      {
         return this.partyManagementFrame.arenaReadyPartyMemberIds;
      }
      
      [Untrusted]
      public function getArenaAlliesIds() : Object
      {
         return this.partyManagementFrame.arenaAlliesIds;
      }
      
      [Untrusted]
      public function getArenaRankSoloInfos() : ArenaRankInfosWrapper
      {
         return this.partyManagementFrame.arenaRankSoloInfos;
      }
      
      [Untrusted]
      public function getArenaRankGroupInfos() : ArenaRankInfosWrapper
      {
         return this.partyManagementFrame.arenaRankGroupInfos;
      }
      
      [Untrusted]
      public function getArenaRankDuelInfos() : ArenaRankInfosWrapper
      {
         return this.partyManagementFrame.arenaRankDuelInfos;
      }
      
      [Untrusted]
      public function getAllMemberFollowPlayerId(partyId:int) : Number
      {
         return this.partyManagementFrame.allMemberFollowPlayerId;
      }
      
      [Untrusted]
      public function getPartyLoyalty(partyId:int) : Boolean
      {
         return this.partyManagementFrame.partyLoyalty;
      }
      
      [Untrusted]
      public function getAllSubscribedDungeons() : Vector.<uint>
      {
         return this.partyManagementFrame.subscribedDungeons;
      }
   }
}
