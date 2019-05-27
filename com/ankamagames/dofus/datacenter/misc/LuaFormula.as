package com.ankamagames.dofus.datacenter.misc
{
   import com.ankamagames.jerakine.data.GameData;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class LuaFormula implements IDataCenter
   {
      
      public static const MODULE:String = "LuaFormulas";
       
      
      public var id:int;
      
      public var formulaName:String;
      
      public var luaFormula:String;
      
      public function LuaFormula()
      {
         super();
      }
      
      public static function getLuaFormulaById(id:int) : LuaFormula
      {
         return GameData.getObject(MODULE,id) as LuaFormula;
      }
      
      public static function getLuaFormulas() : Array
      {
         return GameData.getObjects(MODULE);
      }
   }
}
