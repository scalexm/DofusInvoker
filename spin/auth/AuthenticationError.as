package spin.auth
{
   public final class AuthenticationError
   {
      
      public static const TIMEOUT:int = 1;
      
      public static const NON_AUTH_MESSAGE:int = 2;
      
      public static const CREDENTIALS_MISMATCH:int = 10;
      
      public static const DUPLICATE_USER:int = 11;
      
      public static const NO_VALID_SUBSCRIPTION:int = 12;
      
      public static const NO_ADMIN_RIGHTS:int = 13;
      
      public static const ACCOUNT_BLOCKED:int = 14;
      
      public static const ACCOUNT_BANNED:int = 15;
      
      public static const IP_ADDR_REFUSED:int = 16;
      
      public static const OTP_REQUIRED:int = 17;
      
      public static const CLOSED_BETA_ACCESS_REQUIRED:int = 18;
      
      public static const ACCOUNT_REFUSED_FOR_OTHER_REASON:int = 19;
      
      public static const INTERNAL_ERROR:int = 999;
       
      
      public function AuthenticationError()
      {
         super();
      }
   }
}
