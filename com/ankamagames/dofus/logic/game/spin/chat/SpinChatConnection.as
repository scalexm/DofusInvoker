package com.ankamagames.dofus.logic.game.spin.chat
{
   import com.ankama.chat.AcceptInvite;
   import com.ankama.chat.AddGroup;
   import com.ankama.chat.CancelInvite;
   import com.ankama.chat.Connect;
   import com.ankama.chat.Connected;
   import com.ankama.chat.DeleteGroup;
   import com.ankama.chat.Disconnect;
   import com.ankama.chat.Disconnected;
   import com.ankama.chat.EndpointOccupation;
   import com.ankama.chat.EndpointOccupations;
   import com.ankama.chat.Friend;
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
   import com.ankama.chat.UserOccupation;
   import com.ankama.chat.UserPresence;
   import com.ankamagames.berilia.managers.KernelEventsManager;
   import com.ankamagames.dofus.misc.lists.SpinChatHookList;
   import com.ankamagames.dofus.misc.utils.GameID;
   import com.ankamagames.dofus.misc.utils.HaapiKeyManager;
   import com.ankamagames.dofus.misc.utils.events.TokenReadyEvent;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.network.SpinConnection;
   import com.ankamagames.jerakine.utils.spin.VersionUtils;
   import com.netease.protobuf.Message;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class SpinChatConnection extends SpinConnection
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(SpinChatConnection));
      
      private static const CHAT_SERVICE:String = "zaap:chat";
       
      
      private var _me:SpinChatFriend;
      
      private var _friends:Dictionary;
      
      private var _groups:Dictionary;
      
      private var _ignored:Vector.<String>;
      
      private var _incomingInvites:Vector.<String>;
      
      private var _outcomingInvites:Vector.<String>;
      
      private var _connected:Boolean = false;
      
      public function SpinChatConnection()
      {
         super(ChatProtocol.messageTypes,VersionUtils.toVersion("0.2.0"),XmlConfig.getInstance().getEntry("config.spin.chat.host"),XmlConfig.getInstance().getEntry("config.spin.chat.port"));
      }
      
      private static function dispatchMessage(user:String, message:String) : void
      {
         KernelEventsManager.getInstance().processCallback(SpinChatHookList.SpinChatMessage,user,message);
      }
      
      private static function dispatchInviteAccepted(user:String, incoming:Boolean) : void
      {
         KernelEventsManager.getInstance().processCallback(SpinChatHookList.SpinChatInviteAccepted,user,incoming);
      }
      
      private static function dispatchInviteRefused(user:String, incoming:Boolean) : void
      {
         KernelEventsManager.getInstance().processCallback(SpinChatHookList.SpinChatInviteRefused,user,incoming);
      }
      
      private static function dispatchInviteCancelled(user:String, incoming:Boolean) : void
      {
         KernelEventsManager.getInstance().processCallback(SpinChatHookList.SpinChatInviteCancelled,user,incoming);
      }
      
      private static function dispatchConnected() : void
      {
         KernelEventsManager.getInstance().processCallback(SpinChatHookList.SpinChatConnected);
      }
      
      private static function dispatchDisconnected() : void
      {
         KernelEventsManager.getInstance().processCallback(SpinChatHookList.SpinChatDisconnected);
      }
      
      override protected function onAuthenticated() : void
      {
         this._outcomingInvites = new Vector.<String>();
         this._incomingInvites = new Vector.<String>();
         this._friends = new Dictionary();
         this._groups = new Dictionary();
         this._ignored = new Vector.<String>();
         this._me = new SpinChatFriend(_nickname);
         this._me.occupation = UserOccupation.Available;
         send(new Connect(),CHAT_SERVICE);
         send(new QueryRoster(),CHAT_SERVICE);
      }
      
      override protected function onDisconnected() : void
      {
         if(this._connected)
         {
            this._connected = false;
            this._me.occupation = UserOccupation.OffLine;
            this.dispatchUpdatedStatus();
            dispatchDisconnected();
         }
      }
      
      override public function disconnect() : void
      {
         if(this._connected)
         {
            send(new Disconnect(),CHAT_SERVICE);
         }
         super.disconnect();
      }
      
      override protected function requestAuthDetails() : void
      {
         switch(_selectedScheme)
         {
            case TOKEN:
               HaapiKeyManager.getInstance().addEventListener(TokenReadyEvent.READY,this.onTokenReady);
               HaapiKeyManager.getInstance().askToken(GameID.CHAT);
               break;
            case SIMPLE:
            case LOGIN_PASSWORD:
         }
      }
      
      private function onTokenReady(event:TokenReadyEvent) : void
      {
         if(event.gameId == GameID.CHAT)
         {
            HaapiKeyManager.getInstance().removeEventListener(TokenReadyEvent.READY,this.onTokenReady);
            onAuthDetailsReady();
         }
      }
      
      override protected function getAuthDetails() : Array
      {
         switch(_selectedScheme)
         {
            case TOKEN:
               return [HaapiKeyManager.getInstance().pullToken(GameID.CHAT)];
            case SIMPLE:
            case LOGIN_PASSWORD:
               return null;
            default:
               return null;
         }
      }
      
      public function setUserPresence(occupation:int) : void
      {
         if(!this._connected)
         {
            return;
         }
         if(occupation == this._me.occupation)
         {
            return;
         }
         if(occupation == UserOccupation.OffLine)
         {
            this.disconnect();
            return;
         }
         var setUserOccupation:SetUserOccupation = new SetUserOccupation();
         setUserOccupation.occupation = occupation;
         send(setUserOccupation,CHAT_SERVICE);
      }
      
      public function setEndPointOccupation(occupation:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         if(occupation == this._me.endOccupations[GameID.current])
         {
            return;
         }
         var setEndpointOccupation:SetEndpointOccupation = new SetEndpointOccupation();
         setEndpointOccupation.occupation = new EndpointOccupation();
         setEndpointOccupation.occupation.appId = GameID.current;
         setEndpointOccupation.occupation.occupation = occupation;
         send(setEndpointOccupation,CHAT_SERVICE);
      }
      
      public function invite(user:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         var friend:SpinChatFriend = this._friends[user];
         if(friend)
         {
            return;
         }
         var sendInvite:SendInvite = new SendInvite();
         sendInvite.toUser = user;
         send(sendInvite,CHAT_SERVICE);
      }
      
      public function acceptInvite(user:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         var index:Number = this._incomingInvites.indexOf(user);
         if(index == -1)
         {
            return;
         }
         var acceptInvite:AcceptInvite = new AcceptInvite();
         acceptInvite.fromUser = user;
         send(acceptInvite,CHAT_SERVICE);
      }
      
      public function rejectInvite(user:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         var index:Number = this._incomingInvites.indexOf(user);
         if(index == -1)
         {
            return;
         }
         var rejectInvite:RejectInvite = new RejectInvite();
         rejectInvite.fromUser = user;
         send(rejectInvite,CHAT_SERVICE);
      }
      
      public function cancelInvite(user:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         var index:Number = this._outcomingInvites.indexOf(user);
         if(index == -1)
         {
            return;
         }
         var cancelInvite:CancelInvite = new CancelInvite();
         cancelInvite.toUser = user;
         send(cancelInvite,CHAT_SERVICE);
      }
      
      public function removeFriend(user:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         var friend:SpinChatFriend = this._friends[user];
         if(!friend)
         {
            return;
         }
         var removeFriend:RemoveFriend = new RemoveFriend();
         removeFriend.friend = user;
         send(removeFriend,CHAT_SERVICE);
      }
      
      public function setFriendGroup(user:String, group:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         var friend:SpinChatFriend = this._friends[user];
         if(!friend)
         {
            return;
         }
         var members:Vector.<SpinChatFriend> = this._groups[group];
         if(!members)
         {
            return;
         }
         var index:Number = members.indexOf(friend);
         if(index != -1)
         {
            return;
         }
         var setFriendGroup:SetFriendGroup = new SetFriendGroup();
         setFriendGroup.friend = user;
         setFriendGroup.group = group;
         send(setFriendGroup,CHAT_SERVICE);
      }
      
      public function addGroup(group:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         if(this._groups[group])
         {
            return;
         }
         var addGroup:AddGroup = new AddGroup();
         addGroup.group = group;
         send(addGroup,CHAT_SERVICE);
      }
      
      public function deleteGroup(group:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         if(!this._groups[group])
         {
            return;
         }
         var deleteGroup:DeleteGroup = new DeleteGroup();
         deleteGroup.group = group;
         send(deleteGroup,CHAT_SERVICE);
      }
      
      public function setAlias(user:String, alias:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         var friend:SpinChatFriend = this._friends[user];
         if(!friend)
         {
            return;
         }
         if(friend.alias == alias)
         {
            return;
         }
         var setFriendAlias:SetFriendAlias = new SetFriendAlias();
         setFriendAlias.friend = user;
         setFriendAlias.alias = alias;
         send(setFriendAlias,CHAT_SERVICE);
      }
      
      public function ignore(user:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         var friend:SpinChatFriend = this._friends[user];
         var index:Number = this._incomingInvites.indexOf(user);
         if(!friend && index == -1)
         {
            return;
         }
         var setIgnore:SetIgnore = new SetIgnore();
         setIgnore.user = user;
         setIgnore.ignore = true;
         send(setIgnore,CHAT_SERVICE);
      }
      
      public function sendMessage(toUser:String, message:String) : void
      {
         if(!this._connected)
         {
            return;
         }
         if(!message)
         {
            return;
         }
         var friend:SpinChatFriend = this._friends[toUser];
         if(!friend)
         {
            return;
         }
         var tellUser:TellUser = new TellUser();
         tellUser.targetUser = toUser;
         tellUser.message = message;
         send(tellUser,CHAT_SERVICE);
      }
      
      override protected function onMessage(msg:Message) : void
      {
         var roster:Roster = null;
         var userPresence:UserPresence = null;
         var endpointOccupations:EndpointOccupations = null;
         var endpointOccupation:EndpointOccupation = null;
         var friendAliasSet:FriendAliasSet = null;
         var ignoreSet:IgnoreSet = null;
         var friendRemoved:FriendRemoved = null;
         var friendGroupSet:FriendGroupSet = null;
         var friendGroupSetFriend:SpinChatFriend = null;
         var groupAdded:GroupAdded = null;
         var groupDeleted:GroupDeleted = null;
         var inviteSent:InviteSent = null;
         var inviteAccepted:InviteAccepted = null;
         var newFriend:String = null;
         var inviteRejected:InviteRejected = null;
         var rejectedUser:String = null;
         var inviteCancelled:InviteCancelled = null;
         var cancelledUser:String = null;
         var userMessage:UserMessage = null;
         var group:String = null;
         var friend:Friend = null;
         var chatFriend:SpinChatFriend = null;
         var invite:InviteSent = null;
         var ignoredIndex:Number = NaN;
         super.onMessage(msg);
         switch(true)
         {
            case msg is Connected:
               this._connected = true;
               _log.info("Connected to the Chat server");
               dispatchConnected();
               break;
            case msg is Disconnected:
               tryReconnect();
               break;
            case msg is Roster:
               roster = msg as Roster;
               for each(group in roster.groups)
               {
                  this.getGroup(group);
               }
               for each(friend in roster.friends)
               {
                  chatFriend = this.getFriend(friend.user);
                  chatFriend.alias = friend.alias;
                  if(friend.group)
                  {
                     this.addToGroup(chatFriend,friend.group);
                  }
               }
               this.dispatchUpdatedContacts();
               for each(invite in roster.invites)
               {
                  if(invite.fromUser == _nickname)
                  {
                     this._outcomingInvites.push(invite.toUser);
                  }
                  else
                  {
                     this._incomingInvites.push(invite.fromUser);
                  }
               }
               if(this._outcomingInvites.length > 0 || this._incomingInvites.length > 0)
               {
                  this.dispatchUpdatedInvites();
                  break;
               }
               break;
            case msg is UserPresence:
               userPresence = msg as UserPresence;
               if(this.isMe(userPresence.user))
               {
                  this._me.occupation = userPresence.occupation;
                  this.dispatchUpdatedStatus();
                  break;
               }
               this.getFriend(userPresence.user).occupation = userPresence.occupation;
               this.dispatchUpdatedContacts();
               if(userPresence.occupation == UserOccupation.OffLine)
               {
                  if(this.deleteInvitesWith(userPresence.user))
                  {
                     this.dispatchUpdatedInvites();
                     break;
                  }
                  break;
               }
               break;
            case msg is EndpointOccupations:
               endpointOccupations = msg as EndpointOccupations;
               if(this.isMe(endpointOccupations.user))
               {
                  for each(endpointOccupation in endpointOccupations.occupations)
                  {
                     this._me.endOccupations[endpointOccupation.appId] = endpointOccupation.occupation;
                  }
                  this.dispatchUpdatedStatus();
                  break;
               }
               for each(endpointOccupation in endpointOccupations.occupations)
               {
                  this.getFriend(endpointOccupations.user).endOccupations[endpointOccupation.appId] = endpointOccupation.occupation;
               }
               this.dispatchUpdatedContacts();
               break;
            case msg is FriendAliasSet:
               friendAliasSet = msg as FriendAliasSet;
               this.getFriend(friendAliasSet.friend).alias = friendAliasSet.alias;
               this.dispatchUpdatedContacts();
               break;
            case msg is IgnoreSet:
               ignoreSet = msg as IgnoreSet;
               if(ignoreSet.ignore)
               {
                  this._ignored.push(ignoreSet.user);
                  this.deleteFriend(ignoreSet.user);
                  this.dispatchUpdatedContacts();
                  if(this.deleteInvitesWith(ignoreSet.user))
                  {
                     this.dispatchUpdatedInvites();
                     break;
                  }
                  break;
               }
               ignoredIndex = this._ignored.indexOf(ignoreSet.user);
               if(ignoredIndex != -1)
               {
                  this._ignored.splice(ignoredIndex,1);
                  break;
               }
               break;
            case msg is FriendRemoved:
               friendRemoved = msg as FriendRemoved;
               this.deleteFriend(friendRemoved.friend);
               this.dispatchUpdatedContacts();
               if(this.deleteInvitesWith(friendRemoved.friend))
               {
                  this.dispatchUpdatedInvites();
                  break;
               }
               break;
            case msg is FriendGroupSet:
               friendGroupSet = msg as FriendGroupSet;
               friendGroupSetFriend = this.getFriend(friendGroupSet.friend);
               this.deleteFromGroups(friendGroupSetFriend);
               if(friendGroupSet.group)
               {
                  this.addToGroup(friendGroupSetFriend,friendGroupSet.group);
               }
               this.dispatchUpdatedContacts();
               break;
            case msg is GroupAdded:
               groupAdded = msg as GroupAdded;
               this.getGroup(groupAdded.group);
               this.dispatchUpdatedContacts();
               break;
            case msg is GroupDeleted:
               groupDeleted = msg as GroupDeleted;
               this.removeGroup(groupDeleted.group);
               this.dispatchUpdatedContacts();
               break;
            case msg is InviteSent:
               inviteSent = msg as InviteSent;
               if(inviteSent.fromUser == _nickname)
               {
                  this._outcomingInvites.push(inviteSent.toUser);
               }
               else
               {
                  this._incomingInvites.push(inviteSent.fromUser);
               }
               this.dispatchUpdatedInvites();
               break;
            case msg is InviteAccepted:
               inviteAccepted = msg as InviteAccepted;
               newFriend = inviteAccepted.fromUser == _nickname?inviteAccepted.toUser:inviteAccepted.fromUser;
               this.deleteInvitesWith(newFriend);
               this.dispatchUpdatedInvites();
               this.getFriend(newFriend);
               this.dispatchUpdatedContacts();
               dispatchInviteAccepted(newFriend,inviteAccepted.fromUser != _nickname);
               break;
            case msg is InviteRejected:
               inviteRejected = msg as InviteRejected;
               rejectedUser = inviteRejected.fromUser == _nickname?inviteRejected.toUser:inviteRejected.fromUser;
               this.deleteInvitesWith(rejectedUser);
               this.dispatchUpdatedInvites();
               dispatchInviteRefused(rejectedUser,inviteRejected.fromUser != _nickname);
               break;
            case msg is InviteCancelled:
               inviteCancelled = msg as InviteCancelled;
               cancelledUser = inviteCancelled.fromUser == _nickname?inviteCancelled.toUser:inviteCancelled.fromUser;
               this.deleteInvitesWith(cancelledUser);
               this.dispatchUpdatedInvites();
               dispatchInviteCancelled(rejectedUser,inviteCancelled.fromUser != _nickname);
               break;
            case msg is UserMessage:
               userMessage = msg as UserMessage;
               dispatchMessage(userMessage.fromUser,userMessage.message);
         }
      }
      
      private function dispatchUpdatedStatus() : void
      {
         KernelEventsManager.getInstance().processCallback(SpinChatHookList.SpinChatUpdatedStatus,this._me.occupation,this._me.endOccupations);
      }
      
      private function dispatchUpdatedContacts() : void
      {
         KernelEventsManager.getInstance().processCallback(SpinChatHookList.SpinChatUpdatedContacts,this._friends,this._groups);
      }
      
      private function dispatchUpdatedInvites() : void
      {
         KernelEventsManager.getInstance().processCallback(SpinChatHookList.SpinChatUpdatedInvites,this._incomingInvites,this._outcomingInvites);
      }
      
      private function isMe(user:String) : Boolean
      {
         return this._me.username == user;
      }
      
      private function getFriend(user:String) : SpinChatFriend
      {
         var friend:SpinChatFriend = this._friends[user];
         if(friend == null)
         {
            friend = new SpinChatFriend(user);
            if(this._ignored.indexOf(user) == -1)
            {
               this._friends[user] = friend;
            }
         }
         return friend;
      }
      
      private function getGroup(name:String) : Vector.<SpinChatFriend>
      {
         var group:Vector.<SpinChatFriend> = this._groups[name];
         if(!group)
         {
            group = new Vector.<SpinChatFriend>();
            this._groups[name] = group;
         }
         return group;
      }
      
      private function removeGroup(name:String) : void
      {
         if(this._groups[name] == null)
         {
            return;
         }
         delete this._groups[name];
      }
      
      private function deleteFriend(user:String) : void
      {
         var friend:SpinChatFriend = this._friends[user];
         if(friend == null)
         {
            return;
         }
         delete this._friends[user];
         this.deleteFromGroups(friend);
      }
      
      private function addToGroup(friend:SpinChatFriend, group:String) : void
      {
         if(this._ignored.indexOf(friend.username) == -1)
         {
            this.getGroup(group).push(friend);
         }
      }
      
      private function deleteFromGroup(friend:SpinChatFriend, group:String) : void
      {
         var index:Number = NaN;
         var members:Vector.<SpinChatFriend> = this._groups[group];
         if(members)
         {
            index = members.indexOf(friend);
            if(index != -1)
            {
               members.splice(index,1);
            }
         }
      }
      
      private function deleteFromGroups(friend:SpinChatFriend) : void
      {
         var group:* = null;
         for(group in this._groups)
         {
            this.deleteFromGroup(friend,group);
         }
      }
      
      private function deleteInvitesWith(friend:String) : Boolean
      {
         return this.deleteIncomingInvitesWith(friend) || this.deleteOutcomingInvitesWith(friend);
      }
      
      private function deleteIncomingInvitesWith(friend:String) : Boolean
      {
         var index:Number = this._incomingInvites.indexOf(friend);
         var result:* = index != -1;
         if(result)
         {
            this._incomingInvites.splice(index,1);
         }
         return result;
      }
      
      private function deleteOutcomingInvitesWith(friend:String) : Boolean
      {
         var index:Number = this._outcomingInvites.indexOf(friend);
         var result:* = index != -1;
         if(result)
         {
            this._outcomingInvites.splice(index,1);
         }
         return result;
      }
   }
}
