package com.ankamagames.dofus.misc.utils
{
   import com.ankamagames.jerakine.managers.CursorSpriteManager;
   import com.ankamagames.jerakine.utils.misc.DescribeTypeCache;
   
   public class CursorConstant
   {
      
      public static var resizeV:Class = CursorConstant_resizeV;
      
      public static var resizeH:Class = CursorConstant_resizeH;
      
      public static var resizeL:Class = CursorConstant_resizeL;
      
      public static var resizeR:Class = CursorConstant_resizeR;
      
      public static var drag:Class = CursorConstant_drag;
       
      
      public function CursorConstant()
      {
         super();
      }
      
      public static function init() : void
      {
         var cursorName:String = null;
         var info:Vector.<String> = DescribeTypeCache.getVariables(CursorConstant);
         for each(cursorName in info)
         {
            if(cursorName != "prototype")
            {
               CursorSpriteManager.registerSpecificCursor(cursorName,new CursorConstant[cursorName]());
            }
         }
      }
   }
}
