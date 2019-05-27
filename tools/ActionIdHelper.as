package tools
{
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class ActionIdHelper
   {
      
      public static var STAT_BUFF_ACTION_IDS:Array = [283,293,110,118,125,2844,123,119,126,124,422,424,426,428,430,138,112,165,1054,414,416,418,420,1171,2808,2812,2800,2804,2802,2806,2814,2810,178,226,225,1166,1167,240,243,241,242,244,1076,111,128,1144,182,210,211,212,213,214,117,115,174,176,1039,1040,220,158,161,160,752,753,776,412,410,121,150];
      
      public static var STAT_DEBUFF_ACTION_IDS:Array = [157,153,2845,152,154,155,156,423,425,427,429,431,186,145,415,417,419,421,1172,2809,2813,2801,2805,2803,2807,2815,2811,179,245,248,246,247,249,1077,168,169,215,216,217,218,219,116,171,175,177,159,163,162,754,755,413,411];
      
      public static var actionIdToStatNameMap:IMap = _loc1_;
       
      
      public function ActionIdHelper()
      {
      }
      
      public static function isBasedOnCasterLife(param1:int) : Boolean
      {
         if((ActionIdHelper.isBasedOnCasterLifePercent(param1) || ActionIdHelper.isBasedOnCasterLifeMidlife(param1) || ActionIdHelper.isBasedOnCasterLifeMissing(param1) || ActionIdHelper.isBasedOnCasterLifeMissingMaxLife(param1)) == true)
         {
            return true;
         }
         return false;
      }
      
      public static function isBasedOnCasterLifePercent(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 85)
         {
            if(_loc2_ != 86)
            {
               if(_loc2_ != 87)
               {
                  if(_loc2_ != 88)
                  {
                     if(_loc2_ != 89)
                     {
                        if(_loc2_ != 90)
                        {
                           if(_loc2_ != 671)
                           {
                              return false;
                           }
                        }
                     }
                  }
               }
            }
         }
         return true;
      }
      
      public static function isBasedOnCasterLifeMissing(param1:int) : Boolean
      {
         if(param1 == 279 || param1 == 275 || param1 == 276 || param1 == 277 || param1 == 278)
         {
            return true;
         }
         return false;
      }
      
      public static function isBasedOnCasterLifeMissingMaxLife(param1:int) : Boolean
      {
         if(param1 == 1118 || param1 == 1121 || param1 == 1122 || param1 == 1119 || param1 == 1120)
         {
            return true;
         }
         return false;
      }
      
      public static function isBasedOnCasterLifeMidlife(param1:int) : Boolean
      {
         if(param1 == 672)
         {
            return true;
         }
         return false;
      }
      
      public static function isSplash(param1:int) : Boolean
      {
         if(!ActionIdHelper.isSplashDamage(param1))
         {
            return Boolean(ActionIdHelper.isSplashHeal(param1));
         }
         return true;
      }
      
      public static function isSplashDamage(param1:int) : Boolean
      {
         if(!ActionIdHelper.isSplashFinalDamage(param1))
         {
            return Boolean(ActionIdHelper.isSplashRawDamage(param1));
         }
         return true;
      }
      
      public static function isSplashFinalDamage(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 1223)
         {
            if(_loc2_ != 1224)
            {
               if(_loc2_ != 1225)
               {
                  if(_loc2_ != 1226)
                  {
                     if(_loc2_ != 1227)
                     {
                        if(_loc2_ != 1228)
                        {
                           return false;
                        }
                     }
                  }
               }
            }
         }
         return true;
      }
      
      public static function isSplashRawDamage(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 1123)
         {
            if(_loc2_ != 1124)
            {
               if(_loc2_ != 1125)
               {
                  if(_loc2_ != 1126)
                  {
                     if(_loc2_ != 1127)
                     {
                        if(_loc2_ != 1128)
                        {
                           return false;
                        }
                     }
                  }
               }
            }
         }
         return true;
      }
      
      public static function isSplashHeal(param1:int) : Boolean
      {
         if(param1 == 2020)
         {
            return true;
         }
         return false;
      }
      
      public static function isBasedOnMovementPoints(param1:int) : Boolean
      {
         if(param1 == 1012 || param1 == 1013 || param1 == 1016 || param1 == 1015 || param1 == 1014)
         {
            return true;
         }
         return false;
      }
      
      public static function isBasedOnTargetLifePercent(param1:int) : Boolean
      {
         if(param1 == 1071 || param1 == 1068 || param1 == 1070 || param1 == 1067 || param1 == 1069 || param1 == 1048)
         {
            return true;
         }
         return false;
      }
      
      public static function isBasedOnTargetLife(param1:int) : Boolean
      {
         if((ActionIdHelper.isBasedOnTargetLifePercent(param1) || ActionIdHelper.isBasedOnTargetMaxLife(param1) || ActionIdHelper.isBasedOnTargetLifeMissingMaxLife(param1)) == true)
         {
            return true;
         }
         return false;
      }
      
      public static function isBasedOnTargetMaxLife(param1:int) : Boolean
      {
         return param1 == 1109;
      }
      
      public static function isBasedOnTargetLifeMissingMaxLife(param1:int) : Boolean
      {
         if(param1 == 1092 || param1 == 1095 || param1 == 1096 || param1 == 1093 || param1 == 1094)
         {
            return true;
         }
         return false;
      }
      
      public static function isBoostable(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = param1;
         if(_loc3_ != 80)
         {
            if(_loc3_ != 82)
            {
               if(_loc3_ != 144)
               {
                  if(_loc3_ != 1063)
                  {
                     if(_loc3_ != 1064)
                     {
                        if(_loc3_ != 1065)
                        {
                           if(_loc3_ != 1066)
                           {
                              _loc2_ = ActionIdHelper.isBasedOnCasterLife(param1) || ActionIdHelper.isBasedOnTargetLife(param1) || ActionIdHelper.isSplash(param1);
                              if(_loc2_ == true)
                              {
                                 return false;
                              }
                              return true;
                           }
                        }
                     }
                  }
               }
            }
         }
         return false;
      }
      
      public static function isLifeSteal(param1:int) : Boolean
      {
         if(param1 == 95 || param1 == 82 || param1 == 92 || param1 == 94 || param1 == 91 || param1 == 93)
         {
            return true;
         }
         return false;
      }
      
      public static function isHeal(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 81)
         {
            if(_loc2_ != 90)
            {
               if(_loc2_ != 108)
               {
                  if(_loc2_ != 143)
                  {
                     if(_loc2_ != 407)
                     {
                        if(_loc2_ != 786)
                        {
                           if(_loc2_ != 1037)
                           {
                              if(_loc2_ != 1109)
                              {
                                 if(_loc2_ != 2020)
                                 {
                                    return false;
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         return true;
      }
      
      public static function isShield(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 1020)
         {
            if(_loc2_ != 1039)
            {
               if(_loc2_ != 1040)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function isStatBoost(param1:int) : Boolean
      {
         switch(param1)
         {
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return false;
            case 266:
            default:
            case 268:
            case 269:
            case 270:
            case 271:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            case 414:
               return true;
         }
      }
      
      public static function statBoostToStatName(param1:int) : String
      {
         switch(param1)
         {
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return null;
            case 266:
            default:
               return "chance";
            case 268:
               return "agility";
            case 269:
               return "intelligence";
            case 270:
               return "wisdom";
            case 271:
               return "strength";
         }
      }
      
      public static function statBoostToBuffActionId(param1:int) : int
      {
         switch(param1)
         {
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return 0;
            case 266:
            default:
               return 123;
            case 268:
               return 119;
            case 269:
               return 126;
            case 270:
               return 124;
            case 271:
               return 118;
         }
      }
      
      public static function statBoostToDebuffActionId(param1:int) : int
      {
         switch(param1)
         {
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
            default:
               return -1;
            case 266:
            default:
               return 152;
            case 268:
               return 154;
            case 269:
               return 155;
            case 270:
               return 156;
            case 271:
               return 157;
         }
      }
      
      public static function isDamage(param1:int) : Boolean
      {
         if(param1 == 2)
         {
            return true;
         }
         return false;
      }
      
      public static function isPush(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 5)
         {
            if(_loc2_ != 1021)
            {
               if(_loc2_ != 1041)
               {
                  if(_loc2_ != 1103)
                  {
                     return false;
                  }
               }
            }
         }
         return true;
      }
      
      public static function isPull(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 6)
         {
            if(_loc2_ != 1022)
            {
               if(_loc2_ != 1042)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function isForcedDrag(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 1021)
         {
            if(_loc2_ != 1022)
            {
               return false;
            }
         }
         return true;
      }
      
      public static function isDrag(param1:int) : Boolean
      {
         if(!ActionIdHelper.isPush(param1))
         {
            return Boolean(ActionIdHelper.isPull(param1));
         }
         return true;
      }
      
      public static function allowCollisionDamages(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 5)
         {
            if(_loc2_ != 1041)
            {
               return false;
            }
         }
         return true;
      }
      
      public static function getSplashFinalTakenDamageElement(param1:int) : int
      {
         switch(param1)
         {
            case 0:
               return 1224;
            case 1:
               return 1228;
            case 2:
               return 1226;
            case 3:
               return 1227;
            case 4:
               return 1225;
         }
      }
      
      public static function getSplashRawTakenDamageElement(param1:int) : int
      {
         switch(param1)
         {
            case 0:
               return 1124;
            case 1:
               return 1128;
            case 2:
               return 1126;
            case 3:
               return 1127;
            case 4:
               return 1125;
         }
      }
      
      public static function isFakeDamage(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 90)
         {
            if(_loc2_ != 1047)
            {
               if(_loc2_ != 1048)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function isSpellExecution(param1:int) : Boolean
      {
         if(param1 == 1160 || param1 == 2160 || param1 == 1019 || param1 == 1018 || param1 == 792 || param1 == 2792 || param1 == 2794 || param1 == 2795 || param1 == 1017 || param1 == 2017 || param1 == 793 || param1 == 2793)
         {
            return true;
         }
         return false;
      }
      
      public static function isTeleport(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = param1;
         if(_loc3_ != 4)
         {
            if(_loc3_ != 1099)
            {
               if(_loc3_ != 1100)
               {
                  if(_loc3_ != 1101)
                  {
                     if(_loc3_ != 1104)
                     {
                        if(_loc3_ != 1105)
                        {
                           if(_loc3_ != 1106)
                           {
                              _loc2_ = ActionIdHelper.isExchange(param1);
                              if(_loc2_ == true)
                              {
                                 return true;
                              }
                              return false;
                           }
                        }
                     }
                  }
               }
            }
         }
         return true;
      }
      
      public static function isExchange(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 8)
         {
            if(_loc2_ != 1023)
            {
               return false;
            }
         }
         return true;
      }
      
      public static function canTeleportOverBreedSwitchPos(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 4)
         {
            if(_loc2_ != 8)
            {
               if(_loc2_ != 1023)
               {
                  return false;
               }
            }
         }
         return true;
      }
      
      public static function allowAOEMalus(param1:int) : Boolean
      {
         true;
         if(ActionIdHelper.isShield(param1))
         {
            return false;
         }
         return true;
      }
      
      public static function canTriggerHealMultiplier(param1:int) : Boolean
      {
         if(param1 == 90)
         {
            return false;
         }
         return true;
      }
      
      public static function canTriggerDamageMultiplier(param1:int) : Boolean
      {
         if(param1 == 90)
         {
            return false;
         }
         return true;
      }
      
      public static function canTriggerOnHeal(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 90)
         {
            if(_loc2_ != 786)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function canTriggerOnDamage(param1:int) : Boolean
      {
         if(param1 == 1048)
         {
            return false;
         }
         return true;
      }
      
      public static function StatToBuffPercentActionIds(param1:String) : Object
      {
         var _loc2_:int = -1;
         var _loc3_:int = -1;
         var _loc4_:String = param1;
         if(_loc4_ == "actionPoints")
         {
            _loc2_ = 2846;
            _loc3_ = 2847;
         }
         else if(_loc4_ == "agility")
         {
            _loc2_ = 2836;
            _loc3_ = 2837;
         }
         else if(_loc4_ == "chance")
         {
            _loc2_ = 2840;
            _loc3_ = 2841;
         }
         else if(_loc4_ == "intelligence")
         {
            _loc2_ = 2838;
            _loc3_ = 2839;
         }
         else
         {
            if(_loc4_ != "maxMouvementPoints")
            {
               if(_loc4_ != "movementPoints")
               {
                  if(_loc4_ == "strength")
                  {
                     _loc2_ = 2834;
                     _loc3_ = 2835;
                  }
                  else if(_loc4_ == "vitality")
                  {
                     _loc2_ = 2844;
                     _loc3_ = 2845;
                  }
                  else if(_loc4_ == "wisdom")
                  {
                     _loc2_ = 2842;
                     _loc3_ = 2843;
                  }
               }
            }
            _loc2_ = 2848;
            _loc3_ = 2848;
         }
         return {
            "buffId":_loc2_,
            "debuffId":_loc3_,
            "isLinear":false
         };
      }
      
      public static function StatToBuffActionIds(param1:String) : Object
      {
         var _loc2_:int = -1;
         var _loc3_:int = -1;
         var _loc4_:Boolean = true;
         var _loc5_:String = param1;
         if(_loc5_ == "actionPoints")
         {
            _loc2_ = 111;
            _loc3_ = 168;
         }
         else if(_loc5_ == "agility")
         {
            _loc2_ = 119;
            _loc3_ = 154;
         }
         else if(_loc5_ == "airDamageBonus")
         {
            _loc2_ = 428;
            _loc3_ = 429;
         }
         else if(_loc5_ == "airElementReduction")
         {
            _loc2_ = 242;
            _loc3_ = 247;
         }
         else if(_loc5_ == "airElementResistPercent")
         {
            _loc2_ = 212;
            _loc3_ = 217;
            _loc4_ = false;
         }
         else if(_loc5_ == "allDamagesBonus")
         {
            _loc2_ = 112;
            _loc3_ = 145;
         }
         else if(_loc5_ == "bombCombo")
         {
            _loc2_ = 1027;
            _loc3_ = -1;
         }
         else if(_loc5_ == "chance")
         {
            _loc2_ = 123;
            _loc3_ = 152;
         }
         else if(_loc5_ == "criticalDamageBonus")
         {
            _loc2_ = 418;
            _loc3_ = 419;
         }
         else if(_loc5_ == "criticalDamageReduction")
         {
            _loc2_ = 420;
            _loc3_ = 421;
         }
         else if(_loc5_ == "damagesBonusPercent")
         {
            _loc2_ = 138;
            _loc3_ = 186;
         }
         else if(_loc5_ == "dealtDamagesMultiplicator")
         {
            _loc2_ = 1171;
            _loc3_ = 1172;
            _loc4_ = true;
         }
         else if(_loc5_ == "earthDamageBonus")
         {
            _loc2_ = 422;
            _loc3_ = 423;
         }
         else if(_loc5_ == "earthElementReduction")
         {
            _loc2_ = 240;
            _loc3_ = 245;
         }
         else if(_loc5_ == "earthElementResistPercent")
         {
            _loc2_ = 210;
            _loc3_ = 215;
            _loc4_ = false;
         }
         else if(_loc5_ == "fireDamageBonus")
         {
            _loc2_ = 424;
            _loc3_ = 425;
         }
         else if(_loc5_ == "fireElementReduction")
         {
            _loc2_ = 243;
            _loc3_ = 248;
         }
         else if(_loc5_ == "fireElementResistPercent")
         {
            _loc2_ = 213;
            _loc3_ = 218;
            _loc4_ = false;
         }
         else if(_loc5_ == "glyphPower")
         {
            _loc2_ = 1166;
            _loc3_ = -1;
         }
         else if(_loc5_ == "healBonus")
         {
            _loc2_ = 178;
            _loc3_ = 179;
         }
         else if(_loc5_ == "intelligence")
         {
            _loc2_ = 126;
            _loc3_ = 155;
         }
         else if(_loc5_ == "maxLifePoints")
         {
            _loc2_ = 110;
            _loc3_ = -1;
         }
         else if(_loc5_ == "meleeDamageDonePercent")
         {
            _loc2_ = 2800;
            _loc3_ = 2801;
            _loc4_ = true;
         }
         else if(_loc5_ == "meleeDamageReceivedPercent")
         {
            _loc2_ = 2802;
            _loc3_ = 2803;
            _loc4_ = false;
         }
         else
         {
            if(_loc5_ != "maxMouvementPoints")
            {
               if(_loc5_ != "movementPoints")
               {
                  if(_loc5_ == "neutralDamageBonus")
                  {
                     _loc2_ = 430;
                     _loc3_ = 431;
                  }
                  else if(_loc5_ == "neutralElementReduction")
                  {
                     _loc2_ = 244;
                     _loc3_ = 249;
                  }
                  else if(_loc5_ == "neutralElementResistPercent")
                  {
                     _loc2_ = 214;
                     _loc3_ = 219;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "percentResist")
                  {
                     _loc2_ = 1076;
                     _loc3_ = 1077;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "pushDamageBonus")
                  {
                     _loc2_ = 414;
                     _loc3_ = 415;
                  }
                  else if(_loc5_ == "pushDamageFixedResist")
                  {
                     _loc2_ = 416;
                     _loc3_ = 417;
                  }
                  else if(_loc5_ == "pvpAirElementPercentResist")
                  {
                     _loc2_ = 252;
                     _loc3_ = 257;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "pvpAirElementReduction")
                  {
                     _loc2_ = 262;
                     _loc3_ = -1;
                  }
                  else if(_loc5_ == "pvpEarthElementPercentResist")
                  {
                     _loc2_ = 250;
                     _loc3_ = 255;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "pvpEarthElementReduction")
                  {
                     _loc2_ = 260;
                     _loc3_ = -1;
                  }
                  else if(_loc5_ == "pvpFireElementReduction")
                  {
                     _loc2_ = 263;
                     _loc3_ = -1;
                  }
                  else if(_loc5_ == "pvpFireElementResistPercent")
                  {
                     _loc2_ = 253;
                     _loc3_ = 258;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "pvpNeutralElementPercentResist")
                  {
                     _loc2_ = 254;
                     _loc3_ = 259;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "pvpNeutralElementReduction")
                  {
                     _loc2_ = 264;
                     _loc3_ = -1;
                  }
                  else if(_loc5_ == "pvpWaterElementPercentResist")
                  {
                     _loc2_ = 251;
                     _loc3_ = 256;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "pvpWaterElementReduction")
                  {
                     _loc2_ = 261;
                     _loc3_ = -1;
                  }
                  else if(_loc5_ == "rangedDamageDonePercent")
                  {
                     _loc2_ = 2804;
                     _loc3_ = 2805;
                     _loc4_ = true;
                  }
                  else if(_loc5_ == "rangedDamageReceivedPercent")
                  {
                     _loc2_ = 2806;
                     _loc3_ = 2807;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "runePower")
                  {
                     _loc2_ = 1167;
                     _loc3_ = -1;
                  }
                  else if(_loc5_ == "shieldPoints")
                  {
                     _loc2_ = 1040;
                     _loc3_ = -1;
                  }
                  else if(_loc5_ == "spellDamageDonePercent")
                  {
                     _loc2_ = 2812;
                     _loc3_ = 2813;
                     _loc4_ = true;
                  }
                  else if(_loc5_ == "spellDamageReceivedPercent")
                  {
                     _loc2_ = 2814;
                     _loc3_ = 2815;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "spellPercentDamages")
                  {
                     _loc2_ = 1054;
                     _loc3_ = -1;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "strength")
                  {
                     _loc2_ = 118;
                     _loc3_ = 157;
                  }
                  else if(_loc5_ == "trapBonus")
                  {
                     _loc2_ = 225;
                     _loc3_ = -1;
                  }
                  else if(_loc5_ == "trapBonusPercent")
                  {
                     _loc2_ = 226;
                     _loc3_ = -1;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "vitality")
                  {
                     _loc2_ = 125;
                     _loc3_ = 153;
                  }
                  else if(_loc5_ == "waterDamageBonus")
                  {
                     _loc2_ = 426;
                     _loc3_ = 427;
                  }
                  else if(_loc5_ == "waterElementReduction")
                  {
                     _loc2_ = 241;
                     _loc3_ = 246;
                  }
                  else if(_loc5_ == "waterElementResistPercent")
                  {
                     _loc2_ = 211;
                     _loc3_ = 216;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "weaponDamageDonePercent")
                  {
                     _loc2_ = 2808;
                     _loc3_ = 2809;
                     _loc4_ = true;
                  }
                  else if(_loc5_ == "weaponDamageReceivedPercent")
                  {
                     _loc2_ = 2810;
                     _loc3_ = 2811;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "weaponDamagesBonusPercent")
                  {
                     _loc2_ = 165;
                     _loc3_ = -1;
                     _loc4_ = false;
                  }
                  else if(_loc5_ == "weaponPower")
                  {
                     _loc2_ = 1144;
                     _loc3_ = -1;
                  }
                  else if(_loc5_ == "wisdom")
                  {
                     _loc2_ = 124;
                     _loc3_ = 156;
                  }
                  else
                  {
                     _loc2_ = -1;
                     _loc3_ = -1;
                  }
               }
            }
            _loc2_ = 128;
            _loc3_ = 128;
         }
         return {
            "buffId":_loc2_,
            "debuffId":_loc3_,
            "isLinear":_loc4_
         };
      }
      
      public static function isBuff(param1:int) : Boolean
      {
         if((int(ActionIdHelper.STAT_BUFF_ACTION_IDS.indexOf(param1)) != -1 || int(ActionIdHelper.STAT_DEBUFF_ACTION_IDS.indexOf(param1)) != -1) && !ActionIdHelper.isShield(param1))
         {
            return true;
         }
         return false;
      }
      
      public static function isPositiveBoost(param1:int) : Boolean
      {
         return int(ActionIdHelper.STAT_BUFF_ACTION_IDS.indexOf(param1)) != -1;
      }
      
      public static function isNegativeBoost(param1:int) : Boolean
      {
         return int(ActionIdHelper.STAT_DEBUFF_ACTION_IDS.indexOf(param1)) != -1;
      }
      
      public static function getActionIdStatName(param1:int) : String
      {
         return ActionIdHelper.actionIdToStatNameMap.h[param1];
      }
      
      public static function spellExecutionHasGlobalLimitation(param1:int) : Boolean
      {
         var _loc2_:int = param1;
         if(_loc2_ != 2017)
         {
            if(_loc2_ != 2160)
            {
               if(_loc2_ != 2792)
               {
                  if(_loc2_ != 2793)
                  {
                     if(_loc2_ != 2795)
                     {
                        return false;
                     }
                  }
               }
            }
         }
         return true;
      }
   }
}
