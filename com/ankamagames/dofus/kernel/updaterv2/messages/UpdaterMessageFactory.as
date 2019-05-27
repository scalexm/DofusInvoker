package com.ankamagames.dofus.kernel.updaterv2.messages
{
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.ApiTokenMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.ErrorMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.impl.SystemConfigurationMessage;
   
   public class UpdaterMessageFactory
   {
       
      
      public function UpdaterMessageFactory()
      {
         super();
      }
      
      public static function getUpdaterMessage(msg:Object) : IUpdaterInputMessage
      {
         var uim:IUpdaterInputMessage = null;
         switch(msg["_msg_id"])
         {
            case UpdaterMessageIDEnum.ERROR_MESSAGE:
               uim = new ErrorMessage();
               break;
            case UpdaterMessageIDEnum.SYSTEM_CONFIGURATION:
               uim = new SystemConfigurationMessage();
               break;
            case UpdaterMessageIDEnum.API_TOKEN:
               uim = new ApiTokenMessage();
         }
         if(uim)
         {
            uim.deserialize(msg);
         }
         return uim;
      }
   }
}
