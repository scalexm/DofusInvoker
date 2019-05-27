package com.ankama.codegen.client.model
{
   import flash.utils.Dictionary;
   
   public class Character
   {
       
      
      public var id:Number = 0;
      
      public var name:String = null;
      
      public var experience:Number = 0;
      
      public var level:Number = 0;
      
      public var breed_id:Number = 0;
      
      public var sex_id:Number = 0;
      
      public var face_id:Number = 0;
      
      public var images:Dictionary;
      
      public var colors:Dictionary;
      
      public var guild:Guild = null;
      
      public function Character()
      {
         this.images = new Dictionary();
         this.colors = new Dictionary();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class Character {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  name: ").concat(this.name).concat("\n");
         sb.concat("  experience: ").concat(this.experience).concat("\n");
         sb.concat("  level: ").concat(this.level).concat("\n");
         sb.concat("  breed_id: ").concat(this.breed_id).concat("\n");
         sb.concat("  sex_id: ").concat(this.sex_id).concat("\n");
         sb.concat("  face_id: ").concat(this.face_id).concat("\n");
         sb.concat("  images: ").concat(this.images).concat("\n");
         sb.concat("  colors: ").concat(this.colors).concat("\n");
         sb.concat("  guild: ").concat(this.guild).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
