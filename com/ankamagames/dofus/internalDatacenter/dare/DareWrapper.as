package com.ankamagames.dofus.internalDatacenter.dare
{
   import avmplus.getQualifiedClassName;
   import com.ankamagames.dofus.datacenter.monsters.Monster;
   import com.ankamagames.dofus.datacenter.world.SubArea;
   import com.ankamagames.dofus.internalDatacenter.guild.AllianceWrapper;
   import com.ankamagames.dofus.internalDatacenter.guild.GuildWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.AllianceFrame;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.network.enums.DareCriteriaTypeEnum;
   import com.ankamagames.dofus.network.types.game.dare.DareCriteria;
   import com.ankamagames.dofus.network.types.game.dare.DareInformations;
   import com.ankamagames.dofus.network.types.game.dare.DareVersatileInformations;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.utils.misc.StringUtils;
   import flash.utils.Dictionary;
   
   public class DareWrapper implements IDataCenter
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(DareWrapper));
      
      private static var _ref:Dictionary = new Dictionary();
       
      
      private var _dareName:String;
      
      private var _dareTag:String;
      
      public var dareId:Number;
      
      public var creatorId:Number;
      
      public var jackpot:Number = 0;
      
      public var subscriptionFee:Number = 0;
      
      public var maxCountWinners:uint = 0;
      
      public var startDate:Number;
      
      public var endDate:Number;
      
      public var isPrivate:Boolean;
      
      public var guildId:uint = 0;
      
      public var allianceId:uint = 0;
      
      public var subscribed:Boolean;
      
      public var won:Boolean;
      
      public var countEntrants:uint = 0;
      
      public var countWinners:uint = 0;
      
      private var _guild:GuildWrapper;
      
      private var _undiatricalGuildName:String;
      
      private var _alliance:AllianceWrapper;
      
      private var _undiatricalAllianceName:String;
      
      private var _monster:Monster;
      
      private var _criteria:Vector.<DareCriteriaWrapper>;
      
      private var _jackpotString:String;
      
      private var _subFeeString:String;
      
      private var _criteriaSearchString:String;
      
      private var _subAreasSearchString:String;
      
      private var _playerId:Number = 0;
      
      private var _creatorName:String;
      
      private var _undiatricalCreatorName:String;
      
      private var _subscribable:Boolean;
      
      private var _subscribableErrorList:Array;
      
      public function DareWrapper()
      {
         this._subscribableErrorList = new Array();
         super();
      }
      
      public static function getDareById(id:int) : DareWrapper
      {
         return _ref[id];
      }
      
      public static function clearCache() : void
      {
         _ref = new Dictionary();
      }
      
      public static function getFromNetwork(o:*) : DareWrapper
      {
         if(o is DareInformations)
         {
            return getFromBasicDareInformations(DareInformations(o));
         }
         if(o is DareVersatileInformations)
         {
            return getFromDareVersatileInformations(DareVersatileInformations(o));
         }
         return null;
      }
      
      public static function updateRef(dareId:Number, dareWrapper:DareWrapper) : void
      {
         _ref[dareId] = dareWrapper;
      }
      
      private static function getFromDareVersatileInformations(o:DareVersatileInformations) : DareWrapper
      {
         var dw:DareWrapper = null;
         if(_ref[o.dareId])
         {
            dw = _ref[o.dareId];
         }
         else
         {
            dw = new DareWrapper();
            _ref[o.dareId] = dw;
         }
         dw.dareId = o.dareId;
         dw.countEntrants = o.countEntrants;
         dw.countWinners = o.countWinners;
         return dw;
      }
      
      private static function getFromBasicDareInformations(o:DareInformations) : DareWrapper
      {
         var dw:DareWrapper = null;
         var crit:DareCriteria = null;
         var dcw:DareCriteriaWrapper = null;
         if(_ref[o.dareId])
         {
            dw = _ref[o.dareId];
         }
         else
         {
            dw = new DareWrapper();
            _ref[o.dareId] = dw;
         }
         dw.dareId = o.dareId;
         dw.creatorId = o.creator.id;
         dw.creatorName = o.creator.name;
         dw.jackpot = o.jackpot;
         dw.subscriptionFee = o.subscriptionFee;
         dw.maxCountWinners = o.maxCountWinners;
         dw.startDate = o.startDate;
         dw.endDate = o.endDate;
         dw.isPrivate = o.isPrivate;
         dw.guildId = o.guildId;
         dw.allianceId = o.allianceId;
         dw.criteria = new Vector.<DareCriteriaWrapper>();
         for each(crit in o.criterions)
         {
            dcw = DareCriteriaWrapper.create(crit.type,crit.params);
            dw.criteria.push(dcw);
         }
         return dw;
      }
      
      public static function create(dareId:Number, creatorId:uint, creatorName:String, jackpot:Number = 0, subscriptionFee:Number = 0, maxCountWinners:uint = 0, startDate:Number = 0, endDate:Number = 0, isPrivate:Boolean = false, guildId:uint = 0, allianceId:uint = 0, criteria:Vector.<DareCriteriaWrapper> = null, countEntrants:uint = 0, countWinners:uint = 0) : DareWrapper
      {
         var dw:DareWrapper = new DareWrapper();
         dw.dareId = dareId;
         dw.creatorId = creatorId;
         dw.creatorName = creatorName;
         dw.jackpot = jackpot;
         dw.subscriptionFee = subscriptionFee;
         dw.maxCountWinners = maxCountWinners;
         dw.startDate = startDate;
         dw.endDate = endDate;
         dw.isPrivate = isPrivate;
         dw.guildId = guildId;
         dw.allianceId = allianceId;
         dw.criteria = criteria;
         dw.countEntrants = countEntrants;
         dw.countWinners = countWinners;
         return dw;
      }
      
      public function get creatorName() : String
      {
         return this._creatorName;
      }
      
      public function set creatorName(value:String) : void
      {
         if(this._creatorName != value)
         {
            this._undiatricalCreatorName = null;
         }
         this._creatorName = value;
      }
      
      public function get undiatricalCreatorName() : String
      {
         if(this._undiatricalCreatorName == null)
         {
            this._undiatricalCreatorName = StringUtils.noAccent(this.creatorName).toLowerCase();
         }
         return this._undiatricalCreatorName;
      }
      
      public function get criteria() : Vector.<DareCriteriaWrapper>
      {
         return this._criteria;
      }
      
      public function set criteria(value:Vector.<DareCriteriaWrapper>) : void
      {
         if(this._criteria != value)
         {
            this._criteriaSearchString = null;
         }
         this._criteria = value;
      }
      
      public function get subscribable() : Boolean
      {
         return this._subscribable;
      }
      
      public function set subscribable(value:Boolean) : void
      {
         this._subscribable = value;
      }
      
      public function get subscribableErrors() : Array
      {
         return this._subscribableErrorList;
      }
      
      public function set subscribableErrors(errors:Array) : void
      {
         this._subscribableErrorList = errors;
      }
      
      public function get guild() : GuildWrapper
      {
         if(this.guildId > 0 && !this._guild)
         {
            this._guild = GuildWrapper.getGuildById(this.guildId);
         }
         return this._guild;
      }
      
      public function get undiatricalGuildName() : String
      {
         if(this._undiatricalGuildName == null && this.guild)
         {
            this._undiatricalGuildName = StringUtils.noAccent(this.guild.guildName).toLowerCase();
         }
         return this._undiatricalGuildName;
      }
      
      public function get alliance() : AllianceWrapper
      {
         var allianceFrame:AllianceFrame = null;
         if(this.allianceId > 0 && !this._alliance)
         {
            allianceFrame = Kernel.getWorker().getFrame(AllianceFrame) as AllianceFrame;
            this._alliance = allianceFrame.getAllianceById(this.allianceId);
         }
         return this._alliance;
      }
      
      public function get undiatricalAllianceName() : String
      {
         if(this._undiatricalAllianceName == null && this.alliance)
         {
            this._undiatricalAllianceName = StringUtils.noAccent(this.alliance.allianceName).toLowerCase();
         }
         return this._undiatricalAllianceName;
      }
      
      public function get monster() : Monster
      {
         var c:DareCriteriaWrapper = null;
         if(!this._monster && this.criteria)
         {
            for each(c in this.criteria)
            {
               if(c.type == DareCriteriaTypeEnum.MONSTER_ID)
               {
                  if(this._monster != c.paramsData[0])
                  {
                     this._subAreasSearchString = null;
                  }
                  this._monster = c.paramsData[0];
                  break;
               }
            }
         }
         return this._monster;
      }
      
      public function get monsterName() : String
      {
         return this._monster.name;
      }
      
      public function get jackpotString() : String
      {
         if(!this._jackpotString)
         {
            this._jackpotString = StringUtils.kamasToString(this.jackpot,"");
         }
         return this._jackpotString;
      }
      
      public function get subscriptionFeeString() : String
      {
         if(!this._subFeeString)
         {
            this._subFeeString = StringUtils.kamasToString(this.subscriptionFee,"");
         }
         return this._subFeeString;
      }
      
      public function get isMyCreation() : Boolean
      {
         if(this._playerId == 0)
         {
            this._playerId = PlayedCharacterManager.getInstance().id;
         }
         if(this.creatorId == this._playerId)
         {
            return true;
         }
         return false;
      }
      
      public function get criteriaSearchString() : String
      {
         var crit:DareCriteriaWrapper = null;
         if(this._criteriaSearchString == null)
         {
            this._criteriaSearchString = "";
            for each(crit in this.criteria)
            {
               this._criteriaSearchString = this._criteriaSearchString + (crit.searchString + "_");
            }
         }
         return this._criteriaSearchString;
      }
      
      public function get subAreasSearchString() : String
      {
         var subArea:SubArea = null;
         var subAreaId:uint = 0;
         if(this._subAreasSearchString == null)
         {
            this._subAreasSearchString = "";
            for each(subAreaId in this.monster.subareas)
            {
               subArea = SubArea.getSubAreaById(subAreaId);
               if(subArea.area)
               {
                  this._subAreasSearchString = this._subAreasSearchString + (subArea.area.undiatricalName + " (" + subArea.undiatricalName + ")_");
               }
               else
               {
                  this._subAreasSearchString = this._subAreasSearchString + subArea.undiatricalName;
               }
            }
         }
         return this._subAreasSearchString;
      }
      
      public function isOngoing(currentTime:Number) : Boolean
      {
         return this.startDate < currentTime + 1000 && this.endDate > currentTime;
      }
      
      public function isFightable(currentTime:Number) : Boolean
      {
         var crit:DareCriteriaWrapper = null;
         if(this.won)
         {
            return false;
         }
         if(currentTime < this.startDate || currentTime > this.endDate)
         {
            return false;
         }
         for each(crit in this.criteria)
         {
            if(crit.type == DareCriteriaTypeEnum.MAX_CHAR_LVL && PlayedCharacterManager.getInstance().infos.level > crit.params[0])
            {
               return false;
            }
         }
         return true;
      }
      
      public function clone() : DareWrapper
      {
         var wrapper:DareWrapper = create(this.dareId,this.creatorId,this.creatorName,this.jackpot,this.subscriptionFee,this.maxCountWinners,this.startDate,this.endDate,this.isPrivate,this.guildId,this.allianceId,this.criteria,this.countEntrants,this.countWinners);
         return wrapper;
      }
      
      public function update(dareId:Number, creatorId:uint, creatorName:String, jackpot:Number = 0, subscriptionFee:Number = 0, maxCountWinners:uint = 0, startDate:Number = 0, endDate:Number = 0, isPrivate:Boolean = false, guildId:uint = 0, allianceId:uint = 0, criteria:Vector.<DareCriteriaWrapper> = null, countEntrants:uint = 0, countWinners:uint = 0) : void
      {
         this.dareId = dareId;
         this.creatorId = creatorId;
         this.creatorName = creatorName;
         this.jackpot = jackpot;
         this.subscriptionFee = subscriptionFee;
         this.maxCountWinners = maxCountWinners;
         this.startDate = startDate;
         this.endDate = endDate;
         this.isPrivate = isPrivate;
         this.guildId = guildId;
         this.allianceId = allianceId;
         this.criteria = criteria;
         this.countEntrants = countEntrants;
         this.countWinners = countWinners;
      }
      
      public function toString() : String
      {
         var crit:DareCriteriaWrapper = null;
         var str:* = "[DareWrapper#" + this.dareId + " by " + this.creatorName + " with criteria ";
         for each(crit in this.criteria)
         {
            str = str + (crit + "|");
         }
         str = str.substr(0,str.length - 1);
         str = str + "]";
         return str;
      }
   }
}
