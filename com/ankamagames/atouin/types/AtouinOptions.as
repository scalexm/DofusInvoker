package com.ankamagames.atouin.types
{
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.messages.MessageHandler;
   import flash.display.DisplayObjectContainer;
   
   public dynamic class AtouinOptions extends OptionManager
   {
       
      
      private var _container:DisplayObjectContainer;
      
      private var _handler:MessageHandler;
      
      public function AtouinOptions(docContainer:DisplayObjectContainer, mhHandler:MessageHandler)
      {
         super("atouin");
         add("groundCacheMode",1);
         add("useInsideAutoZoom",false);
         add("useCacheAsBitmap",false);
         add("useSmooth",true);
         add("frustum",new Frustum(),false);
         add("alwaysShowGrid",false);
         add("debugLayer",false);
         add("showCellIdOnOver",false);
         add("showEveryCellId",false);
         add("tweentInterMap",false);
         add("hideInterMap",false);
         add("virtualPlayerJump",false);
         add("reloadLoadedMap",false);
         add("hideForeground",false);
         add("allowAnimatedGfx",true);
         add("allowParticlesFx",true);
         add("elementsPath");
         add("pngSubPath");
         add("jpgSubPath");
         add("pngPathOverride");
         add("swfPath");
         add("mapsPath");
         add("elementsIndexPath");
         add("particlesScriptsPath");
         add("transparentOverlayMode",false);
         add("groundOnly",false);
         add("showTransitions",false);
         add("useLowDefSkin",true);
         add("showProgressBar",false);
         add("mapPictoExtension","png");
         add("hideBlackBorder",true);
         add("tacticalModeTemplatesPath");
         this._container = docContainer;
         this._handler = mhHandler;
      }
      
      public function get container() : DisplayObjectContainer
      {
         return this._container;
      }
      
      public function get handler() : MessageHandler
      {
         return this._handler;
      }
   }
}
