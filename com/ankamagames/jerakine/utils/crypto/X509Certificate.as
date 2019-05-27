package com.ankamagames.jerakine.utils.crypto
{
   import com.hurlant.crypto.rsa.RSAKey;
   import com.hurlant.math.BigInteger;
   import flash.utils.ByteArray;
   
   public class X509Certificate
   {
      
      private static var _SEQ_OID:ByteArray = new ByteArray();
      
      {
         _SEQ_OID[0] = 42;
         _SEQ_OID[1] = 134;
         _SEQ_OID[2] = 72;
         _SEQ_OID[3] = 134;
         _SEQ_OID[4] = 247;
         _SEQ_OID[5] = 13;
         _SEQ_OID[6] = 1;
         _SEQ_OID[7] = 1;
         _SEQ_OID[8] = 1;
      }
      
      public function X509Certificate()
      {
         super();
      }
      
      public static function decode(x509key:ByteArray) : RSAKey
      {
         var oidLength:int = 0;
         var oidBytes:ByteArray = null;
         var sequenceEqual:Boolean = false;
         var i:uint = 0;
         var remainingBytes:int = 0;
         var modulusSize:int = 0;
         var modulus:ByteArray = null;
         var tempModulus:ByteArray = null;
         var exponentSize:int = 0;
         var exponent:ByteArray = null;
         if(x509key.readByte() == 48)
         {
            readASNLength(x509key);
            var identifierSize:int = 0;
            if(x509key.readByte() == 48)
            {
               identifierSize = readASNLength(x509key);
               if(x509key.readByte() == 6)
               {
                  oidLength = readASNLength(x509key);
                  oidBytes = new ByteArray();
                  x509key.readBytes(oidBytes,0,oidLength);
                  sequenceEqual = true;
                  for(i = 0; i < oidBytes.length; )
                  {
                     if(oidBytes[i] != _SEQ_OID[i])
                     {
                        sequenceEqual = false;
                        break;
                     }
                     i++;
                  }
                  if(!sequenceEqual)
                  {
                     return null;
                  }
                  remainingBytes = identifierSize - 2 - oidBytes.length;
                  x509key.position = x509key.position + remainingBytes;
               }
               if(x509key.readByte() == 3)
               {
                  readASNLength(x509key);
                  x509key.readByte();
                  if(x509key.readByte() == 48)
                  {
                     readASNLength(x509key);
                     if(x509key.readByte() == 2)
                     {
                        modulusSize = readASNLength(x509key);
                        modulus = new ByteArray();
                        x509key.readBytes(modulus,0,modulusSize);
                        if(modulus[0] == 0)
                        {
                           tempModulus = new ByteArray();
                           tempModulus.writeBytes(modulus,1,modulus.length - 1);
                           tempModulus.position = 0;
                           modulus = tempModulus;
                        }
                        if(x509key.readByte() == 2)
                        {
                           exponentSize = readASNLength(x509key);
                           exponent = new ByteArray();
                           x509key.readBytes(exponent,4 - exponentSize,exponentSize);
                           return new RSAKey(new BigInteger(modulus,modulus.length,true),exponent.readUnsignedInt());
                        }
                     }
                  }
               }
               return null;
            }
            return null;
         }
         return null;
      }
      
      private static function readASNLength(reader:ByteArray) : int
      {
         var count:* = 0;
         var lengthBytes:ByteArray = null;
         var length:int = reader.readByte();
         if((length & 128) == 128)
         {
            count = length & 15;
            lengthBytes = new ByteArray();
            reader.readBytes(lengthBytes,4 - count,count);
            length = lengthBytes.readInt();
         }
         return length;
      }
   }
}
