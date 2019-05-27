package com.ankamagames.dofus.logic.game.common.actions.dare
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class DareCreationRequestAction implements Action
   {
       
      
      public var jackpot:Number = 0;
      
      public var subscriptionFee:Number = 0;
      
      public var maxCountWinners:uint = 0;
      
      public var delayBeforeStart:Number = 0;
      
      public var duration:Number;
      
      public var isPrivate:Boolean;
      
      public var isForGuild:Boolean;
      
      public var isForAlliance:Boolean;
      
      public var needNotifications:Boolean;
      
      public var criteria:Vector.<Vector.<int>>;
      
      public function DareCreationRequestAction()
      {
         this.criteria = new Vector.<Vector.<int>>();
         super();
      }
      
      public static function create(jackpot:Number, subscriptionFee:Number, maxCountWinners:uint, delayBeforeStart:Number, duration:Number, isPrivate:Boolean, isForGuild:Boolean, isForAlliance:Boolean, needNotifications:Boolean, criteria:Vector.<Vector.<int>>) : DareCreationRequestAction
      {
         var a:DareCreationRequestAction = new DareCreationRequestAction();
         a.jackpot = jackpot;
         a.subscriptionFee = subscriptionFee;
         a.maxCountWinners = maxCountWinners;
         a.delayBeforeStart = delayBeforeStart;
         a.duration = duration;
         a.isPrivate = isPrivate;
         a.isForGuild = isForGuild;
         a.isForAlliance = isForAlliance;
         a.needNotifications = needNotifications;
         a.criteria = criteria;
         return a;
      }
   }
}
