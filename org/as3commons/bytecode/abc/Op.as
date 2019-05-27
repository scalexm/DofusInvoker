package org.as3commons.bytecode.abc
{
   import flash.errors.IllegalOperationError;
   import org.as3commons.bytecode.abc.enum.Opcode;
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.IEquals;
   import org.as3commons.lang.StringUtils;
   
   public final class Op implements ICloneable, IEquals
   {
      
      private static const ARGUMENT_TYPE_ERROR:String = "Wrong opcode argument type for opcode {0}, expected {1}, but got {2}";
      
      private static const OBJECT_TYPE_NAME:String = "object";
       
      
      private var _parameters:Array;
      
      private var _opcode:Opcode;
      
      public var baseLocation:uint;
      
      public var endLocation:uint;
      
      public function Op(opcode:Opcode, parameters:Array = null)
      {
         super();
         this._opcode = opcode;
         this._parameters = parameters = parameters || [];
      }
      
      public static function checkParameters(parameters:Array, opcode:Opcode) : void
      {
         var len:uint = 0;
         var i:uint = 0;
         if(parameters.length > 0)
         {
            len = parameters.length;
            for(i = 0; i < len; i++)
            {
               if(!compareTypes(parameters[i],opcode.argumentTypes[i][0]))
               {
                  throw new IllegalOperationError(StringUtils.substitute(ARGUMENT_TYPE_ERROR,opcode,opcode.argumentTypes[i][0],parameters[i]));
               }
            }
         }
      }
      
      private static function compareTypes(instance:*, type:*) : Boolean
      {
         if(type === int || type === Integer)
         {
            return instance is int;
         }
         if(type === uint || type === UnsignedInteger)
         {
            return instance is uint;
         }
         if(type === Number)
         {
            return instance is Number;
         }
         if(type === String)
         {
            return instance is String;
         }
         if(type === Array)
         {
            return instance is Array;
         }
         if(type !== ExceptionInfo)
         {
            return instance is type;
         }
         return true;
      }
      
      public function clone() : *
      {
         var obj:* = undefined;
         var clone:Op = null;
         var params:Array = [];
         for each(obj in this._parameters)
         {
            if(obj is ICloneable)
            {
               params[params.length] = ICloneable(obj).clone();
            }
            else
            {
               params[params.length] = obj;
            }
         }
         clone = this._opcode.op(params);
         clone.baseLocation = this.baseLocation;
         return clone;
      }
      
      public function get parameters() : Array
      {
         return this._parameters;
      }
      
      public function get opcode() : Opcode
      {
         return this._opcode;
      }
      
      public function toString() : String
      {
         return this.baseLocation + ":" + this._opcode.opcodeName + "\t\t" + (this._parameters.length > 0?"[" + this._parameters.join(", ") + "]:":":") + this.endLocation;
      }
      
      public function equals(other:Object) : Boolean
      {
         var len:int = 0;
         var i:int = 0;
         var param:* = undefined;
         var otherParam:* = undefined;
         var otherOp:Op = other as Op;
         if(otherOp != null)
         {
            if(this._opcode.opcodeName != otherOp.opcode.opcodeName)
            {
               return false;
            }
            if(this.parameters.length != otherOp.parameters.length)
            {
               return false;
            }
            len = this.parameters.length;
            for(i = 0; i < len; i++)
            {
               param = this.parameters[i];
               otherParam = otherOp.parameters[i];
               if(param is IEquals)
               {
                  if(!IEquals(param).equals(otherParam))
                  {
                     return false;
                  }
               }
               else if(param != otherParam)
               {
                  return false;
               }
            }
            return true;
         }
         return false;
      }
   }
}
