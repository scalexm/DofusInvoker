package com.ankamagames.dofus.network.types.game.presets
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class CharacterBuildPreset extends PresetsContainerPreset implements INetworkType
   {
      
      public static const protocolId:uint = 534;
       
      
      public var iconId:uint = 0;
      
      public var name:String = "";
      
      public function CharacterBuildPreset()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 534;
      }
      
      public function initCharacterBuildPreset(id:int = 0, presets:Vector.<Preset> = null, iconId:uint = 0, name:String = "") : CharacterBuildPreset
      {
         super.initPresetsContainerPreset(id,presets);
         this.iconId = iconId;
         this.name = name;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.iconId = 0;
         this.name = "";
      }
      
      override public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_CharacterBuildPreset(output);
      }
      
      public function serializeAs_CharacterBuildPreset(output:ICustomDataOutput) : void
      {
         super.serializeAs_PresetsContainerPreset(output);
         if(this.iconId < 0)
         {
            throw new Error("Forbidden value (" + this.iconId + ") on element iconId.");
         }
         output.writeShort(this.iconId);
         output.writeUTF(this.name);
      }
      
      override public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_CharacterBuildPreset(input);
      }
      
      public function deserializeAs_CharacterBuildPreset(input:ICustomDataInput) : void
      {
         super.deserialize(input);
         this._iconIdFunc(input);
         this._nameFunc(input);
      }
      
      override public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_CharacterBuildPreset(tree);
      }
      
      public function deserializeAsyncAs_CharacterBuildPreset(tree:FuncTree) : void
      {
         super.deserializeAsync(tree);
         tree.addChild(this._iconIdFunc);
         tree.addChild(this._nameFunc);
      }
      
      private function _iconIdFunc(input:ICustomDataInput) : void
      {
         this.iconId = input.readShort();
         if(this.iconId < 0)
         {
            throw new Error("Forbidden value (" + this.iconId + ") on element of CharacterBuildPreset.iconId.");
         }
      }
      
      private function _nameFunc(input:ICustomDataInput) : void
      {
         this.name = input.readUTF();
      }
   }
}
