package com.ankama.codegen.client.model
{
   public class LadderModelHumanCharacter
   {
       
      
      public var id:Number = 0;
      
      public var server:Number = 0;
      
      public var name:String = null;
      
      public var breed:Number = 0;
      
      public var sex:String = null;
      
      public var level:Number = 0;
      
      public var connection:Number = 0;
      
      public function LadderModelHumanCharacter()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class LadderModelHumanCharacter {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  server: ").concat(this.server).concat("\n");
         sb.concat("  name: ").concat(this.name).concat("\n");
         sb.concat("  breed: ").concat(this.breed).concat("\n");
         sb.concat("  sex: ").concat(this.sex).concat("\n");
         sb.concat("  level: ").concat(this.level).concat("\n");
         sb.concat("  connection: ").concat(this.connection).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
