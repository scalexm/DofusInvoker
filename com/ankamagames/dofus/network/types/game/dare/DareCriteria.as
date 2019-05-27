package com.ankamagames.dofus.network.types.game.dare
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class DareCriteria implements INetworkType
   {
      
      public static const protocolId:uint = 501;
       
      
      public var type:uint = 0;
      
      public var params:Vector.<int>;
      
      private var _paramstree:FuncTree;
      
      public function DareCriteria()
      {
         this.params = new Vector.<int>();
         super();
      }
      
      public function getTypeId() : uint
      {
         return 501;
      }
      
      public function initDareCriteria(type:uint = 0, params:Vector.<int> = null) : DareCriteria
      {
         this.type = type;
         this.params = params;
         return this;
      }
      
      public function reset() : void
      {
         this.type = 0;
         this.params = new Vector.<int>();
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_DareCriteria(output);
      }
      
      public function serializeAs_DareCriteria(output:ICustomDataOutput) : void
      {
         output.writeByte(this.type);
         output.writeShort(this.params.length);
         for(var _i2:uint = 0; _i2 < this.params.length; _i2++)
         {
            output.writeInt(this.params[_i2]);
         }
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_DareCriteria(input);
      }
      
      public function deserializeAs_DareCriteria(input:ICustomDataInput) : void
      {
         var _val2:int = 0;
         this._typeFunc(input);
         var _paramsLen:uint = input.readUnsignedShort();
         for(var _i2:uint = 0; _i2 < _paramsLen; _i2++)
         {
            _val2 = input.readInt();
            this.params.push(_val2);
         }
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_DareCriteria(tree);
      }
      
      public function deserializeAsyncAs_DareCriteria(tree:FuncTree) : void
      {
         tree.addChild(this._typeFunc);
         this._paramstree = tree.addChild(this._paramstreeFunc);
      }
      
      private function _typeFunc(input:ICustomDataInput) : void
      {
         this.type = input.readByte();
         if(this.type < 0)
         {
            throw new Error("Forbidden value (" + this.type + ") on element of DareCriteria.type.");
         }
      }
      
      private function _paramstreeFunc(input:ICustomDataInput) : void
      {
         var length:uint = input.readUnsignedShort();
         for(var i:uint = 0; i < length; i++)
         {
            this._paramstree.addChild(this._paramsFunc);
         }
      }
      
      private function _paramsFunc(input:ICustomDataInput) : void
      {
         var _val:int = input.readInt();
         this.params.push(_val);
      }
   }
}
