package com.ankamagames.dofus.logic.game.common.actions.chat
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class SaveMessageAction implements Action
   {
       
      
      public var content:String;
      
      public var channel:uint;
      
      public var timestamp:Number;
      
      public function SaveMessageAction()
      {
         super();
      }
      
      public static function create(msg:String, channel:uint, timestamp:Number) : SaveMessageAction
      {
         var a:SaveMessageAction = new SaveMessageAction();
         a.content = msg;
         a.channel = channel;
         a.timestamp = timestamp;
         return a;
      }
   }
}
