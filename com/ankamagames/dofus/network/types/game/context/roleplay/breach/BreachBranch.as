package com.ankamagames.dofus.network.types.game.context.roleplay.breach
{
   import com.ankamagames.dofus.network.types.game.context.roleplay.MonsterInGroupLightInformations;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   [Trusted]
   public class BreachBranch implements INetworkType
   {
      
      public static const protocolId:uint = 558;
       
      
      public var room:uint = 0;
      
      public var element:uint = 0;
      
      public var bosses:Vector.<MonsterInGroupLightInformations>;
      
      public var map:Number = 0;
      
      private var _bossestree:FuncTree;
      
      public function BreachBranch()
      {
         this.bosses = new Vector.<MonsterInGroupLightInformations>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 558;
      }
      
      public function initBreachBranch(room:uint = 0, element:uint = 0, bosses:Vector.<MonsterInGroupLightInformations> = null, map:Number = 0) : BreachBranch
      {
         this.room = room;
         this.element = element;
         this.bosses = bosses;
         this.map = map;
         return this;
      }
      
      public function reset() : void
      {
         this.room = 0;
         this.element = 0;
         this.bosses = new Vector.<MonsterInGroupLightInformations>();
         this.map = 0;
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_BreachBranch(output);
      }
      
      public function serializeAs_BreachBranch(output:ICustomDataOutput) : void
      {
         if(this.room < 0)
         {
            throw new Error("Forbidden value (" + this.room + ") on element room.");
         }
         output.writeByte(this.room);
         if(this.element < 0)
         {
            throw new Error("Forbidden value (" + this.element + ") on element element.");
         }
         output.writeInt(this.element);
         output.writeShort(this.bosses.length);
         for(var _i3:uint = 0; _i3 < this.bosses.length; _i3++)
         {
            (this.bosses[_i3] as MonsterInGroupLightInformations).serializeAs_MonsterInGroupLightInformations(output);
         }
         if(this.map < 0 || this.map > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.map + ") on element map.");
         }
         output.writeDouble(this.map);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_BreachBranch(input);
      }
      
      public function deserializeAs_BreachBranch(input:ICustomDataInput) : void
      {
         var _item3:MonsterInGroupLightInformations = null;
         this._roomFunc(input);
         this._elementFunc(input);
         var _bossesLen:uint = input.readUnsignedShort();
         for(var _i3:uint = 0; _i3 < _bossesLen; _i3++)
         {
            _item3 = new MonsterInGroupLightInformations();
            _item3.deserialize(input);
            this.bosses.push(_item3);
         }
         this._mapFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_BreachBranch(tree);
      }
      
      public function deserializeAsyncAs_BreachBranch(tree:FuncTree) : void
      {
         tree.addChild(this._roomFunc);
         tree.addChild(this._elementFunc);
         this._bossestree = tree.addChild(this._bossestreeFunc);
         tree.addChild(this._mapFunc);
      }
      
      private function _roomFunc(input:ICustomDataInput) : void
      {
         this.room = input.readByte();
         if(this.room < 0)
         {
            throw new Error("Forbidden value (" + this.room + ") on element of BreachBranch.room.");
         }
      }
      
      private function _elementFunc(input:ICustomDataInput) : void
      {
         this.element = input.readInt();
         if(this.element < 0)
         {
            throw new Error("Forbidden value (" + this.element + ") on element of BreachBranch.element.");
         }
      }
      
      private function _bossestreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._bossestree.addChild(this._bossesFunc);
         }
      }
      
      private function _bossesFunc(input:ICustomDataInput) : void
      {
         var _item:MonsterInGroupLightInformations = new MonsterInGroupLightInformations();
         _item.deserialize(input);
         this.bosses.push(_item);
      }
      
      private function _mapFunc(input:ICustomDataInput) : void
      {
         this.map = input.readDouble();
         if(this.map < 0 || this.map > 9007199254740990)
         {
            throw new Error("Forbidden value (" + this.map + ") on element of BreachBranch.map.");
         }
      }
   }
}
