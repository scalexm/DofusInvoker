package com.ankama.codegen.client.model
{
   public class EsportModelTeam
   {
       
      
      public var id:Number = 0;
      
      public var name:String = null;
      
      public var description:String = null;
      
      public var tag:String = null;
      
      public var imageUrl:String = null;
      
      public var players:Array;
      
      public var websiteUrl:String = null;
      
      public var createdAt:Date = null;
      
      public function EsportModelTeam()
      {
         this.players = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelTeam {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  name: ").concat(this.name).concat("\n");
         sb.concat("  description: ").concat(this.description).concat("\n");
         sb.concat("  tag: ").concat(this.tag).concat("\n");
         sb.concat("  imageUrl: ").concat(this.imageUrl).concat("\n");
         sb.concat("  players: ").concat(this.players).concat("\n");
         sb.concat("  websiteUrl: ").concat(this.websiteUrl).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
