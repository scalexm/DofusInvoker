package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.factories.MenusFactory;
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.berilia.interfaces.IMenuMaker;
   import com.ankamagames.berilia.types.data.ContextMenuData;
   import com.ankamagames.berilia.utils.errors.ApiError;
   import com.ankamagames.jerakine.utils.misc.CheckCompatibility;
   
   [InstanciedApi]
   public class ContextMenuApi implements IApi
   {
       
      
      public function ContextMenuApi()
      {
         super();
      }
      
      [Untrusted]
      public function registerMenuMaker(makerName:String, makerClass:Class) : void
      {
         if(CheckCompatibility.isCompatible(IMenuMaker,makerClass))
         {
            MenusFactory.registerMaker(makerName,makerClass);
            return;
         }
         throw new ApiError(makerName + " maker class is not compatible with IMenuMaker");
      }
      
      [Untrusted]
      public function create(data:*, makerName:String = null, makerParams:Array = null) : ContextMenuData
      {
         var menu:ContextMenuData = MenusFactory.create(data,makerName,makerParams);
         return menu;
      }
      
      [NoBoxing]
      [Untrusted]
      public function getMenuMaker(makerName:String) : Object
      {
         return MenusFactory.getMenuMaker(makerName);
      }
   }
}
