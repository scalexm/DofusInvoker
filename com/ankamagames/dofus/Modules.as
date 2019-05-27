package com.ankamagames.dofus
{
   import flash.utils.Dictionary;
   
   public class Modules
   {
      
      public static const ANKAMA_ADMIN:Class = Modules_ANKAMA_ADMIN;
      
      public static const ANKAMA_CARTOGRAPHY:Class = Modules_ANKAMA_CARTOGRAPHY;
      
      public static const ANKAMA_CHARACTERSHEET:Class = Modules_ANKAMA_CHARACTERSHEET;
      
      public static const ANKAMA_COMMON:Class = Modules_ANKAMA_COMMON;
      
      public static const ANKAMA_CONFIG:Class = Modules_ANKAMA_CONFIG;
      
      public static const ANKAMA_CONNECTION:Class = Modules_ANKAMA_CONNECTION;
      
      public static const ANKAMA_CONSOLE:Class = Modules_ANKAMA_CONSOLE;
      
      public static const ANKAMA_CONTEXTMENU:Class = Modules_ANKAMA_CONTEXTMENU;
      
      public static const ANKAMA_DOCUMENT:Class = Modules_ANKAMA_DOCUMENT;
      
      public static const ANKAMA_EXCHANGE:Class = Modules_ANKAMA_EXCHANGE;
      
      public static const ANKAMA_DUNGEON:Class = Modules_ANKAMA_DUNGEON;
      
      public static const ANKAMA_FIGHT:Class = Modules_ANKAMA_FIGHT;
      
      public static const ANKAMA_GAMEUICORE:Class = Modules_ANKAMA_GAMEUICORE;
      
      public static const ANKAMA_GRIMOIRE:Class = Modules_ANKAMA_GRIMOIRE;
      
      public static const ANKAMA_HOUSE:Class = Modules_ANKAMA_HOUSE;
      
      public static const ANKAMA_JOB:Class = Modules_ANKAMA_JOB;
      
      public static const ANKAMA_MOUNT:Class = Modules_ANKAMA_MOUNT;
      
      public static const ANKAMA_PARTY:Class = Modules_ANKAMA_PARTY;
      
      public static const ANKAMA_ROLEPLAY:Class = Modules_ANKAMA_ROLEPLAY;
      
      public static const ANKAMA_SOCIAL:Class = Modules_ANKAMA_SOCIAL;
      
      public static const ANKAMA_STORAGE:Class = Modules_ANKAMA_STORAGE;
      
      public static const ANKAMA_TAXI:Class = Modules_ANKAMA_TAXI;
      
      public static const ANKAMA_TOOLTIPS:Class = Modules_ANKAMA_TOOLTIPS;
      
      public static const ANKAMA_TRADECENTER:Class = Modules_ANKAMA_TRADECENTER;
      
      public static const ANKAMA_TUTORIAL:Class = Modules_ANKAMA_TUTORIAL;
      
      public static const ANKAMA_WEB:Class = Modules_ANKAMA_WEB;
      
      private static var _scripts:Dictionary = null;
       
      
      public function Modules()
      {
         super();
      }
      
      public static function get scripts() : Dictionary
      {
         if(!_scripts)
         {
            _scripts = new Dictionary();
            _scripts["Ankama_Admin"] = ANKAMA_ADMIN;
            _scripts["Ankama_Cartography"] = ANKAMA_CARTOGRAPHY;
            _scripts["Ankama_CharacterSheet"] = ANKAMA_CHARACTERSHEET;
            _scripts["Ankama_Common"] = ANKAMA_COMMON;
            _scripts["Ankama_Config"] = ANKAMA_CONFIG;
            _scripts["Ankama_Connection"] = ANKAMA_CONNECTION;
            _scripts["Ankama_Console"] = ANKAMA_CONSOLE;
            _scripts["Ankama_ContextMenu"] = ANKAMA_CONTEXTMENU;
            _scripts["Ankama_Document"] = ANKAMA_DOCUMENT;
            _scripts["Ankama_Dungeon"] = ANKAMA_DUNGEON;
            _scripts["Ankama_Exchange"] = ANKAMA_EXCHANGE;
            _scripts["Ankama_Fight"] = ANKAMA_FIGHT;
            _scripts["Ankama_GameUiCore"] = ANKAMA_GAMEUICORE;
            _scripts["Ankama_Grimoire"] = ANKAMA_GRIMOIRE;
            _scripts["Ankama_House"] = ANKAMA_HOUSE;
            _scripts["Ankama_Job"] = ANKAMA_JOB;
            _scripts["Ankama_Mount"] = ANKAMA_MOUNT;
            _scripts["Ankama_Party"] = ANKAMA_PARTY;
            _scripts["Ankama_Roleplay"] = ANKAMA_ROLEPLAY;
            _scripts["Ankama_Social"] = ANKAMA_SOCIAL;
            _scripts["Ankama_Storage"] = ANKAMA_STORAGE;
            _scripts["Ankama_Taxi"] = ANKAMA_TAXI;
            _scripts["Ankama_Tooltips"] = ANKAMA_TOOLTIPS;
            _scripts["Ankama_TradeCenter"] = ANKAMA_TRADECENTER;
            _scripts["Ankama_Tutorial"] = ANKAMA_TUTORIAL;
            _scripts["Ankama_Web"] = ANKAMA_WEB;
         }
         return _scripts;
      }
   }
}
