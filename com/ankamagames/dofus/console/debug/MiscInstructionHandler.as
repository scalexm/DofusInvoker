package com.ankamagames.dofus.console.debug
{
   import com.ankamagames.atouin.managers.EntitiesManager;
   import com.ankamagames.berilia.components.TextureBase;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.types.graphic.TimeoutHTMLLoader;
   import com.ankamagames.dofus.console.moduleLogger.ModuleDebugManager;
   import com.ankamagames.dofus.datacenter.monsters.Monster;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.SynchronisationFrame;
   import com.ankamagames.dofus.logic.game.common.managers.InactivityManager;
   import com.ankamagames.dofus.logic.game.roleplay.managers.RoleplayManager;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.types.entities.AnimatedCharacter;
   import com.ankamagames.jerakine.console.ConsoleHandler;
   import com.ankamagames.jerakine.console.ConsoleInstructionHandler;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.entities.interfaces.IEntity;
   import com.ankamagames.jerakine.handlers.HumanInputHandler;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.LogLevel;
   import com.ankamagames.jerakine.logger.LogLogger;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.logger.targets.CentralizeTarget;
   import com.ankamagames.jerakine.logger.targets.ConsoleTarget;
   import com.ankamagames.jerakine.logger.targets.FileTarget;
   import com.ankamagames.jerakine.logger.targets.LoggingTarget;
   import com.ankamagames.jerakine.logger.targets.SOSTarget;
   import com.ankamagames.jerakine.logger.targets.TraceTarget;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.utils.crypto.Base64;
   import com.ankamagames.jerakine.utils.display.StageShareManager;
   import com.ankamagames.jerakine.utils.misc.StringUtils;
   import com.ankamagames.tiphon.display.TiphonSprite;
   import com.ankamagames.tiphon.types.look.TiphonEntityLook;
   import flash.desktop.NativeApplication;
   import flash.display.DisplayObject;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.InvokeEvent;
   import flash.geom.ColorTransform;
   import flash.utils.getQualifiedClassName;
   import flash.utils.setTimeout;
   
   public class MiscInstructionHandler implements ConsoleInstructionHandler
   {
       
      
      private var _synchronisationFrameInstance:SynchronisationFrame;
      
      public function MiscInstructionHandler()
      {
         super();
      }
      
      public function handle(console:ConsoleHandler, cmd:String, args:Array) : void
      {
         var log:Logger = null;
         var size:uint = 0;
         var emptySince:uint = 0;
         var i:uint = 0;
         var s:String = null;
         var managerName:String = null;
         var manager:OptionManager = null;
         var entitiesList:Array = null;
         var monster:Monster = null;
         var ct:ColorTransform = null;
         var val:* = undefined;
         var prop:Array = null;
         var name:String = null;
         var p:Object = null;
         var o:* = undefined;
         var entity:TiphonSprite = null;
         var tete:DisplayObject = null;
         var oldValue:Number = NaN;
         var monsterLook:TiphonEntityLook = null;
         var changeCount:uint = 0;
         var sceneEntity:IEntity = null;
         var target:LoggingTarget = null;
         var targetType:String = null;
         loop6:
         switch(cmd)
         {
            case "log":
               log = Log.getLogger(getQualifiedClassName(MiscInstructionHandler));
               LogLogger.activeLog(args[0] == "true" || args[0] == "on");
               console.output("Log set to " + LogLogger.logIsActive());
               break;
            case "newdofus":
               NativeApplication.nativeApplication.dispatchEvent(new Event(InvokeEvent.INVOKE));
               break;
            case "i18nsize":
               size = 0;
               emptySince = 0;
               i = 1;
               s = "";
               do
               {
                  s = I18n.getText(i++);
                  if(s)
                  {
                     emptySince = 0;
                     size = size + s.length;
                  }
                  else
                  {
                     emptySince++;
                  }
               }
               while(emptySince < 20);
               
               console.output(size + " characters in " + (i - 1) + " entries.");
               break;
            case "clear":
               KernelEventsManager.getInstance().processCallback(HookList.ConsoleClear);
               break;
            case "config":
               if(!args[0])
               {
                  console.output("Syntax : /config <manager> [<option>]");
                  break;
               }
               managerName = args[0];
               if(!OptionManager.getOptionManager(managerName))
               {
                  console.output("Unknown manager \'" + managerName + "\').");
                  break;
               }
               manager = OptionManager.getOptionManager(managerName);
               if(args[1])
               {
                  if(manager[args[1]] != null)
                  {
                     val = args[2];
                     if(val == "true")
                     {
                        val = true;
                     }
                     if(val == "false")
                     {
                        val = false;
                     }
                     if(parseInt(val).toString() == val)
                     {
                        val = parseInt(val);
                     }
                     manager[args[1]] = val;
                     break;
                  }
                  console.output(args[1] + " not found on " + manager);
                  break;
               }
               prop = new Array();
               for(name in manager)
               {
                  prop.push({
                     "name":name,
                     "value":manager[name]
                  });
               }
               prop.sortOn("name");
               for each(p in prop)
               {
                  console.output(" - " + p.name + " : " + p.value);
               }
               break;
            case "clearwebcache":
               TimeoutHTMLLoader.resetCache();
               break;
            case "geteventmodeparams":
               if(args.length != 2)
               {
                  console.output("Syntax : /getEventModeParams <login> <password>");
                  return;
               }
               console.output(Base64.encode("login:" + args[0] + ",password:" + args[1]));
               break;
            case "setquality":
               if(args.length != 1)
               {
                  console.output("Current stage.quality : [" + StageShareManager.stage.quality + "]");
                  return;
               }
               StageShareManager.stage.quality = args[0];
               console.output("Try set stage.qualitity to [" + args[0] + "], result : [" + StageShareManager.stage.quality + "]");
               break;
            case "lowdefskin":
               for each(o in EntitiesManager.getInstance().entities)
               {
                  if(o is TiphonSprite)
                  {
                     TiphonSprite(o).setAlternativeSkinIndex(TiphonSprite(o).getAlternativeSkinIndex() == -1?0:-1);
                  }
               }
               break;
            case "synchrosequence":
               if(Kernel.getWorker().contains(SynchronisationFrame))
               {
                  this._synchronisationFrameInstance = Kernel.getWorker().getFrame(SynchronisationFrame) as SynchronisationFrame;
                  Kernel.getWorker().removeFrame(this._synchronisationFrameInstance);
                  console.output("Synchro sequence disable");
                  break;
               }
               if(this._synchronisationFrameInstance)
               {
                  console.output("Synchro sequence enable");
                  Kernel.getWorker().addFrame(this._synchronisationFrameInstance);
                  break;
               }
               console.output("Can\'t enable synchro sequence");
               break;
            case "throw":
               if(args[0] == "async")
               {
                  setTimeout(function():void
                  {
                     throw new Error("Test error");
                  },100);
                  break;
               }
               throw new Error("Test error");
            case "sd":
               entitiesList = EntitiesManager.getInstance().entities;
               for each(entity in entitiesList)
               {
                  if(entity)
                  {
                     tete = entity.getSlot("Tete");
                     if(tete)
                     {
                        tete.scaleX = 2;
                        tete.scaleY = 2;
                     }
                  }
               }
               break;
            case "celebration":
               RoleplayManager.getInstance().celebrate();
               break;
            case "debugmouseover":
               HumanInputHandler.getInstance().debugOver = !HumanInputHandler.getInstance().debugOver;
               break;
            case "idletime":
               if(args.length == 1)
               {
                  InactivityManager.getInstance().inactivityDelay = int(args[0]) * 1000;
               }
               console.output("Temps avant inactivité : " + Math.floor(InactivityManager.getInstance().inactivityDelay / 1000) + "s");
               break;
            case "setmonsterspeed":
               if(args.length >= 1)
               {
                  monster = Monster.getMonsterById(int(args[0]));
               }
               if(args.length == 1)
               {
                  console.output("Vitesse du monstre " + monster.name + " (id:" + monster.id + ") : " + monster.speedAdjust);
                  break;
               }
               if(args.length == 2)
               {
                  oldValue = monster.speedAdjust;
                  monster.speedAdjust = parseFloat(args[1]);
                  console.output("Vitesse du monstre " + monster.name + " (id:" + monster.id + ") : " + monster.speedAdjust + " (ancienne valeur: " + oldValue + ")");
                  monsterLook = TiphonEntityLook.fromString(monster.look);
                  changeCount = 0;
                  for each(sceneEntity in EntitiesManager.getInstance().entities)
                  {
                     if(sceneEntity is AnimatedCharacter && AnimatedCharacter(sceneEntity).look.getBone() == monsterLook.getBone())
                     {
                        changeCount++;
                        AnimatedCharacter(sceneEntity).speedAdjust = monster.speedAdjust;
                     }
                  }
                  console.output("Nombre d\'entité sur la scene modifiées : " + changeCount);
                  break;
               }
               console.output("Un ou deux arguments sont nécessaires : ID du monstre, 2 vitesse de -10 à +10");
               break;
            case "sosloglevel":
               if(args.length < 2)
               {
                  console.output("usage : sosloglevel < trace / debug / info / warn / error / fatal > < boolean >");
                  break;
               }
               switch(args[0].toUpperCase())
               {
                  case LogLevel.getString(LogLevel.TRACE):
                     Log.deactivateLevel(LogLevel.TRACE,args[1]);
                     break loop6;
                  case LogLevel.getString(LogLevel.DEBUG):
                     Log.deactivateLevel(LogLevel.DEBUG,args[1]);
                     break loop6;
                  case LogLevel.getString(LogLevel.INFO):
                     Log.deactivateLevel(LogLevel.INFO,args[1]);
                     break loop6;
                  case LogLevel.getString(LogLevel.WARN):
                     Log.deactivateLevel(LogLevel.WARN,args[1]);
                     break loop6;
                  case LogLevel.getString(LogLevel.ERROR):
                     Log.deactivateLevel(LogLevel.ERROR,args[1]);
                     break loop6;
                  case LogLevel.getString(LogLevel.FATAL):
                     Log.deactivateLevel(LogLevel.FATAL,args[1]);
                     break loop6;
                  default:
                     console.output("invalid Sos Target, please choose between : trace / debug / info / warn / error / fatal");
                     break loop6;
               }
            case "sostarget":
               if(args.length < 2)
               {
                  console.output("usage : sostarget < add / remove > < trace / sos / file / console / centralize >");
               }
               if(args[0].toLowerCase() == "add")
               {
                  target = null;
                  switch(args[1].toLowerCase())
                  {
                     case "trace":
                        target = new TraceTarget();
                        break;
                     case "sos":
                        target = new SOSTarget();
                        break;
                     case "file":
                        target = new FileTarget();
                        break;
                     case "console":
                        target = new ConsoleTarget();
                        break;
                     case "centralize":
                        target = new CentralizeTarget();
                  }
                  if(target)
                  {
                     Log.addTarget(target);
                     break;
                  }
                  console.output("Invalide Target name");
                  break;
               }
               if(args[0].toLowerCase() == "remove")
               {
                  targetType = "";
                  switch(args[1].toLowerCase())
                  {
                     case "trace":
                        targetType = "com.ankamagames.jerakine.logger.targets::TraceTarget";
                        break loop6;
                     case "sos":
                        targetType = "com.ankamagames.jerakine.logger.targets::SOSTarget";
                        break loop6;
                     case "file":
                        targetType = "com.ankamagames.jerakine.logger.targets::FileTarget";
                        break loop6;
                     case "console":
                        targetType = "com.ankamagames.jerakine.logger.targets::ConsoleTarget";
                        break loop6;
                     case "centralize":
                        targetType = "com.ankamagames.jerakine.logger.targets::CentralizeTarget";
                        break loop6;
                     default:
                        break loop6;
                  }
               }
               break;
            case "debugmodule":
               ModuleDebugManager.display(args[0] != "false");
               break;
            case "colorui":
               ct = new ColorTransform();
               if(args[1])
               {
                  ct.redMultiplier = parseFloat(args[1]);
               }
               if(args[2])
               {
                  ct.greenMultiplier = parseFloat(args[2]);
               }
               if(args[3])
               {
                  ct.blueMultiplier = parseFloat(args[3]);
               }
               if(args[4])
               {
                  ct.redOffset = parseFloat(args[4]);
               }
               if(args[5])
               {
                  ct.greenOffset = parseFloat(args[5]);
               }
               if(args[6])
               {
                  ct.blueOffset = parseFloat(args[6]);
               }
               TextureBase.colorize(args[0],ct);
               break;
            case "coloruisave":
               TextureBase.saveColor();
               break;
            case "coloruilist":
               console.output(StringUtils.formatArray(TextureBase.getUserColorList(),["Filters","Exclude","Colors"]));
               break;
            case "coloruireset":
               TextureBase.resetColor();
               console.output("You need to restart the game.");
         }
      }
      
      public function getHelp(cmd:String) : String
      {
         switch(cmd)
         {
            case "log":
               return "Switch on/off client log process.";
            case "i18nsize":
               return "Get the total size in characters of I18N datas.";
            case "newdofus":
               return "Try to launch a new dofus client.";
            case "clear":
               return "clear the console output";
            case "clearwebcache":
               return "clear cached web browser";
            case "geteventmodeparams":
               return "Get event mode config file param. param 1 : login, param 2 : password";
            case "setquality":
               return "Set stage quality (no param to get actual value)";
            case "config":
               return "list options in different managers if no param else set an option /config [managerName] [paramName] [paramValue]";
            case "synchrosequence":
               return "Enable/disable synchro sequence";
            case "throw":
               return "Throw an exception (test only) option:[async|sync]";
            case "debugmouseover":
               return "Activate/Deactivate mouse over debug : It will show which objects receive event and their bounds.";
            case "idletime":
               return "Set inactivity time limit (in seconds)";
            case "setmonsterspeed":
               return "Ajuste la vitesse de déplacement d\'un monstre";
            default:
               return "No help for command \'" + cmd + "\'";
         }
      }
      
      public function getParamPossibilities(cmd:String, paramIndex:uint = 0, currentParams:Array = null) : Array
      {
         var managerName:String = null;
         var name:* = null;
         var possibilities:Array = [];
         switch(cmd)
         {
            case "throw":
               possibilities = ["async","sync"];
               break;
            case "setquality":
               possibilities = [StageQuality.LOW,StageQuality.MEDIUM,StageQuality.HIGH,StageQuality.BEST];
               break;
            case "config":
               if(paramIndex == 0)
               {
                  possibilities = OptionManager.getOptionManagers();
                  break;
               }
               if(paramIndex == 1)
               {
                  managerName = currentParams[0];
                  for(name in OptionManager.getOptionManager(managerName))
                  {
                     possibilities.push(name);
                  }
                  break;
               }
               break;
         }
         return possibilities;
      }
   }
}
