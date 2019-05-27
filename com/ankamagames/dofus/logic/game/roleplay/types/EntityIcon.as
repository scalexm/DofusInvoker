package com.ankamagames.dofus.logic.game.roleplay.types
{
   import avmplus.getQualifiedClassName;
   import com.ankamagames.atouin.Atouin;
   import com.ankamagames.berilia.components.Texture;
   import com.ankamagames.dofus.types.entities.AnimatedCharacter;
   import com.ankamagames.jerakine.interfaces.IRectangle;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.types.Uri;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class EntityIcon extends Sprite
   {
      
      private static const _log:Logger = Log.getLogger(getQualifiedClassName(EntityIcon));
       
      
      private var _entity:AnimatedCharacter;
      
      private var _icons:Dictionary;
      
      private var _nbIcons:int;
      
      private var _offsets:Dictionary;
      
      public var needUpdate:Boolean;
      
      public var rendering:Boolean;
      
      public function EntityIcon(pEntity:AnimatedCharacter)
      {
         super();
         this._entity = pEntity;
         this._icons = new Dictionary(true);
         this._offsets = new Dictionary(true);
         mouseChildren = false;
         mouseEnabled = false;
      }
      
      public function addIcon(pIconUri:String, pIconName:String, offset:Point = null) : void
      {
         this._icons[pIconName] = new Texture();
         this._offsets[pIconName] = offset;
         var icon:Texture = this._icons[pIconName];
         icon.uri = new Uri(pIconUri);
         icon.dispatchMessages = true;
         icon.addEventListener(Event.COMPLETE,this.iconRendered);
         icon.finalize();
         this._nbIcons++;
      }
      
      public function removeIcon(pIconName:String) : void
      {
         var icon:Texture = this._icons[pIconName];
         if(icon)
         {
            if(icon.parent == this)
            {
               removeChild(icon);
            }
            delete this._icons[pIconName];
            this._nbIcons--;
            if(numChildren == this._nbIcons)
            {
               for each(icon in this._icons)
               {
                  removeChild(icon);
               }
               for each(icon in this._icons)
               {
                  icon.x = width == 0?Number(icon.width / 2):Number(width + 5 + icon.width / 2);
                  if(this._offsets[icon.name])
                  {
                     icon.x = icon.x + this._offsets[icon.name].x;
                     icon.y = icon.y + this._offsets[icon.name].y;
                  }
                  addChild(icon);
               }
               this.needUpdate = true;
            }
         }
      }
      
      public function hasIcon(pIconName:String) : Boolean
      {
         return this._icons[pIconName];
      }
      
      public function get length() : int
      {
         return this._nbIcons;
      }
      
      public function remove() : void
      {
         if(parent)
         {
            parent.removeChild(this);
         }
      }
      
      public function place(pRect:IRectangle) : void
      {
         var globalPos:Point = new Point(pRect.x + pRect.width / 2 - width * Atouin.getInstance().currentZoom / 2,pRect.y - 10 * Atouin.getInstance().currentZoom);
         if(!this._entity)
         {
            _log.warn("Trying to place an icon above an unknown entity, aborting");
            return;
         }
         if(!this._entity.parent)
         {
            _log.warn("Trying to place an icon above entity " + this._entity.name + " with no parent, aborting");
            return;
         }
         var localPos:Point = this._entity.parent.globalToLocal(globalPos);
         x = localPos.x;
         y = localPos.y;
      }
      
      private function iconRendered(pEvent:Event) : void
      {
         var offset:Point = null;
         var iconName:* = null;
         var icon:Texture = pEvent.currentTarget as Texture;
         icon.removeEventListener(Event.COMPLETE,this.iconRendered);
         icon.x = width == 0?Number(icon.width / 2):Number(width + 5 + icon.width / 2);
         for(iconName in this._icons)
         {
            if(this._icons[iconName] == icon)
            {
               offset = this._offsets[iconName];
               break;
            }
         }
         if(offset)
         {
            icon.x = icon.x + offset.x;
            icon.y = icon.y + offset.y;
         }
         addChild(icon);
         this.needUpdate = true;
      }
   }
}
