package com.ankamagames.dofus.kernel.sound.manager
{
   import com.ankamagames.dofus.datacenter.ambientSounds.AmbientSound;
   import com.ankamagames.dofus.datacenter.ambientSounds.PlaylistSound;
   import com.ankamagames.dofus.datacenter.playlists.Playlist;
   import com.ankamagames.dofus.kernel.sound.SoundManager;
   import com.ankamagames.dofus.kernel.sound.TubulSoundConfiguration;
   import com.ankamagames.dofus.kernel.sound.type.SoundDofus;
   import com.ankamagames.dofus.kernel.sound.utils.SoundUtil;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.protocolAudio.ProtocolEnum;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.jerakine.types.events.PropertyChangeEvent;
   import com.ankamagames.tubul.interfaces.ISound;
   import com.ankamagames.tubul.types.VolumeFadeEffect;
   import flash.utils.getQualifiedClassName;
   
   public class AmbientSoundsManager
   {
      
      private static const _log:Logger = Log.getLogger(getQualifiedClassName(AmbientSoundsManager));
       
      
      private var _useCriterion:Boolean = false;
      
      private var _criterionID:uint;
      
      private var _ambientSounds:Vector.<AmbientSound>;
      
      private var _roleplayMusics:Vector.<AmbientSound>;
      
      private var _roleplayPlaylist:Playlist;
      
      private var _ambiantPlaylist:Playlist;
      
      private var _music:ISound;
      
      private var _previousMusic:ISound;
      
      private var _ambience:ISound;
      
      private var _previousAmbience:ISound;
      
      private var _musicA:PlaylistSound;
      
      private var _ambienceA:PlaylistSound;
      
      private var _previousMusicId:String;
      
      private var _previousMusicPlaylistID:int;
      
      private var _previousAmbienceId:String;
      
      private var _previousAmbiancePlaylistId:int;
      
      private var tubulOption:OptionManager;
      
      public function AmbientSoundsManager()
      {
         super();
         this.init();
      }
      
      public function get music() : ISound
      {
         return this._music;
      }
      
      public function get ambience() : ISound
      {
         return this._ambience;
      }
      
      public function get criterionID() : uint
      {
         return this._criterionID;
      }
      
      public function set criterionID(pCriterionID:uint) : void
      {
         this._criterionID = pCriterionID;
      }
      
      public function get ambientSounds() : Vector.<AmbientSound>
      {
         return this._ambientSounds;
      }
      
      public function setAmbientSounds(pAmbiant:Vector.<AmbientSound>, pMusic:Vector.<AmbientSound>, plMusic:Playlist = null, plAmbiant:Playlist = null) : void
      {
         var asound:PlaylistSound = null;
         this._ambientSounds = pAmbiant;
         this._roleplayMusics = pMusic;
         this._roleplayPlaylist = plMusic;
         this._ambiantPlaylist = plAmbiant;
         var logText:* = "";
         if(this._ambientSounds.length == 0 && this._roleplayMusics.length == 0 && (!this._roleplayPlaylist || this._roleplayPlaylist.sounds.length == 0) && (!this._ambiantPlaylist || this._ambiantPlaylist.sounds.length == 0))
         {
            logText = "Ni musique ni ambiance pour cette map ??!!";
         }
         else
         {
            logText = "Cette map contient les ambiances d\'id : ";
            for each(asound in this._ambientSounds)
            {
               logText = logText + (asound.id + ", ");
            }
            logText = logText + ", les musiques d\'id : ";
            for each(asound in this._roleplayMusics)
            {
               logText = logText + (asound.id + ", ");
            }
            logText = logText + ", une playlist contenant les musique d\'id";
            if(this._roleplayPlaylist)
            {
               for each(asound in this._roleplayPlaylist.sounds)
               {
                  logText = logText + (asound.id + ", ");
               }
            }
            logText = logText + "et une playlist contenant les ambiances d\'id";
            if(this._ambiantPlaylist)
            {
               for each(asound in this._ambiantPlaylist.sounds)
               {
                  logText = logText + (asound.id + ", ");
               }
            }
         }
         _log.info(logText);
      }
      
      public function selectValidSounds() : void
      {
         var rnd:int = 0;
         var playlistSound:PlaylistSound = null;
         var ambientSound:AmbientSound = null;
         var count:int = 0;
         if(this._ambiantPlaylist && this._ambiantPlaylist.sounds.length > 0)
         {
            count = this._ambiantPlaylist.sounds.length;
            rnd = int(Math.random() * count);
            for each(playlistSound in this._ambiantPlaylist.sounds)
            {
               if(rnd == 0)
               {
                  this._ambienceA = playlistSound;
                  break;
               }
               rnd--;
            }
         }
         count = 0;
         for each(ambientSound in this._roleplayMusics)
         {
            if(!this._useCriterion || ambientSound.criterionId == this._criterionID)
            {
               count++;
            }
         }
         rnd = int(Math.random() * count);
         if(this._roleplayPlaylist && this._roleplayPlaylist.sounds.length > 0)
         {
            count = this._roleplayPlaylist.sounds.length;
            rnd = int(Math.random() * count);
            for each(playlistSound in this._roleplayPlaylist.sounds)
            {
               if(rnd == 0)
               {
                  this._musicA = playlistSound;
                  break;
               }
               rnd--;
            }
         }
      }
      
      public function playMusicAndAmbient() : void
      {
         var soundPathA:String = null;
         var soundUriA:Uri = null;
         var fade:VolumeFadeEffect = null;
         var fadeOut:VolumeFadeEffect = null;
         var roleplaySounds:Array = null;
         var soundPathM:String = null;
         var soundUriM:Uri = null;
         var fadeMusic:VolumeFadeEffect = null;
         var fadeOutMusic:VolumeFadeEffect = null;
         var roleplaySounds2:Array = null;
         if(!SoundManager.getInstance().manager.soundIsActivate)
         {
            return;
         }
         if(!RegConnectionManager.getInstance().isMain)
         {
            return;
         }
         var iteration:int = 0;
         if(this._ambienceA == null)
         {
            _log.warn("It seems that we have no ambiance for this map");
         }
         else
         {
            if(this._previousAmbienceId == this._ambienceA.id || this._ambiantPlaylist && this._previousAmbiancePlaylistId == this._ambiantPlaylist.id)
            {
               _log.warn("Same ambiance as in the previous map, we just adjust its volume");
               this._ambience.volume = this._ambienceA.volume / 100;
            }
            else
            {
               if(this._previousAmbience != null)
               {
                  fadeOut = new VolumeFadeEffect(-1,0,TubulSoundConfiguration.TIME_FADE_OUT_AMBIANCE);
                  this._previousAmbience.stop(fadeOut);
               }
               soundPathA = SoundUtil.getConfigEntryByBusId(this._ambienceA.channel);
               soundUriA = new Uri(soundPathA + this._ambienceA.id + ".mp3");
               this._ambience = new SoundDofus(String(this._ambienceA.id));
               this._ambience.volume = this._ambienceA.volume / 100;
               this._ambience.currentFadeVolume = 0;
               fade = new VolumeFadeEffect(-1,1,TubulSoundConfiguration.TIME_FADE_IN_AMBIANCE);
               iteration = -1;
               if(this._ambiantPlaylist)
               {
                  if(this._ambiantPlaylist.iteration <= 0)
                  {
                     iteration = 1;
                  }
                  else
                  {
                     iteration = this._ambiantPlaylist.iteration;
                  }
               }
               if(this._ambiantPlaylist && this._ambiantPlaylist.sounds.length > 1)
               {
                  roleplaySounds = this.createPlaylistSounds(this._ambiantPlaylist);
                  RegConnectionManager.getInstance().send(ProtocolEnum.ADD_SOUNDS_PLAYLIST,roleplaySounds);
               }
               this._ambience.play(true,iteration,fade);
            }
            this._previousAmbienceId = this._ambienceA.id;
         }
         this._previousAmbience = this._ambience;
         if(this._ambiantPlaylist)
         {
            this._previousAmbiancePlaylistId = this._ambiantPlaylist.id;
         }
         if(this._musicA == null)
         {
            _log.warn("It seems that we have no music for this map");
         }
         else
         {
            if(this._previousMusicId == this._musicA.id || this._roleplayPlaylist && this._previousMusicPlaylistID == this._roleplayPlaylist.id)
            {
               _log.warn("Same music as in the previous map");
               this._music.volume = this._musicA.volume / 100;
            }
            else
            {
               if(this._previousMusic != null)
               {
                  fadeOutMusic = new VolumeFadeEffect(-1,0,TubulSoundConfiguration.TIME_FADE_OUT_MUSIC);
                  this._previousMusic.stop(fadeOutMusic);
               }
               soundPathM = SoundUtil.getConfigEntryByBusId(this._musicA.channel);
               soundUriM = new Uri(soundPathM + this._musicA.id + ".mp3");
               this._music = new SoundDofus(String(this._musicA.id));
               if(this._roleplayPlaylist)
               {
                  RegConnectionManager.getInstance().send(ProtocolEnum.SET_SILENCE,this._roleplayPlaylist.silenceDuration,this._roleplayPlaylist.silenceDuration);
               }
               else
               {
                  RegConnectionManager.getInstance().send(ProtocolEnum.SET_SILENCE,3,3);
               }
               this._music.volume = this._musicA.volume / 100;
               this._music.currentFadeVolume = 0;
               this.tubulOption = OptionManager.getOptionManager("tubul");
               if(this._roleplayPlaylist)
               {
                  iteration = this._roleplayPlaylist.iteration;
               }
               if(iteration <= 0)
               {
                  iteration = 1;
               }
               if(this._roleplayPlaylist && this._roleplayPlaylist.sounds.length > 1)
               {
                  roleplaySounds2 = this.createPlaylistSounds(this._roleplayPlaylist);
                  RegConnectionManager.getInstance().send(ProtocolEnum.ADD_SOUNDS_PLAYLIST,roleplaySounds2);
               }
               this._music.play(true,iteration);
               this.tubulOption.addEventListener(PropertyChangeEvent.PROPERTY_CHANGED,this.onPropertyChanged);
               fadeMusic = new VolumeFadeEffect(-1,1,TubulSoundConfiguration.TIME_FADE_IN_MUSIC);
               fadeMusic.attachToSoundSource(this._music);
               fadeMusic.start();
            }
            this._previousMusicId = this._musicA.id;
         }
         this._previousMusic = this._music;
         if(this._roleplayPlaylist)
         {
            this._previousMusicPlaylistID = this._roleplayPlaylist.id;
         }
      }
      
      public function stopMusicAndAmbient() : void
      {
         if(this.ambience)
         {
            this.ambience.stop();
         }
         if(this.music)
         {
            this.music.stop();
         }
         this._previousAmbienceId = "";
         this._previousMusicId = "";
         this._previousAmbiancePlaylistId = -1;
         this._previousMusicPlaylistID = -1;
         if(this.tubulOption)
         {
            this.tubulOption.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGED,this.onPropertyChanged);
         }
      }
      
      public function mergeSoundsArea(pAmbientSounds:Vector.<AmbientSound>) : void
      {
      }
      
      public function clear(pFade:Number = 0, pFadeTime:Number = 0) : void
      {
         this.stopMusicAndAmbient();
      }
      
      private function init() : void
      {
      }
      
      private function onPropertyChanged(pEvent:PropertyChangeEvent) : void
      {
         if(pEvent.propertyName != "infiniteLoopMusics")
         {
            return;
         }
         RegConnectionManager.getInstance().send(ProtocolEnum.OPTION_MUSIC_LOOP_VALUE_CHANGED,pEvent.propertyValue);
      }
      
      private function createPlaylistSounds(playlist:Playlist) : Array
      {
         var playlistSound:PlaylistSound = null;
         var music:ISound = null;
         var soundUriM:Uri = null;
         var soundPathM:String = null;
         var iteration:int = 0;
         var songsContainer:Array = new Array();
         for each(playlistSound in playlist.sounds)
         {
            if(!(this._musicA && playlistSound.id == this._musicA.id))
            {
               soundPathM = SoundUtil.getConfigEntryByBusId(playlistSound.channel);
               soundUriM = new Uri(soundPathM + playlistSound.id + ".mp3");
               music = new SoundDofus(String(playlistSound.id));
               iteration = playlist.iteration;
               if(iteration <= 0)
               {
                  iteration = 1;
               }
               music.setLoops(iteration);
               music.volume = playlistSound.volume / 100;
               music.currentFadeVolume = 0;
               songsContainer.push(music.id);
            }
         }
         return songsContainer;
      }
   }
}
