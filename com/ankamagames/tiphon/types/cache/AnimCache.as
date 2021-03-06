package com.ankamagames.tiphon.types.cache
{
   import com.ankamagames.tiphon.types.ScriptedAnimation;
   
   public class AnimCache
   {
       
      
      private var _directions:Vector.<Vector.<ScriptedAnimation>>;
      
      public function AnimCache()
      {
         this._directions = new Vector.<Vector.<ScriptedAnimation>>(8,true);
         super();
         this._directions[0] = new Vector.<ScriptedAnimation>();
         this._directions[1] = new Vector.<ScriptedAnimation>();
         this._directions[2] = new Vector.<ScriptedAnimation>();
         this._directions[6] = new Vector.<ScriptedAnimation>();
         this._directions[7] = new Vector.<ScriptedAnimation>();
      }
      
      public function getAnimation(direction:int) : ScriptedAnimation
      {
         var directionModified:int = 0;
         if(direction == 3)
         {
            directionModified = 1;
         }
         else if(direction == 4)
         {
            directionModified = 0;
         }
         else if(direction == 5)
         {
            directionModified = 7;
         }
         else
         {
            directionModified = direction;
         }
         var animList:Vector.<ScriptedAnimation> = this._directions[directionModified];
         if(animList.length)
         {
            return animList.shift();
         }
         return null;
      }
      
      public function pushAnimation(scriptedAnimation:ScriptedAnimation, direction:int) : void
      {
         var directionModified:int = 0;
         if(direction == 3)
         {
            directionModified = 1;
         }
         else if(direction == 4)
         {
            directionModified = 0;
         }
         else if(direction == 5)
         {
            directionModified = 7;
         }
         else
         {
            directionModified = direction;
         }
         this._directions[directionModified].push(scriptedAnimation);
      }
   }
}
