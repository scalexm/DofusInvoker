package org.as3commons.bytecode.tags
{
   public class FrameLabelTag extends AbstractTag
   {
      
      public static const TAG_ID:uint = 43;
      
      private static const TAG_NAME:String = "FrameLabel";
       
      
      private var _frameLabelName:String;
      
      public function FrameLabelTag()
      {
         super(TAG_ID,TAG_NAME);
      }
      
      public function get frameLabelName() : String
      {
         return this._frameLabelName;
      }
      
      public function set frameLabelName(value:String) : void
      {
         this._frameLabelName = value;
      }
   }
}
