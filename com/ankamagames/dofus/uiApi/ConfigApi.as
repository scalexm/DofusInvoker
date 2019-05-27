package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.atouin.types.AtouinOptions;
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.ThemeManager;
   import com.ankamagames.berilia.types.BeriliaOptions;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.berilia.utils.errors.ApiError;
   import com.ankamagames.dofus.externalnotification.ExternalNotificationManager;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.common.frames.MiscFrame;
   import com.ankamagames.dofus.misc.lists.HookList;
   import com.ankamagames.dofus.misc.options.ChatOptions;
   import com.ankamagames.dofus.misc.utils.errormanager.DofusErrorHandler;
   import com.ankamagames.dofus.types.DofusOptions;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.types.events.PropertyChangeEvent;
   import com.ankamagames.tiphon.engine.Tiphon;
   import com.ankamagames.tiphon.types.TiphonOptions;
   import com.ankamagames.tubul.types.TubulOptions;
   import flash.geom.Point;
   import flash.utils.getQualifiedClassName;
   
   [InstanciedApi]
   public class ConfigApi implements IApi
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(ConfigApi));
      
      private static var _init:Boolean = false;
       
      
      private var _module:UiModule;
      
      public function ConfigApi()
      {
         super();
         this.init();
      }
      
      private static function onPropertyChanged(e:PropertyChangeEvent) : void
      {
         var className:String = null;
         var newValue:* = e.propertyValue;
         var oldValue:* = e.propertyOldValue;
         switch(true)
         {
            case e.watchedClassInstance is AtouinOptions:
               className = "atouin";
               break;
            case e.watchedClassInstance is DofusOptions:
               className = "dofus";
               break;
            case e.watchedClassInstance is BeriliaOptions:
               className = "berilia";
               break;
            case e.watchedClassInstance is TiphonOptions:
               className = "tiphon";
               break;
            case e.watchedClassInstance is TubulOptions:
               className = "soundmanager";
               break;
            case e.watchedClassInstance is ChatOptions:
               className = "chat";
               break;
            default:
               className = getQualifiedClassName(e.watchedClassInstance);
         }
         KernelEventsManager.getInstance().processCallback(HookList.ConfigPropertyChange,className,e.propertyName,newValue,oldValue);
      }
      
      [ApiData(name="module")]
      public function set module(value:UiModule) : void
      {
         this._module = value;
      }
      
      [Trusted]
      public function destroy() : void
      {
         Atouin.getInstance().options.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGED,onPropertyChanged);
         Dofus.getInstance().options.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGED,onPropertyChanged);
         Tiphon.getInstance().options.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGED,onPropertyChanged);
         this._module = null;
         _init = false;
      }
      
      [Untrusted]
      public function getConfigProperty(configModuleName:String, propertyName:String) : *
      {
         var target:* = OptionManager.getOptionManager(configModuleName);
         if(!target)
         {
            throw new ApiError("Config module [" + configModuleName + "] does not exist.");
         }
         if(target && this.isSimpleConfigType(target[propertyName]))
         {
            return target[propertyName];
         }
         return null;
      }
      
      [Untrusted]
      public function setConfigProperty(configModuleName:String, propertyName:String, value:*) : void
      {
         var target:OptionManager = OptionManager.getOptionManager(configModuleName);
         if(!target)
         {
            throw new ApiError("Config module [" + configModuleName + "] does not exist.");
         }
         if(this.isSimpleConfigType(target.getDefaultValue(propertyName)))
         {
            target[propertyName] = value;
            return;
         }
         throw new ApiError(propertyName + " cannot be set in config module " + configModuleName + ".");
      }
      
      [Untrusted]
      public function resetConfigProperty(configModuleName:String, propertyName:String) : void
      {
         if(!OptionManager.getOptionManager(configModuleName))
         {
            throw ApiError("Config module [" + configModuleName + "] does not exist.");
         }
         OptionManager.getOptionManager(configModuleName).restaureDefaultValue(propertyName);
      }
      
      [NoBoxing]
      [Untrusted]
      public function createOptionManager(name:String) : OptionManager
      {
         var om:OptionManager = new OptionManager(name);
         return om;
      }
      
      [Trusted]
      public function getAllThemes() : Array
      {
         return ThemeManager.getInstance().getThemes();
      }
      
      [Untrusted]
      public function getCurrentTheme() : String
      {
         return ThemeManager.getInstance().currentTheme;
      }
      
      [Trusted]
      public function isOptionalFeatureActive(id:int) : Boolean
      {
         var miscFrame:MiscFrame = Kernel.getWorker().getFrame(MiscFrame) as MiscFrame;
         return miscFrame.isOptionalFeatureActive(id);
      }
      
      [Trusted]
      public function getServerConstant(id:int) : Object
      {
         return MiscFrame.getInstance().getServerSessionConstant(id);
      }
      
      [Untrusted]
      public function getExternalNotificationOptions(pNotificationType:int) : Object
      {
         return ExternalNotificationManager.getInstance().getNotificationOptions(pNotificationType);
      }
      
      [Untrusted]
      public function setExternalNotificationOptions(pNotificationType:int, pOptions:Object, pSynchronizeMultiAccountOptions:Boolean = true) : void
      {
         ExternalNotificationManager.getInstance().setNotificationOptions(pNotificationType,pOptions,pSynchronizeMultiAccountOptions);
      }
      
      [Untrusted]
      public function synchronizeExternalNotificationsMultiAccount() : void
      {
         ExternalNotificationManager.getInstance().synchronizeMultiAccountOptions();
      }
      
      [Untrusted]
      public function setDebugMode(activate:Boolean) : void
      {
         DofusErrorHandler.manualActivation = activate;
         if(activate)
         {
            DofusErrorHandler.activateDebugMode();
         }
      }
      
      [Untrusted]
      public function getDebugMode() : Boolean
      {
         return DofusErrorHandler.manualActivation;
      }
      
      [Untrusted]
      public function debugFileExists() : Boolean
      {
         return DofusErrorHandler.debugFileExists;
      }
      
      private function init() : void
      {
         if(_init)
         {
            return;
         }
         _init = true;
         Atouin.getInstance().options.addEventListener(PropertyChangeEvent.PROPERTY_CHANGED,onPropertyChanged);
         Dofus.getInstance().options.addEventListener(PropertyChangeEvent.PROPERTY_CHANGED,onPropertyChanged);
         Tiphon.getInstance().options.addEventListener(PropertyChangeEvent.PROPERTY_CHANGED,onPropertyChanged);
      }
      
      private function isSimpleConfigType(value:*) : Boolean
      {
         switch(true)
         {
            case value is int:
            case value is uint:
            case value is Number:
            case value is Boolean:
            case value is String:
            case value is Point:
               return true;
            default:
               return false;
         }
      }
   }
}
