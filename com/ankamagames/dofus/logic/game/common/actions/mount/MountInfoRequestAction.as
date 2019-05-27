package com.ankamagames.dofus.logic.game.common.actions.mount
{
   import com.ankama.dofus.enums.ActionIds;
   import com.ankamagames.dofus.datacenter.effects.EffectInstance;
   import com.ankamagames.dofus.datacenter.effects.instances.EffectInstanceMount;
   import com.ankamagames.dofus.internalDatacenter.items.ItemWrapper;
   import com.ankamagames.jerakine.handlers.messages.Action;
   
   public class MountInfoRequestAction implements Action
   {
       
      
      public var item:ItemWrapper;
      
      public var mountId:Number;
      
      public var time:Number;
      
      public function MountInfoRequestAction()
      {
         super();
      }
      
      public static function create(item:ItemWrapper) : MountInfoRequestAction
      {
         var effect:EffectInstance = null;
         var o:MountInfoRequestAction = new MountInfoRequestAction();
         o.item = item;
         for each(effect in item.effects)
         {
            switch(effect.effectId)
            {
               case ActionIds.ACTION_RIDE_DETAILS:
                  o.time = (effect as EffectInstanceMount).expirationDate;
                  o.mountId = (effect as EffectInstanceMount).id;
                  continue;
               default:
                  continue;
            }
         }
         return o;
      }
   }
}
