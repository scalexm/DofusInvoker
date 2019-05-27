package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.util.AbcFileUtil;
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.IEquals;
   import org.as3commons.lang.StringUtils;
   
   public final class ScriptInfo implements ICloneable, IEquals
   {
       
      
      public var scriptInitializer:MethodInfo;
      
      public var traits:Vector.<TraitInfo>;
      
      public function ScriptInfo()
      {
         super();
         this.traits = new Vector.<TraitInfo>();
      }
      
      public function clone() : *
      {
         var scriptInfo:ScriptInfo = new ScriptInfo();
         scriptInfo.scriptInitializer = this.scriptInitializer.clone();
         scriptInfo.traits = AbcFileUtil.cloneVector(this.traits);
         return scriptInfo;
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("ScriptInfo[\n\tscriptInitializer={0}\n\ttraits=[\n\t\t{1}\n\t]\n]",this.scriptInitializer,this.traits.join("\n\t\t"));
      }
      
      public function equals(other:Object) : Boolean
      {
         var i:int = 0;
         var len:int = 0;
         var trait:TraitInfo = null;
         var otherTrait:TraitInfo = null;
         var otherScript:ScriptInfo = other as ScriptInfo;
         if(otherScript != null)
         {
            if(!this.scriptInitializer.equals(otherScript.scriptInitializer))
            {
               return false;
            }
            if(this.traits.length != otherScript.traits.length)
            {
               return false;
            }
            len = this.traits.length;
            for(i = 0; i < len; i++)
            {
               trait = this.traits[i];
               otherTrait = otherScript.traits[i];
               if(!trait.equals(otherTrait))
               {
                  return false;
               }
            }
            return true;
         }
         return false;
      }
   }
}
