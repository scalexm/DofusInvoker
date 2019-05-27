package com.ankamagames.dofus.network.types.version
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class VersionExtended extends Version implements INetworkType
   {
      
      public static const protocolId:uint = 393;
       
      
      public var install:uint = 0;
      
      public var technology:uint = 0;
      
      public function VersionExtended()
      {
         super();
      }
      
      override public function getTypeId() : uint
      {
         return 393;
      }
      
      public function initVersionExtended(major:uint = 0, minor:uint = 0, release:uint = 0, revision:uint = 0, patch:uint = 0, buildType:uint = 0, install:uint = 0, technology:uint = 0) : VersionExtended
      {
         super.initVersion(major,minor,release,revision,patch,buildType);
         this.install = install;
         this.technology = technology;
         return this;
      }
      
      override public function reset() : void
      {
         super.reset();
         this.install = 0;
         this.technology = 0;
      }
      
      override public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_VersionExtended(output);
      }
      
      public function serializeAs_VersionExtended(output:ICustomDataOutput) : void
      {
         super.serializeAs_Version(output);
         output.writeByte(this.install);
         output.writeByte(this.technology);
      }
      
      override public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_VersionExtended(input);
      }
      
      public function deserializeAs_VersionExtended(input:ICustomDataInput) : void
      {
         super.deserialize(input);
         this._installFunc(input);
         this._technologyFunc(input);
      }
      
      override public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_VersionExtended(tree);
      }
      
      public function deserializeAsyncAs_VersionExtended(tree:FuncTree) : void
      {
         super.deserializeAsync(tree);
         tree.addChild(this._installFunc);
         tree.addChild(this._technologyFunc);
      }
      
      private function _installFunc(input:ICustomDataInput) : void
      {
         this.install = input.readByte();
         if(this.install < 0)
         {
            throw new Error("Forbidden value (" + this.install + ") on element of VersionExtended.install.");
         }
      }
      
      private function _technologyFunc(input:ICustomDataInput) : void
      {
         this.technology = input.readByte();
         if(this.technology < 0)
         {
            throw new Error("Forbidden value (" + this.technology + ") on element of VersionExtended.technology.");
         }
      }
   }
}
