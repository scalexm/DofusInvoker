package com.ankamagames.berilia.components.params
{
   import com.ankamagames.berilia.components.Grid;
   import com.ankamagames.berilia.utils.UiProperties;
   import com.ankamagames.jerakine.utils.memory.WeakProxyReference;
   
   public class GridScriptProperties extends UiProperties
   {
       
      
      public var data;
      
      public var selected:Boolean;
      
      public var grid:WeakProxyReference;
      
      public function GridScriptProperties(d:*, b:Boolean = false, grid:Grid = null)
      {
         super();
         this.data = d;
         this.selected = b;
         this.grid = new WeakProxyReference(grid);
      }
   }
}
