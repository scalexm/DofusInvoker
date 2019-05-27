package com.ankama.codegen.client.model
{
   public class EsportModelSeason
   {
       
      
      public var id:Number = 0;
      
      public var name:String = null;
      
      public var template:String = null;
      
      public var key:String = null;
      
      public var visible:Boolean = false;
      
      public var current:Boolean = false;
      
      public var imageLogoUrl:String = null;
      
      public var imageBannerUrl:String = null;
      
      public var imageBannerMobileUrl:String = null;
      
      public var league:EsportModelLeague = null;
      
      public var teams:Array;
      
      public var seasonTeamPlayers:Array;
      
      public var matches:Array;
      
      public var websiteUrl:String = null;
      
      public var createdAt:Date = null;
      
      public function EsportModelSeason()
      {
         this.teams = new Array();
         this.seasonTeamPlayers = new Array();
         this.matches = new Array();
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class EsportModelSeason {\n");
         sb.concat("  id: ").concat(this.id).concat("\n");
         sb.concat("  name: ").concat(this.name).concat("\n");
         sb.concat("  template: ").concat(this.template).concat("\n");
         sb.concat("  key: ").concat(this.key).concat("\n");
         sb.concat("  visible: ").concat(this.visible).concat("\n");
         sb.concat("  current: ").concat(this.current).concat("\n");
         sb.concat("  imageLogoUrl: ").concat(this.imageLogoUrl).concat("\n");
         sb.concat("  imageBannerUrl: ").concat(this.imageBannerUrl).concat("\n");
         sb.concat("  imageBannerMobileUrl: ").concat(this.imageBannerMobileUrl).concat("\n");
         sb.concat("  league: ").concat(this.league).concat("\n");
         sb.concat("  teams: ").concat(this.teams).concat("\n");
         sb.concat("  seasonTeamPlayers: ").concat(this.seasonTeamPlayers).concat("\n");
         sb.concat("  matches: ").concat(this.matches).concat("\n");
         sb.concat("  websiteUrl: ").concat(this.websiteUrl).concat("\n");
         sb.concat("  createdAt: ").concat(this.createdAt).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
