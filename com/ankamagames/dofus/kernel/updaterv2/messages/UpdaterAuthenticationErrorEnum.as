package com.ankamagames.dofus.kernel.updaterv2.messages
{
   public class UpdaterAuthenticationErrorEnum
   {
      
      public static const NO_ERROR:int = 0;
      
      public static const AUTHENTICATION_FAILED:int = 1;
      
      public static const AUTHENTICATION_DECLINED:int = 2;
      
      public static const AUTHENTICATION_REQUIRED:int = 3;
      
      public static const ACCOUNT_BANNED:int = 4;
      
      public static const ACCOUNT_LOCKED:int = 5;
      
      public static const ACCOUNT_DELETED:int = 6;
      
      public static const IP_BLACKLISTED:int = 7;
      
      public static const SERVER_UNREACHABLE:int = 8;
      
      public static const UNKONWN_ERROR:int = 9;
       
      
      public function UpdaterAuthenticationErrorEnum()
      {
         super();
      }
   }
}
