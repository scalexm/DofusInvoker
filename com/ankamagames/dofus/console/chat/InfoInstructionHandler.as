package com.ankamagames.dofus.console.chat
{
   import com.ankamagames.atouin.managers.EntitiesManager;
   import com.ankamagames.atouin.managers.MapDisplayManager;
   import com.ankamagames.dofus.BuildInfos;
   import com.ankamagames.dofus.kernel.net.ConnectionsHandler;
   import com.ankamagames.dofus.logic.game.common.managers.CharacterDisplacementManager;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.TimeManager;
   import com.ankamagames.dofus.network.ProtocolConstantsEnum;
   import com.ankamagames.dofus.network.messages.game.basic.BasicWhoAmIRequestMessage;
   import com.ankamagames.dofus.network.messages.game.basic.BasicWhoIsRequestMessage;
   import com.ankamagames.jerakine.console.ConsoleHandler;
   import com.ankamagames.jerakine.console.ConsoleInstructionHandler;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.system.Capabilities;
   import flash.utils.getQualifiedClassName;
   
   public class InfoInstructionHandler implements ConsoleInstructionHandler
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(InfoInstructionHandler));
       
      
      public function InfoInstructionHandler()
      {
         super();
      }
      
      public function handle(param1:ConsoleHandler, param2:String, param3:Array) : void
      {
         var _loc4_:String = null;
         var _loc5_:BasicWhoAmIRequestMessage = null;
         var _loc6_:String = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         var _loc10_:String = null;
         var _loc11_:Date = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:BasicWhoIsRequestMessage = null;
         switch(param2)
         {
            case "whois":
               if(param3.length == 0)
               {
                  return;
               }
               _loc4_ = param3.shift();
               if(_loc4_.length >= 1 && _loc4_.length <= ProtocolConstantsEnum.MAX_PLAYER_OR_ACCOUNT_NAME_LEN)
               {
                  _loc16_ = new BasicWhoIsRequestMessage();
                  _loc16_.initBasicWhoIsRequestMessage(true,_loc4_);
                  ConnectionsHandler.getConnection().send(_loc16_);
                  break;
               }
               break;
            case "version":
               param1.output(this.getVersion());
               break;
            case "about":
               param1.output(this.getVersion());
               break;
            case "whoami":
               _loc5_ = new BasicWhoAmIRequestMessage();
               _loc5_.initBasicWhoAmIRequestMessage(true);
               ConnectionsHandler.getConnection().send(_loc5_);
               break;
            case "mapid":
               _loc6_ = MapDisplayManager.getInstance().currentMapPoint.x + "/" + MapDisplayManager.getInstance().currentMapPoint.y;
               _loc7_ = MapDisplayManager.getInstance().currentMapPoint.mapId;
               _loc8_ = MapDisplayManager.getInstance().mapInstanceId;
               if(_loc8_ > 0)
               {
                  _loc9_ = _loc8_ + " (model " + _loc7_ + ")";
               }
               else
               {
                  _loc9_ = _loc7_.toString();
               }
               param1.output(I18n.getUiText("ui.chat.console.currentMap",[PlayedCharacterManager.getInstance().currentMap.outdoorX + "/" + PlayedCharacterManager.getInstance().currentMap.outdoorY + ", " + _loc6_,_loc9_]));
               break;
            case "cellid":
               _loc10_ = EntitiesManager.getInstance().getEntity(PlayedCharacterManager.getInstance().id).position.cellId.toString();
               param1.output(I18n.getUiText("ui.console.chat.currentCell",[_loc10_]));
               break;
            case "time":
               _loc11_ = new Date();
               param1.output(TimeManager.getInstance().formatDateIG(0) + " - " + TimeManager.getInstance().formatClock(0,false));
               break;
            case "travel":
               if(param3.length > 2 || param3.length < 1)
               {
                  return;
               }
               _loc12_ = param3[0] as String;
               if(param3[1])
               {
                  _loc13_ = param3[1] as String;
               }
               else
               {
                  param3 = _loc12_.split(",");
                  _loc12_ = param3[0];
                  _loc13_ = param3[1];
               }
               _loc14_ = int(_loc12_);
               _loc15_ = int(_loc13_);
               CharacterDisplacementManager.getInstance().autoTravel(_loc14_,_loc15_);
               break;
         }
      }
      
      private function getVersion() : String
      {
         return "----------------------------------------------\n" + "DOFUS CLIENT v " + BuildInfos.VERSION + "\n" + "(c) ANKAMA GAMES (" + BuildInfos.BUILD_DATE + ") \n" + "Flash player " + Capabilities.version + "\n----------------------------------------------";
      }
      
      public function getHelp(cmd:String) : String
      {
         switch(cmd)
         {
            case "version":
               return I18n.getUiText("ui.chat.console.help.version");
            case "about":
               return I18n.getUiText("ui.chat.console.help.version");
            case "whois":
               return I18n.getUiText("ui.chat.console.help.whois");
            case "whoami":
               return I18n.getUiText("ui.chat.console.help.whoami");
            case "cellid":
               return I18n.getUiText("ui.chat.console.help.cellid");
            case "mapid":
               return I18n.getUiText("ui.chat.console.help.mapid");
            case "time":
               return I18n.getUiText("ui.chat.console.help.time");
            default:
               return I18n.getUiText("ui.chat.console.noHelp",[cmd]);
         }
      }
      
      public function getParamPossibilities(cmd:String, paramIndex:uint = 0, currentParams:Array = null) : Array
      {
         return [];
      }
   }
}
