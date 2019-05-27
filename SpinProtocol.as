package
{
   import flash.utils.Dictionary;
   import spin.auth.SelectScheme;
   import spin.auth.Start;
   import spin.auth.sessionRetrieval.Credentials;
   import spin.proxy.Disconnection;
   import spin.proxy.Heartbeat;
   import spin.proxy.Ping;
   import spin.proxy.Pong;
   import spin.proxy.SessionCreationResult;
   import spin.proxy.VersionsUsed;
   
   public class SpinProtocol
   {
      
      private static const _messageTypes:Dictionary = new Dictionary();
      
      {
         _messageTypes["16A34544-1006-4A93-B9F2-E532D48C418C"] = Ping;
         _messageTypes["13716FCF-E66A-439B-9094-10E3DF4A6BE9"] = spin.auth.sessionRetrieval.Credentials;
         _messageTypes["8CB21025-0300-42AE-9601-DFD7AA90611A"] = Disconnection;
         _messageTypes["9C93255C-980C-4B05-8256-D2C286F5FC3B"] = spin.auth.Credentials;
         _messageTypes["C40C1CFD-0A58-4ED6-9C9F-B1F4A01DFAD0"] = Start;
         _messageTypes["24465F8E-B211-4AD7-B5D4-5040F0542CF3"] = SelectScheme;
         _messageTypes["0E5F70E6-FE21-4025-88A8-578CE55F69E9"] = VersionsUsed;
         _messageTypes["A63EBC14-ACEC-4841-B781-E48FCACB32D3"] = Pong;
         _messageTypes["47C70534-1B24-4295-B885-18E6D630DB0C"] = Heartbeat;
         _messageTypes["AD9B5F18-73D1-468C-9BB3-2C48730C2B98"] = SessionCreationResult;
      }
      
      public function SpinProtocol()
      {
         super();
      }
      
      public static function get messageTypes() : Dictionary
      {
         return _messageTypes;
      }
   }
}
