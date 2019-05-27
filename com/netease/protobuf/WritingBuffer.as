package com.netease.protobuf
{
   import flash.errors.IllegalOperationError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataOutput;
   
   public final class WritingBuffer extends ByteArray
   {
       
      
      private const slices:Vector.<uint> = new Vector.<uint>();
      
      public function WritingBuffer()
      {
         super();
         endian = Endian.LITTLE_ENDIAN;
      }
      
      public function beginBlock() : uint
      {
         this.slices.push(position);
         var beginSliceIndex:uint = this.slices.length;
         this.slices.length = this.slices.length + 2;
         this.slices.push(position);
         return beginSliceIndex;
      }
      
      public function endBlock(beginSliceIndex:uint) : void
      {
         this.slices.push(position);
         var beginPosition:uint = this.slices[beginSliceIndex + 2];
         this.slices[beginSliceIndex] = position;
         WriteUtils.write_TYPE_UINT32(this,position - beginPosition);
         this.slices[beginSliceIndex + 1] = position;
         this.slices.push(position);
      }
      
      public function toNormal(output:IDataOutput) : void
      {
         var end:uint = 0;
         var i:uint = 0;
         var begin:uint = 0;
         while(i < this.slices.length)
         {
            end = this.slices[i];
            i++;
            if(end > begin)
            {
               output.writeBytes(this,begin,end - begin);
            }
            else if(end < begin)
            {
               throw new IllegalOperationError();
            }
            begin = this.slices[i];
            i++;
         }
         output.writeBytes(this,begin);
      }
   }
}
