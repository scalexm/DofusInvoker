package com.ankamagames.tubul.events
{
   import com.ankamagames.tubul.interfaces.ISound;
   import flash.events.Event;
   
   public class MP3SoundEvent extends Event
   {
      
      public static const SOON_END_OF_FILE:String = "SOON_END_OF_FILE";
       
      
      public var sound:ISound;
      
      public function MP3SoundEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
      }
      
      override public function clone() : Event
      {
         var mse:MP3SoundEvent = new MP3SoundEvent(type,bubbles,cancelable);
         mse.sound = this.sound;
         return mse;
      }
   }
}
