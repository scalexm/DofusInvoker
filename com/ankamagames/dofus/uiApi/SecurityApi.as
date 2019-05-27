package com.ankamagames.dofus.uiApi
{
   import com.ankamagames.berilia.interfaces.IApi;
   import com.ankamagames.dofus.logic.shield.SecureModeManager;
   
   public class SecurityApi implements IApi
   {
       
      
      public function SecurityApi()
      {
         super();
      }
      
      [Trusted]
      public function askSecureModeCode(callback:Function) : void
      {
         SecureModeManager.getInstance().askCode(callback);
      }
      
      [Trusted]
      public function sendSecureModeCode(code:String, callback:Function, computerName:String = null) : void
      {
         SecureModeManager.getInstance().computerName = computerName;
         SecureModeManager.getInstance().sendCode(code,callback);
      }
      
      [Trusted]
      public function SecureModeisActive() : Boolean
      {
         return SecureModeManager.getInstance().active;
      }
      
      [Trusted]
      public function setShieldLevel(level:uint) : void
      {
         SecureModeManager.getInstance().shieldLevel = level;
      }
      
      [Trusted]
      public function getShieldLevel() : uint
      {
         return SecureModeManager.getInstance().shieldLevel;
      }
   }
}
