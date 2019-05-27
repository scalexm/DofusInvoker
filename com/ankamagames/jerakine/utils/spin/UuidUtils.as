package com.ankamagames.jerakine.utils.spin
{
   import com.netease.protobuf.UInt64;
   import flash.utils.ByteArray;
   import mx.utils.UIDUtil;
   import spin.Uuid;
   
   public class UuidUtils
   {
       
      
      public function UuidUtils()
      {
         super();
      }
      
      public static function stringToUuid(uuid:String) : Uuid
      {
         var uuidBytes:ByteArray = UIDUtil.toByteArray(uuid);
         var result:Uuid = new Uuid();
         var high:uint = uuidBytes.readUnsignedInt();
         var low:uint = uuidBytes.readUnsignedInt();
         result.highBits = new UInt64(low,high);
         high = uuidBytes.readUnsignedInt();
         low = uuidBytes.readUnsignedInt();
         result.lowBits = new UInt64(low,high);
         return result;
      }
      
      public static function uuidToString(uuid:Uuid) : String
      {
         var result:ByteArray = new ByteArray();
         result.writeUnsignedInt(uuid.highBits.high);
         result.writeUnsignedInt(uuid.highBits.low);
         result.writeUnsignedInt(uuid.lowBits.high);
         result.writeUnsignedInt(uuid.lowBits.low);
         result.position = 0;
         return UIDUtil.fromByteArray(result);
      }
   }
}
