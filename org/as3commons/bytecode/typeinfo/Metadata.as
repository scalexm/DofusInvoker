package org.as3commons.bytecode.typeinfo
{
   import flash.utils.Dictionary;
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.IEquals;
   import org.as3commons.lang.StringUtils;
   import org.as3commons.lang.util.CloneUtils;
   
   public final class Metadata implements ICloneable, IEquals
   {
      
      private static const KEY_VALUE_PAIR_TOSTRING:String = "{0}=\"{1}\"";
      
      private static const METADATA_TOSTRING:String = "[{0}({1})]";
       
      
      public var name:String;
      
      public var properties:Dictionary;
      
      public function Metadata()
      {
         super();
         this.properties = new Dictionary();
      }
      
      public function clone() : *
      {
         var clone:Metadata = new Metadata();
         clone.name = this.name;
         clone.properties = CloneUtils.cloneDictionary(this.properties);
      }
      
      public function toString() : String
      {
         var key:* = null;
         var keyValuePairs:Array = [];
         for(key in this.properties)
         {
            keyValuePairs[keyValuePairs.length] = StringUtils.substitute(KEY_VALUE_PAIR_TOSTRING,key,this.properties[key]);
         }
         return StringUtils.substitute(METADATA_TOSTRING,this.name,keyValuePairs.join());
      }
      
      public function equals(other:Object) : Boolean
      {
         var key:* = null;
         var otherMetadata:Metadata = other as Metadata;
         if(otherMetadata != null)
         {
            if(this.name != otherMetadata.name)
            {
               return false;
            }
            for(key in this.properties)
            {
               if(!otherMetadata.properties.hasOwnProperty(key))
               {
                  return false;
               }
               if(this.properties[key] != otherMetadata.properties[key])
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
