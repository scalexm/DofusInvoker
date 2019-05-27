package org.as3commons.bytecode.util
{
   import flash.utils.ByteArray;
   
   public final class ReadWritePair
   {
       
      
      private var _reader:Function;
      
      private var _writer:Function;
      
      public function ReadWritePair(readerFunction:Function, writerFunction:Function)
      {
         super();
         this._reader = readerFunction;
         this._writer = writerFunction;
      }
      
      public function get reader() : Function
      {
         return this._reader;
      }
      
      public function read(byteArray:ByteArray) : *
      {
         return this.reader.apply(AbcSpec,[byteArray]);
      }
      
      public function write(value:*, byteArray:ByteArray) : Function
      {
         return this.writer.apply(AbcSpec,[value,byteArray]);
      }
      
      public function get writer() : Function
      {
         return this._writer;
      }
   }
}
