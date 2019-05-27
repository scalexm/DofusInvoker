package com.ankama.codegen.client.model
{
   public class EntityLook
   {
       
      
      public var avatar_uid:String = null;
      
      public var character_uid:Number = 0;
      
      public var entity_look:String = null;
      
      public function EntityLook()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EntityLook {\n");
         sb.concat("  avatar_uid: ").concat(this.avatar_uid).concat("\n");
         sb.concat("  character_uid: ").concat(this.character_uid).concat("\n");
         sb.concat("  entity_look: ").concat(this.entity_look).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
