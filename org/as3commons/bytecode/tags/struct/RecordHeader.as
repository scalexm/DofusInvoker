package org.as3commons.bytecode.tags.struct
{
   public class RecordHeader
   {
       
      
      private var _id:uint;
      
      private var _length:uint;
      
      private var _isLongTag:Boolean;
      
      public function RecordHeader(tagId:uint, tagLength:uint, longTag:Boolean)
      {
         super();
         this._id = tagId;
         this._length = tagLength;
         this._isLongTag = longTag;
      }
      
      public function get isLongTag() : Boolean
      {
         return this._isLongTag;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get length() : uint
      {
         return this._length;
      }
   }
}
