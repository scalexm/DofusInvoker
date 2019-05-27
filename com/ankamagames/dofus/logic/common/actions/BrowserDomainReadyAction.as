package com.ankamagames.dofus.logic.common.actions
{
   import com.ankamagames.berilia.components.WebBrowser;
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class BrowserDomainReadyAction implements Action
   {
       
      
      public var browser:WebBrowser;
      
      public function BrowserDomainReadyAction()
      {
         super();
      }
      
      public static function create(browser:WebBrowser) : BrowserDomainReadyAction
      {
         var a:BrowserDomainReadyAction = new BrowserDomainReadyAction();
         a.browser = browser;
         return a;
      }
   }
}
