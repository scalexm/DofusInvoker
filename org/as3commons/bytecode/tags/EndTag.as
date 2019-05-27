package org.as3commons.bytecode.tags
{
   import org.as3commons.lang.StringUtils;
   
   public class EndTag extends AbstractTag
   {
      
      public static const TAG_ID:uint = 0;
      
      private static const TAG_NAME:String = "End";
       
      
      public function EndTag()
      {
         super(TAG_ID,TAG_NAME);
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("[EndTag(id={0},name={1})]",id,name);
      }
   }
}
