package org.as3commons.bytecode.swf.event
{
   import flash.events.Event;
   import org.as3commons.bytecode.tags.serialization.ITagSerializer;
   
   public class SWFFileIOEvent extends Event
   {
      
      public static const TAG_SERIALIZER_CREATED:String = "tagSerializerCreated";
       
      
      private var _tagSerializer:ITagSerializer;
      
      public function SWFFileIOEvent(type:String, serializer:ITagSerializer, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
         this._tagSerializer = serializer;
      }
      
      public function get tagSerializer() : ITagSerializer
      {
         return this._tagSerializer;
      }
      
      public function set tagSerializer(value:ITagSerializer) : void
      {
         this._tagSerializer = value;
      }
      
      override public function clone() : Event
      {
         return new SWFFileIOEvent(this.type,this.tagSerializer,this.bubbles,this.cancelable);
      }
   }
}
