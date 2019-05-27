package spin.proxy
{
   public final class DisconnectionReason
   {
      
      public static const AUTHENTICATION_ERROR:int = 1;
      
      public static const INACTIVITY:int = 2;
      
      public static const CLOSED_BY_SERVER:int = 3;
      
      public static const RECONNECTION_WITH_SAME_USER:int = 4;
      
      public static const NO_VERSION:int = 5;
      
      public static const UNSUPPORTED_SPIN_VERSION:int = 6;
      
      public static const UNSUPPORTED_APP_VERSION:int = 7;
      
      public static const CONNECTION_WITH_THIS_USER_ALREADY_EXISTS:int = 8;
      
      public static const UNKNOWN:int = 999;
       
      
      public function DisconnectionReason()
      {
         super();
      }
   }
}
