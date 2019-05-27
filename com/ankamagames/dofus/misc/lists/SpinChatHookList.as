package com.ankamagames.dofus.misc.lists
{
   import com.ankamagames.berilia.types.data.Hook;
   
   public class SpinChatHookList
   {
      
      public static const SpinChatConnected:Hook = new Hook("SpinChatConnected",false);
      
      public static const SpinChatDisconnected:Hook = new Hook("SpinChatDisconnected",false);
      
      public static const SpinChatMessage:Hook = new Hook("SpinChatMessage",false);
      
      public static const SpinChatInviteAccepted:Hook = new Hook("SpinChatInviteAccepted",false);
      
      public static const SpinChatInviteRefused:Hook = new Hook("SpinChatInviteRefused",false);
      
      public static const SpinChatInviteCancelled:Hook = new Hook("SpinChatInviteCancelled",false);
      
      public static const SpinChatUpdatedStatus:Hook = new Hook("SpinChatUpdatedStatus",false);
      
      public static const SpinChatUpdatedContacts:Hook = new Hook("SpinChatUpdatedContacts",false);
      
      public static const SpinChatUpdatedInvites:Hook = new Hook("SpinChatUpdatedInvites",false);
       
      
      public function SpinChatHookList()
      {
         super();
      }
   }
}
