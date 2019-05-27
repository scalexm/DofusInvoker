package org.as3commons.bytecode.tags
{
   public class ShowFrameTag extends AbstractTag
   {
      
      public static const TAG_ID:uint = 1;
      
      private static const TAG_NAME:String = "ShowFrame";
       
      
      public function ShowFrameTag()
      {
         super(TAG_ID,TAG_NAME);
      }
   }
}
