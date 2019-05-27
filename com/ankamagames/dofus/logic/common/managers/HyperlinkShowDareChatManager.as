package com.ankamagames.dofus.logic.common.managers
{
   import com.ankamagames.berilia.enums.StrataEnum;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.berilia.managers.TooltipManager;
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.types.data.TextTooltipInfo;
   import com.ankamagames.dofus.internalDatacenter.dare.DareWrapper;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.DareFrame;
   import com.ankamagames.dofus.misc.lists.SocialHookList;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class HyperlinkShowDareChatManager
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(HyperlinkShowDareChatManager));
      
      private static var _dareList:Array = new Array();
      
      private static var _dareId:Number = 0;
       
      
      public function HyperlinkShowDareChatManager()
      {
         super();
      }
      
      public static function showDare(dareId:Number) : void
      {
         var data:Object = new Object();
         data.dareId = dareId;
         data.forceOpen = true;
         TooltipManager.hideAll();
         KernelEventsManager.getInstance().processCallback(SocialHookList.OpenDareSearch,"" + dareId,"searchFilterId");
      }
      
      public static function addDare(dareId:Number) : String
      {
         var code:* = null;
         var dareFrame:DareFrame = Kernel.getWorker().getFrame(DareFrame) as DareFrame;
         var dare:DareWrapper = dareFrame.getDareById(dareId);
         if(dare)
         {
            _dareList[_dareId] = dare;
            code = "{chatdare," + dareId + "::" + getDareName(dareId) + "}";
            _dareId++;
            return code;
         }
         return getDareName(dareId);
      }
      
      public static function getDareName(dareId:Number) : String
      {
         return "[" + I18n.getUiText("ui.dare.dareShort") + " " + dareId + "]";
      }
      
      public static function rollOver(pX:int, pY:int, dareId:Number = 0) : void
      {
         var target:Rectangle = new Rectangle(pX,pY,10,10);
         var info:TextTooltipInfo = new TextTooltipInfo(I18n.getUiText("ui.dare.showInformations"));
         TooltipManager.show(info,target,UiModuleManager.getInstance().getModule("Ankama_GameUiCore"),false,"HyperLink",6,2,3,true,null,null,null,null,false,StrataEnum.STRATA_TOOLTIP,1);
      }
   }
}
