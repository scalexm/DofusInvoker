package com.ankamagames.dofus.logic.game.common.frames
{
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.logic.game.common.actions.alignment.SetEnablePVPRequestAction;
   import com.ankamagames.dofus.misc.lists.AlignmentHookList;
   import com.ankamagames.dofus.network.messages.game.pvp.AlignmentRankUpdateMessage;
   import com.ankamagames.dofus.network.messages.game.pvp.SetEnablePVPRequestMessage;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.messages.Frame;
   import com.ankamagames.jerakine.messages.Message;
   import com.ankamagames.jerakine.types.enums.Priority;
   import flash.utils.getQualifiedClassName;
   
   public class AlignmentFrame implements Frame
   {
      
      private static var _instance:AlignmentFrame;
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(AlignmentFrame));
       
      
      private var _alignmentRank:int = -1;
      
      public function AlignmentFrame()
      {
         super();
      }
      
      public static function getInstance() : AlignmentFrame
      {
         return _instance;
      }
      
      public function get priority() : int
      {
         return Priority.NORMAL;
      }
      
      public function get playerRank() : int
      {
         return this._alignmentRank;
      }
      
      public function pushed() : Boolean
      {
         _instance = this;
         return true;
      }
      
      public function process(msg:Message) : Boolean
      {
         var sepract:SetEnablePVPRequestAction = null;
         var seprmsg:SetEnablePVPRequestMessage = null;
         var arumsg:AlignmentRankUpdateMessage = null;
         switch(true)
         {
            case msg is SetEnablePVPRequestAction:
               sepract = msg as SetEnablePVPRequestAction;
               seprmsg = new SetEnablePVPRequestMessage();
               seprmsg.initSetEnablePVPRequestMessage(sepract.enable);
               ConnectionsHandler.getConnection().send(seprmsg);
               return true;
            case msg is AlignmentRankUpdateMessage:
               arumsg = msg as AlignmentRankUpdateMessage;
               this._alignmentRank = arumsg.alignmentRank;
               if(arumsg.verbose)
               {
                  KernelEventsManager.getInstance().processCallback(AlignmentHookList.AlignmentRankUpdate,arumsg.alignmentRank);
               }
               return true;
            default:
               return false;
         }
      }
      
      public function pulled() : Boolean
      {
         _instance = null;
         return true;
      }
   }
}
