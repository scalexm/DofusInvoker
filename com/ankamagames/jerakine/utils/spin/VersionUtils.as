package com.ankamagames.jerakine.utils.spin
{
   import spin.proxy.VersionsUsed.Version;
   
   public class VersionUtils
   {
       
      
      public function VersionUtils()
      {
         super();
      }
      
      public static function toVersion(version:String) : spin.proxy.VersionsUsed.Version
      {
         var v:com.ankamagames.jerakine.types.Version = new com.ankamagames.jerakine.types.Version(version);
         var result:spin.proxy.VersionsUsed.Version = new spin.proxy.VersionsUsed.Version();
         result.major = v.major;
         result.minor = v.minor;
         result.patch = v.release;
         return result;
      }
   }
}
