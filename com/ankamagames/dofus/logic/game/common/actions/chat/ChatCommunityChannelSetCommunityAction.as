package com.ankamagames.dofus.logic.game.common.actions.chat
{
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class ChatCommunityChannelSetCommunityAction implements Action
   {
       
      
      public var communityId:int;
      
      public function ChatCommunityChannelSetCommunityAction()
      {
         super();
      }
      
      public static function create(communityId:int) : ChatCommunityChannelSetCommunityAction
      {
         var a:ChatCommunityChannelSetCommunityAction = new ChatCommunityChannelSetCommunityAction();
         a.communityId = communityId;
         return a;
      }
   }
}
