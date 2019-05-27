package org.as3commons.bytecode.abc
{
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.IEquals;
   
   public class ExceptionInfo implements ICloneable, IEquals
   {
       
      
      public var exceptionEnabledFromCodePosition:int;
      
      public var exceptionEnabledFromOpcode:Op;
      
      public var exceptionEnabledToCodePosition:int;
      
      public var exceptionEnabledToOpcode:Op;
      
      public var codePositionToJumpToOnException:int;
      
      public var opcodeToJumpToOnException:Op;
      
      public var exceptionType:QualifiedName;
      
      public var variableReceivingException:QualifiedName;
      
      public function ExceptionInfo()
      {
         super();
      }
      
      public function clone() : *
      {
         var clone:ExceptionInfo = new ExceptionInfo();
         clone.exceptionEnabledFromCodePosition = this.exceptionEnabledFromCodePosition;
         clone.exceptionEnabledFromOpcode = this.exceptionEnabledFromOpcode.clone() as Op;
         clone.exceptionEnabledToCodePosition = this.exceptionEnabledToCodePosition;
         clone.exceptionEnabledToOpcode = this.exceptionEnabledToOpcode.clone() as Op;
         clone.codePositionToJumpToOnException = this.codePositionToJumpToOnException;
         clone.opcodeToJumpToOnException = this.opcodeToJumpToOnException.clone() as Op;
         clone.exceptionType = this.exceptionType.clone() as QualifiedName;
         clone.variableReceivingException = this.variableReceivingException.clone() as QualifiedName;
         return clone;
      }
      
      public function toString() : String
      {
         return "ExceptionInfo{exceptionEnabledFromCodePosition:" + this.exceptionEnabledFromCodePosition + ", exceptionEnabledToCodePosition:" + this.exceptionEnabledToCodePosition + ", codePositionToJumpToOnException:" + this.codePositionToJumpToOnException + ", exceptionTypeName:\"" + this.exceptionType + "\", nameOfVariableReceivingException:\"" + this.variableReceivingException + "\"}";
      }
      
      public function equals(other:Object) : Boolean
      {
         var otherInfo:ExceptionInfo = other as ExceptionInfo;
         if(otherInfo != null)
         {
            if(this.exceptionEnabledFromCodePosition != otherInfo.exceptionEnabledFromCodePosition)
            {
               return false;
            }
            if(!this.exceptionEnabledFromOpcode.equals(otherInfo.exceptionEnabledFromOpcode))
            {
               return false;
            }
            if(this.exceptionEnabledToCodePosition != otherInfo.exceptionEnabledToCodePosition)
            {
               return false;
            }
            if(!this.exceptionEnabledToOpcode.equals(otherInfo.exceptionEnabledToOpcode))
            {
               return false;
            }
            if(this.codePositionToJumpToOnException != otherInfo.codePositionToJumpToOnException)
            {
               return false;
            }
            if(!this.opcodeToJumpToOnException.equals(otherInfo.opcodeToJumpToOnException))
            {
               return false;
            }
            if(!this.exceptionType.equals(otherInfo.exceptionType))
            {
               return false;
            }
            if(!this.variableReceivingException.equals(otherInfo.variableReceivingException))
            {
               return false;
            }
            return true;
         }
         return false;
      }
   }
}
