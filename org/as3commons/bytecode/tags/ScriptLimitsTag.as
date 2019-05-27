package org.as3commons.bytecode.tags
{
   public class ScriptLimitsTag extends AbstractTag
   {
      
      public static const TAG_ID:uint = 65;
      
      private static const TAG_NAME:String = "ScriptLimits";
       
      
      private var _maxRecursionDepth:uint;
      
      private var _scriptTimeoutSeconds:uint;
      
      public function ScriptLimitsTag()
      {
         super(TAG_ID,TAG_NAME);
      }
      
      public function get maxRecursionDepth() : uint
      {
         return this._maxRecursionDepth;
      }
      
      public function set maxRecursionDepth(value:uint) : void
      {
         this._maxRecursionDepth = value;
      }
      
      public function get scriptTimeoutSeconds() : uint
      {
         return this._scriptTimeoutSeconds;
      }
      
      public function set scriptTimeoutSeconds(value:uint) : void
      {
         this._scriptTimeoutSeconds = value;
      }
   }
}
