package org.as3commons.bytecode.tags
{
   public class MetadataTag extends AbstractTag
   {
      
      public static const TAG_ID:uint = 77;
      
      private static const TAG_NAME:String = "Metadata";
       
      
      private var _metadata:String;
      
      public function MetadataTag()
      {
         super(TAG_ID,TAG_NAME);
      }
      
      public function get metadata() : String
      {
         return this._metadata;
      }
      
      public function set metadata(value:String) : void
      {
         this._metadata = value;
      }
   }
}
