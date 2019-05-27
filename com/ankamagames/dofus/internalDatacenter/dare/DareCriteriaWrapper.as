package com.ankamagames.dofus.internalDatacenter.dare
{
   import com.ankamagames.dofus.datacenter.breeds.Breed;
   import com.ankamagames.dofus.datacenter.challenges.Challenge;
   import com.ankamagames.dofus.datacenter.dare.DareCriteria;
   import com.ankamagames.dofus.datacenter.idols.Idol;
   import com.ankamagames.dofus.datacenter.monsters.Monster;
   import com.ankamagames.dofus.internalDatacenter.fight.ChallengeWrapper;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.dofus.network.enums.DareCriteriaTypeEnum;
   import com.ankamagames.dofus.network.types.game.data.items.effects.ObjectEffect;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.utils.misc.StringUtils;
   import flash.utils.getQualifiedClassName;
   
   public class DareCriteriaWrapper implements IDataCenter
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(DareCriteriaWrapper));
       
      
      public var type:uint;
      
      public var params:Vector.<int>;
      
      private var _name:String;
      
      private var _searchString:String;
      
      private var _paramsData:Array;
      
      private var _label:String;
      
      public function DareCriteriaWrapper()
      {
         this.params = new Vector.<int>();
         super();
      }
      
      public static function create(type:uint, params:Vector.<int>) : DareCriteriaWrapper
      {
         var n:int = 0;
         var item:DareCriteriaWrapper = new DareCriteriaWrapper();
         item.type = type;
         item.params = new Vector.<int>();
         for each(n in params)
         {
            item.params.push(n);
         }
         return item;
      }
      
      public function get name() : String
      {
         var dc:DareCriteria = null;
         if(!this._name)
         {
            dc = DareCriteria.getDareCriteriaById(this.type);
            if(dc)
            {
               this._name = dc.name;
            }
            else
            {
               return I18n.getUiText("ui.dare.criteria.unknown");
            }
         }
         return this._name;
      }
      
      public function get label() : String
      {
         var s:String = null;
         var p:Object = null;
         if(!this._label)
         {
            s = this.name + I18n.getUiText("ui.common.colon");
            switch(this.type)
            {
               case DareCriteriaTypeEnum.MONSTER_ID:
                  s = s + (this.paramsData[0] as Monster).name;
                  break;
               case DareCriteriaTypeEnum.CHALLENGE_ID:
                  for each(p in this.paramsData)
                  {
                     s = s + ((p as ChallengeWrapper).name + ", ");
                  }
                  s = s.slice(0,s.length - 2);
                  break;
               case DareCriteriaTypeEnum.FORBIDDEN_BREEDS:
               case DareCriteriaTypeEnum.MANDATORY_BREEDS:
                  for each(p in this.paramsData)
                  {
                     s = s + ((p as Breed).name + ", ");
                  }
                  s = s.slice(0,s.length - 2);
                  break;
               case DareCriteriaTypeEnum.IDOLS:
                  for each(p in this.paramsData)
                  {
                     s = s + ((p as ItemWrapper).name + ", ");
                  }
                  s = s.slice(0,s.length - 2);
                  break;
               case DareCriteriaTypeEnum.IDOLS_SCORE:
               case DareCriteriaTypeEnum.MAX_CHAR_LVL:
               case DareCriteriaTypeEnum.MIN_COUNT_CHAR:
               case DareCriteriaTypeEnum.MAX_COUNT_CHAR:
               case DareCriteriaTypeEnum.MAX_FIGHT_TURNS:
               case DareCriteriaTypeEnum.MIN_COUNT_MONSTERS:
                  s = s + this.paramsData[0];
            }
            this._label = s;
         }
         return this._label;
      }
      
      public function get paramsData() : Array
      {
         var p:int = 0;
         var monster:Monster = null;
         var challenge:Challenge = null;
         var challengeW:ChallengeWrapper = null;
         var breed:Breed = null;
         var idol:Idol = null;
         var item:ItemWrapper = null;
         if(!this._paramsData)
         {
            this._paramsData = new Array();
            switch(this.type)
            {
               case DareCriteriaTypeEnum.MONSTER_ID:
                  monster = Monster.getMonsterById(this.params[0]);
                  this._paramsData.push(monster);
                  break;
               case DareCriteriaTypeEnum.CHALLENGE_ID:
                  challenge = Challenge.getChallengeById(this.params[0]);
                  challengeW = new ChallengeWrapper();
                  challengeW.id = challenge.id;
                  this._paramsData.push(challengeW);
                  break;
               case DareCriteriaTypeEnum.FORBIDDEN_BREEDS:
               case DareCriteriaTypeEnum.MANDATORY_BREEDS:
                  for each(p in this.params)
                  {
                     breed = Breed.getBreedById(p);
                     this._paramsData.push(breed);
                  }
                  break;
               case DareCriteriaTypeEnum.IDOLS:
                  for each(p in this.params)
                  {
                     idol = Idol.getIdolById(p);
                     item = ItemWrapper.create(0,0,idol.itemId,0,new Vector.<ObjectEffect>(),false);
                     this._paramsData.push(item);
                  }
                  break;
               case DareCriteriaTypeEnum.IDOLS_SCORE:
               case DareCriteriaTypeEnum.MAX_CHAR_LVL:
               case DareCriteriaTypeEnum.MIN_COUNT_CHAR:
               case DareCriteriaTypeEnum.MAX_COUNT_CHAR:
               case DareCriteriaTypeEnum.MAX_FIGHT_TURNS:
               case DareCriteriaTypeEnum.MIN_COUNT_MONSTERS:
                  this._paramsData.push(this.params[0]);
            }
         }
         return this._paramsData;
      }
      
      public function get searchString() : String
      {
         var paramsName:* = null;
         var b:Breed = null;
         var i:ItemWrapper = null;
         if(!this._searchString)
         {
            paramsName = "";
            switch(this.type)
            {
               case DareCriteriaTypeEnum.CHALLENGE_ID:
                  paramsName = this.paramsData[0].name + "_";
                  break;
               case DareCriteriaTypeEnum.FORBIDDEN_BREEDS:
               case DareCriteriaTypeEnum.MANDATORY_BREEDS:
                  for each(b in this.paramsData)
                  {
                     paramsName = paramsName + (b.shortName + "_");
                  }
                  break;
               case DareCriteriaTypeEnum.IDOLS:
                  for each(i in this.paramsData)
                  {
                     paramsName = paramsName + (i.name + "_");
                  }
            }
            if(paramsName != "")
            {
               this._searchString = StringUtils.noAccent(paramsName.toLocaleLowerCase());
            }
         }
         return this._searchString;
      }
      
      public function update(type:uint, params:Vector.<int>) : void
      {
         var n:int = 0;
         this.type = type;
         this.params = new Vector.<int>();
         for each(n in params)
         {
            this.params.push(n);
         }
      }
      
      public function toString() : String
      {
         var str:String = null;
         var b:Breed = null;
         var i:ItemWrapper = null;
         switch(this.type)
         {
            case DareCriteriaTypeEnum.MONSTER_ID:
               str = "monster: " + this.paramsData[0].name;
               break;
            case DareCriteriaTypeEnum.CHALLENGE_ID:
               str = "challenge: " + this.paramsData[0].name;
               break;
            case DareCriteriaTypeEnum.FORBIDDEN_BREEDS:
               str = "forbiddenBreeds: ";
               for each(b in this.paramsData)
               {
                  str = str + (b.shortName + ", ");
               }
               str = str.substr(0,str.length - 2);
               break;
            case DareCriteriaTypeEnum.MANDATORY_BREEDS:
               str = "mandatoryBreeds: ";
               for each(b in this.paramsData)
               {
                  str = str + (b.shortName + ", ");
               }
               str = str.substr(0,str.length - 2);
               break;
            case DareCriteriaTypeEnum.IDOLS:
               str = "idols: ";
               for each(i in this.paramsData)
               {
                  str = str + (i.name + ", ");
               }
               str = str.substr(0,str.length - 2);
               break;
            case DareCriteriaTypeEnum.IDOLS_SCORE:
               str = "idolScore: " + this.paramsData[0];
               break;
            case DareCriteriaTypeEnum.MAX_CHAR_LVL:
               str = "maxCharLevel: " + this.paramsData[0];
               break;
            case DareCriteriaTypeEnum.MIN_COUNT_CHAR:
               str = "minCounChar: " + this.paramsData[0];
               break;
            case DareCriteriaTypeEnum.MAX_COUNT_CHAR:
               str = "maxCounChar: " + this.paramsData[0];
               break;
            case DareCriteriaTypeEnum.MAX_FIGHT_TURNS:
               str = "maxFightTurns: " + this.paramsData[0];
               break;
            case DareCriteriaTypeEnum.MIN_COUNT_MONSTERS:
               str = "minCountMonsters: " + this.paramsData[0];
         }
         return str;
      }
   }
}
