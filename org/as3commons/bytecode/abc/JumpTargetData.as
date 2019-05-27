package org.as3commons.bytecode.abc
{
   import flash.errors.IllegalOperationError;
   import org.as3commons.bytecode.abc.enum.Opcode;
   
   public final class JumpTargetData
   {
       
      
      private var _jumpOpcode:Op;
      
      private var _targetOpcode:Op;
      
      private var _extraOpcodes:Vector.<Op>;
      
      public function JumpTargetData(jumpOp:Op = null, targetOp:Op = null)
      {
         super();
         this._jumpOpcode = jumpOp;
         this._targetOpcode = targetOp;
      }
      
      public function get extraOpcodes() : Vector.<Op>
      {
         return this._extraOpcodes;
      }
      
      public function get targetOpcode() : Op
      {
         return this._targetOpcode;
      }
      
      public function set targetOpcode(op:Op) : void
      {
         this._targetOpcode = op;
      }
      
      public function addTarget(targetOp:Op) : void
      {
         if(targetOp == null)
         {
            return;
         }
         this._extraOpcodes = this._extraOpcodes || new Vector.<Op>();
         this._extraOpcodes[this._extraOpcodes.length] = targetOp;
      }
      
      public function get jumpOpcode() : Op
      {
         return this._jumpOpcode;
      }
      
      public function set jumpOpcode(value:Op) : void
      {
         this._jumpOpcode = value;
         if(this._jumpOpcode != null && Opcode.jumpOpcodes[this._jumpOpcode.opcode] == null)
         {
            throw new IllegalOperationError("Opcode " + this._jumpOpcode.opcode.opcodeName + " is not a jump code");
         }
      }
   }
}
