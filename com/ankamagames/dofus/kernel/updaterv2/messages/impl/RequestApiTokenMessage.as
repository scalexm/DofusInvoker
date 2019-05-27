package com.ankamagames.dofus.kernel.updaterv2.messages.impl
{
   import com.ankamagames.dofus.kernel.updaterv2.messages.IUpdaterOutputMessage;
   import com.ankamagames.dofus.kernel.updaterv2.messages.UpdaterMessageIDEnum;
   
   public class RequestApiTokenMessage implements IUpdaterOutputMessage
   {
       
      
      private var _gameId:int;
      
      public function RequestApiTokenMessage(gameId:int)
      {
         super();
         this._gameId = gameId;
      }
      
      public function get gameId() : int
      {
         return this._gameId;
      }
      
      public function serialize() : String
      {
         return by.blooddy.crypto.serialization.JSON.encode({
            "_msg_id":UpdaterMessageIDEnum.REQUEST_API_TOKEN,
            "user":"",
            "game_id":this._gameId
         });
      }
   }
}
