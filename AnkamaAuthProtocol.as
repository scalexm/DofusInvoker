package
{
   import flash.utils.Dictionary;
   import spin.auth.ankama.ApiKey;
   import spin.auth.ankama.AuthSuccess;
   import spin.auth.ankama.Credentials;
   import spin.auth.ankama.EncryptionDetails;
   import spin.auth.ankama.EncryptionDetailsRequest;
   import spin.auth.ankama.NicknameRequest;
   import spin.auth.ankama.NicknameResponse;
   import spin.auth.ankama.NicknameResult;
   import spin.auth.ankama.Token;
   
   public class AnkamaAuthProtocol
   {
      
      private static const _messageTypes:Dictionary = new Dictionary();
      
      {
         _messageTypes["1FAADEF0-D1D6-419E-917F-525B032360F9"] = Token;
         _messageTypes["65CA1894-82AB-4C1F-B48A-CB1B327F5221"] = AuthSuccess;
         _messageTypes["4F5301D0-1414-4093-9CE8-7FE6B9561696"] = EncryptionDetails;
         _messageTypes["3020B583-ABE3-441E-86FB-4116E32610A2"] = EncryptionDetailsRequest;
         _messageTypes["6125B545-F725-4746-AA7C-D80FD36913E8"] = ApiKey;
         _messageTypes["756733E8-70A2-4FD6-A614-CFD491FA1674"] = NicknameResponse;
         _messageTypes["ED8D5454-148D-406E-BBA7-ADAD6D8C6878"] = NicknameRequest;
         _messageTypes["E553D4D2-663C-43EC-959D-ECD91E311B9B"] = NicknameResult;
         _messageTypes["EA1588AF-95F5-42F3-A142-72D98ACABDDD"] = Credentials;
      }
      
      public function AnkamaAuthProtocol()
      {
         super();
      }
      
      public static function get messageTypes() : Dictionary
      {
         return _messageTypes;
      }
   }
}
