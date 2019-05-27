package com.ankamagames.jerakine.types
{
   import com.ankamagames.jerakine.interfaces.IDataCenter;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import flash.utils.IExternalizable;
   
   public class Version implements IExternalizable, IDataCenter
   {
       
      
      private var _major:uint;
      
      private var _minor:uint;
      
      private var _release:uint;
      
      private var _revision:uint;
      
      private var _patch:uint;
      
      private var _buildType:uint;
      
      public function Version(... args)
      {
         var split:Array = null;
         super();
         if(args.length == 3)
         {
            this._major = uint(args[0]);
            this._minor = uint(args[1]);
            this._release = uint(args[2]);
         }
         else if(args.length == 6)
         {
            this._major = uint(args[0]);
            this._minor = uint(args[1]);
            this._release = uint(args[2]);
            this._buildType = uint(args[3]);
            this._revision = uint(args[4]);
            this._patch = uint(args[5]);
         }
         else if((args.length == 4 || args.length == 1) && args[0] is String)
         {
            split = (args[0] as String).split(".");
            if(split.length == 3)
            {
               this._major = uint(split[0]);
               this._minor = uint(split[1]);
               this._release = uint(split[2].split("-")[0]);
               if(args.length == 4)
               {
                  this._buildType = uint(args[1]);
                  this._revision = uint(args[2]);
                  this._patch = uint(args[3]);
               }
            }
            else
            {
               throw new ArgumentError("invalid parameters");
            }
         }
      }
      
      public function get major() : uint
      {
         return this._major;
      }
      
      public function get minor() : uint
      {
         return this._minor;
      }
      
      public function get release() : uint
      {
         return this._release;
      }
      
      public function get revision() : uint
      {
         return this._revision;
      }
      
      public function get patch() : uint
      {
         return this._patch;
      }
      
      public function set patch(value:uint) : void
      {
         this._patch = value;
      }
      
      public function get buildType() : uint
      {
         return this._buildType;
      }
      
      public function set buildType(value:uint) : void
      {
         this._buildType = value;
      }
      
      public function toString(environment:String = null) : String
      {
         var result:String = this._major + "." + this._minor + "." + this._release;
         if(this._buildType == 4)
         {
            return result + "-" + this._revision.toString(16) + "." + this._patch;
         }
         if(this._buildType == 5)
         {
            return result;
         }
         return result + (!!environment?"-" + environment:"") + "." + this._patch;
      }
      
      public function equals(otherVersion:Version) : Boolean
      {
         return this._major == otherVersion._major && this._minor == otherVersion._minor && this._release == otherVersion._release && this._revision == otherVersion._revision && this._patch == otherVersion._patch && this._buildType == otherVersion._buildType;
      }
      
      public function writeExternal(output:IDataOutput) : void
      {
         output.writeByte(this._major);
         output.writeByte(this._minor);
         output.writeByte(this._release);
         output.writeByte(this._revision);
         output.writeByte(this._patch);
         output.writeByte(this._buildType);
      }
      
      public function readExternal(input:IDataInput) : void
      {
         this._major = input.readUnsignedByte();
         this._minor = input.readUnsignedByte();
         this._release = input.readUnsignedByte();
         this._revision = input.readUnsignedByte();
         this._patch = input.readUnsignedByte();
         this._buildType = input.readUnsignedByte();
      }
   }
}
