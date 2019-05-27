package com.ankamagames.dofus.network.types.version
{
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkType;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   
   public class Version implements INetworkType
   {
      
      public static const protocolId:uint = 11;
       
      
      public var major:uint = 0;
      
      public var minor:uint = 0;
      
      public var release:uint = 0;
      
      public var revision:uint = 0;
      
      public var patch:uint = 0;
      
      public var buildType:uint = 0;
      
      public function Version()
      {
         super();
      }
      
      public function getTypeId() : uint
      {
         return 11;
      }
      
      public function initVersion(major:uint = 0, minor:uint = 0, release:uint = 0, revision:uint = 0, patch:uint = 0, buildType:uint = 0) : Version
      {
         this.major = major;
         this.minor = minor;
         this.release = release;
         this.revision = revision;
         this.patch = patch;
         this.buildType = buildType;
         return this;
      }
      
      public function reset() : void
      {
         this.major = 0;
         this.minor = 0;
         this.release = 0;
         this.revision = 0;
         this.patch = 0;
         this.buildType = 0;
      }
      
      public function serialize(output:ICustomDataOutput) : void
      {
         this.serializeAs_Version(output);
      }
      
      public function serializeAs_Version(output:ICustomDataOutput) : void
      {
         if(this.major < 0)
         {
            throw new Error("Forbidden value (" + this.major + ") on element major.");
         }
         output.writeByte(this.major);
         if(this.minor < 0)
         {
            throw new Error("Forbidden value (" + this.minor + ") on element minor.");
         }
         output.writeByte(this.minor);
         if(this.release < 0)
         {
            throw new Error("Forbidden value (" + this.release + ") on element release.");
         }
         output.writeByte(this.release);
         if(this.revision < 0)
         {
            throw new Error("Forbidden value (" + this.revision + ") on element revision.");
         }
         output.writeInt(this.revision);
         if(this.patch < 0)
         {
            throw new Error("Forbidden value (" + this.patch + ") on element patch.");
         }
         output.writeByte(this.patch);
         output.writeByte(this.buildType);
      }
      
      public function deserialize(input:ICustomDataInput) : void
      {
         this.deserializeAs_Version(input);
      }
      
      public function deserializeAs_Version(input:ICustomDataInput) : void
      {
         this._majorFunc(input);
         this._minorFunc(input);
         this._releaseFunc(input);
         this._revisionFunc(input);
         this._patchFunc(input);
         this._buildTypeFunc(input);
      }
      
      public function deserializeAsync(tree:FuncTree) : void
      {
         this.deserializeAsyncAs_Version(tree);
      }
      
      public function deserializeAsyncAs_Version(tree:FuncTree) : void
      {
         tree.addChild(this._majorFunc);
         tree.addChild(this._minorFunc);
         tree.addChild(this._releaseFunc);
         tree.addChild(this._revisionFunc);
         tree.addChild(this._patchFunc);
         tree.addChild(this._buildTypeFunc);
      }
      
      private function _majorFunc(input:ICustomDataInput) : void
      {
         this.major = input.readByte();
         if(this.major < 0)
         {
            throw new Error("Forbidden value (" + this.major + ") on element of Version.major.");
         }
      }
      
      private function _minorFunc(input:ICustomDataInput) : void
      {
         this.minor = input.readByte();
         if(this.minor < 0)
         {
            throw new Error("Forbidden value (" + this.minor + ") on element of Version.minor.");
         }
      }
      
      private function _releaseFunc(input:ICustomDataInput) : void
      {
         this.release = input.readByte();
         if(this.release < 0)
         {
            throw new Error("Forbidden value (" + this.release + ") on element of Version.release.");
         }
      }
      
      private function _revisionFunc(input:ICustomDataInput) : void
      {
         this.revision = input.readInt();
         if(this.revision < 0)
         {
            throw new Error("Forbidden value (" + this.revision + ") on element of Version.revision.");
         }
      }
      
      private function _patchFunc(input:ICustomDataInput) : void
      {
         this.patch = input.readByte();
         if(this.patch < 0)
         {
            throw new Error("Forbidden value (" + this.patch + ") on element of Version.patch.");
         }
      }
      
      private function _buildTypeFunc(input:ICustomDataInput) : void
      {
         this.buildType = input.readByte();
         if(this.buildType < 0)
         {
            throw new Error("Forbidden value (" + this.buildType + ") on element of Version.buildType.");
         }
      }
   }
}
