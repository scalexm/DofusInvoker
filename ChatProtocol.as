package
{
   import com.ankama.chat.AcceptInvite;
   import com.ankama.chat.AddGroup;
   import com.ankama.chat.CancelInvite;
   import com.ankama.chat.Connect;
   import com.ankama.chat.Connected;
   import com.ankama.chat.DeleteGroup;
   import com.ankama.chat.Disconnect;
   import com.ankama.chat.Disconnected;
   import com.ankama.chat.EndpointOccupations;
   import com.ankama.chat.FriendAliasSet;
   import com.ankama.chat.FriendGroupSet;
   import com.ankama.chat.FriendRemoved;
   import com.ankama.chat.GroupAdded;
   import com.ankama.chat.GroupDeleted;
   import com.ankama.chat.IgnoreSet;
   import com.ankama.chat.InviteAccepted;
   import com.ankama.chat.InviteCancelled;
   import com.ankama.chat.InviteRejected;
   import com.ankama.chat.InviteSent;
   import com.ankama.chat.QueryRoster;
   import com.ankama.chat.RejectInvite;
   import com.ankama.chat.RemoveFriend;
   import com.ankama.chat.Roster;
   import com.ankama.chat.SendInvite;
   import com.ankama.chat.SetEndpointOccupation;
   import com.ankama.chat.SetFriendAlias;
   import com.ankama.chat.SetFriendGroup;
   import com.ankama.chat.SetIgnore;
   import com.ankama.chat.SetUserOccupation;
   import com.ankama.chat.TellUser;
   import com.ankama.chat.UserMessage;
   import com.ankama.chat.UserOffline;
   import com.ankama.chat.UserPresence;
   import flash.utils.Dictionary;
   
   public class ChatProtocol
   {
      
      private static const _messageTypes:Dictionary = new Dictionary();
      
      {
         _messageTypes["7A488BA3-F666-4487-9BEE-80691B9DDCAB"] = RemoveFriend;
         _messageTypes["FF30F601-7595-4FAE-AC22-75DCB1055B40"] = InviteRejected;
         _messageTypes["6BF6B955-45BF-4DA3-8D14-D0B423697EC1"] = QueryRoster;
         _messageTypes["E03BF99C-3250-456B-9461-28A72C6C997B"] = AddGroup;
         _messageTypes["5357AEEE-99ED-484E-83C8-12E7A80A7788"] = InviteAccepted;
         _messageTypes["759FBAFA-857B-4066-B4CF-CBA1C0346655"] = SetFriendGroup;
         _messageTypes["E1723A7B-E722-454F-8DBE-97E32A7AD5A5"] = GroupDeleted;
         _messageTypes["2C336DE1-5ED9-4A5A-B4AD-20C6F2E03A59"] = TellUser;
         _messageTypes["41748F7D-76EE-4C99-90F8-99F29FFACB20"] = GroupAdded;
         _messageTypes["BE698F93-FF50-4E9B-89C4-B83A1842C385"] = SetEndpointOccupation;
         _messageTypes["8E011A34-FBAB-4CCF-B4C5-12D2066BE645"] = SetUserOccupation;
         _messageTypes["01478CE1-B3B0-4EB6-A32A-C4E8DDE8CDC6"] = UserOffline;
         _messageTypes["5AE817A6-D932-4AA8-BD20-7CD0E331D97F"] = Connect;
         _messageTypes["746AA8D1-5532-4E31-AC81-E93C21E7E83A"] = Roster;
         _messageTypes["B674D72B-2605-4E16-94D4-3E7A497A8D87"] = CancelInvite;
         _messageTypes["A22BE7DC-8178-41FC-BBC2-219691308F05"] = Connected;
         _messageTypes["4A53794A-8764-4346-B687-1B88A3E28424"] = RejectInvite;
         _messageTypes["B110C088-8A5B-4E10-AAC3-47AFBF5ABB41"] = Disconnect;
         _messageTypes["37B6E15A-7B44-4C63-BC56-EA7653890EA1"] = AcceptInvite;
         _messageTypes["A0D6A1AF-1887-4B3F-B593-7C557F924817"] = SetIgnore;
         _messageTypes["5BD9251C-7D19-4A9F-A4C0-E5CED50FF2E0"] = InviteSent;
         _messageTypes["5C91A9CB-8193-4DCA-B3CD-1B37199F34F7"] = UserPresence;
         _messageTypes["D2D1933B-C4CE-40A4-B2E5-A7AEAE09EF55"] = FriendGroupSet;
         _messageTypes["03DAF116-3355-4084-9071-68FC59670E1B"] = FriendRemoved;
         _messageTypes["EC8EB64C-A5BD-4453-981D-4124D45D823E"] = Disconnected;
         _messageTypes["9A4F2F76-4E6F-48AA-9E8C-02C3A50A29DA"] = EndpointOccupations;
         _messageTypes["2BA70431-442D-4E40-AF50-0F08ECB5FF8F"] = UserMessage;
         _messageTypes["40A110DE-7ED6-4E93-9BAC-DD41110DFF7C"] = DeleteGroup;
         _messageTypes["0CC7CDD9-7BE3-40D8-B4CC-E0220B9927D7"] = IgnoreSet;
         _messageTypes["064DBD45-661D-4410-B706-ADF6EB992E65"] = SetFriendAlias;
         _messageTypes["DF6C4BF1-34C0-4E59-871C-2240AE0BA41D"] = SendInvite;
         _messageTypes["5C8E6F81-7F98-4881-B362-A385D775B3DC"] = InviteCancelled;
         _messageTypes["EBA11206-DA39-4E22-9187-B422EF331107"] = FriendAliasSet;
      }
      
      public function ChatProtocol()
      {
         super();
      }
      
      public static function get messageTypes() : Dictionary
      {
         return _messageTypes;
      }
   }
}
