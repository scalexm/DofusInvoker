package com.ankamagames.tubul.types.sounds
{
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.tubul.Tubul;
   import com.ankamagames.tubul.interfaces.ILocalizedSound;
   import flash.geom.Point;
   
   public class LocalizedSound extends MP3SoundDofus implements ILocalizedSound
   {
       
      
      private var _pan:Number;
      
      private var _position:Point;
      
      private var _range:Number;
      
      private var _saturationRange:Number;
      
      private var _observerPosition:Point;
      
      private var _volumeMax:Number;
      
      public function LocalizedSound(id:uint, uri:Uri, isStereo:Boolean)
      {
         super(id,uri,isStereo);
         this._pan = 0;
         this.volumeMax = 1;
         this.updateObserverPosition(Tubul.getInstance().earPosition);
      }
      
      public function get pan() : Number
      {
         return this._pan;
      }
      
      public function set pan(pan:Number) : void
      {
         if(pan < -1)
         {
            this._pan = -1;
            return;
         }
         if(pan > 1)
         {
            this._pan = 1;
            return;
         }
         this._pan = pan;
      }
      
      public function get range() : Number
      {
         return this._range;
      }
      
      public function set range(range:Number) : void
      {
         if(range < this._saturationRange)
         {
            range = this._saturationRange;
         }
         this._range = range;
      }
      
      public function get saturationRange() : Number
      {
         return this._saturationRange;
      }
      
      public function set saturationRange(saturationRange:Number) : void
      {
         if(saturationRange >= this._range)
         {
            saturationRange = this._range;
         }
         this._saturationRange = saturationRange;
      }
      
      public function get position() : Point
      {
         return this._position;
      }
      
      public function set position(position:Point) : void
      {
         this._position = position;
         var uriFileName:String = _uri.fileName;
         if(this._observerPosition && uriFileName != "40003440001.mp3" && uriFileName != "1000001197.mp3" && uriFileName != "1000001198.mp3" && uriFileName != "1000001199.mp3" && uriFileName != "1000001200.mp3" && uriFileName != "1000001201.mp3" && uriFileName != "40004106001.mp3" && uriFileName != "1000001254.mp3" && uriFileName != "1000001255.mp3" && uriFileName != "1000001256.mp3" && uriFileName != "1000001257.mp3" && uriFileName != "1000001258.mp3" && uriFileName != "1000001259.mp3" && uriFileName != "1000001260.mp3" && uriFileName != "1000001261.mp3" && uriFileName != "1000001262.mp3" && uriFileName != "1000001263.mp3" && uriFileName != "1000001264.mp3" && uriFileName != "1000001265.mp3")
         {
            this.updateSound();
         }
      }
      
      public function get volumeMax() : Number
      {
         return this._volumeMax;
      }
      
      public function set volumeMax(pVolumeMax:Number) : void
      {
         if(pVolumeMax > 1)
         {
            pVolumeMax = 1;
         }
         if(pVolumeMax < 0)
         {
            pVolumeMax = 0;
         }
         this._volumeMax = pVolumeMax;
      }
      
      override public function get effectiveVolume() : Number
      {
         return busVolume * volume * currentFadeVolume * this.volumeMax;
      }
      
      public function updateObserverPosition(point:Point) : void
      {
         this._observerPosition = point;
         if(this.position)
         {
            this.updateSound();
         }
      }
      
      override protected function applyParam() : void
      {
         if(_soundWrapper == null)
         {
            return;
         }
         _soundWrapper.volume = this.effectiveVolume;
         _soundWrapper.pan = this._pan;
      }
      
      private function updateSound() : void
      {
         var _newPositionY:Number = NaN;
         var newVolume:Number = NaN;
         _newPositionY = this._position.y + (this._position.y - this._observerPosition.y) * 2;
         var distx:Number = Math.abs(this._observerPosition.x - this._position.x);
         var disty:Number = Math.abs(this._observerPosition.y - _newPositionY);
         var dist1Square:Number = distx * distx;
         var dist2Square:Number = disty * disty;
         var dist:Number = Math.sqrt(dist1Square + dist2Square);
         if(dist <= this._saturationRange)
         {
            volume = 1;
         }
         else if(dist <= this._range)
         {
            newVolume = (this._range - dist) / (this._range - this._saturationRange);
            volume = newVolume;
         }
         else
         {
            volume = 0;
         }
         this.pan = this._position.x / 640 - 1;
         if(_soundLoaded)
         {
            this.applyParam();
         }
      }
   }
}
