package com.ankamagames.dofus.datacenter.items
{
   import com.ankamagames.dofus.datacenter.effects.EffectInstance;
   import com.ankamagames.jerakine.data.GameData;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   
   public class ItemSet#137 implements IDataCenter
   {
      
      public static const MODULE:String = "ItemSets";
       
      
      public var id:uint;
      
      public var items:Vector.<uint>;
      
      public var nameId:uint;
      
      public var effects:Vector.<Vector.<EffectInstance>>;
      
      public var bonusIsSecret:Boolean;
      
      private var _name:String;
      
      public function ItemSet#137()
      {
         super();
      }
      
      public static function getItemSetById(id:uint) : ItemSet#137
      {
         return GameData.getObject(MODULE,id) as ItemSet#137;
      }
      
      public static function getItemSets() : Array
      {
         return GameData.getObjects(MODULE);
      }
      
      public function get name() : String
      {
         if(!this._name)
         {
            this._name = I18n.getText(this.nameId);
         }
         return this._name;
      }
   }
}
