package org.as3commons.bytecode.tags
{
   import org.as3commons.lang.Assert;
   
   public class AbstractTag implements ISWFTag
   {
       
      
      private var _id:uint;
      
      private var _name:String;
      
      public function AbstractTag(id:uint, name:String)
      {
         super();
         this.initAbstractTag(id,name);
      }
      
      private function initAbstractTag(id:uint, name:String) : void
      {
         Assert.hasText(name,"name argument must not be empty or null");
         this._id = id;
         this._name = name;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}
