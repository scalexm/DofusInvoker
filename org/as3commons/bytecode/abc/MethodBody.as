package org.as3commons.bytecode.abc
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import org.as3commons.bytecode.abc.enum.Opcode;
   import org.as3commons.bytecode.util.AbcFileUtil;
   import org.as3commons.bytecode.util.AbcSpec;
   import org.as3commons.lang.ICloneable;
   import org.as3commons.lang.IEquals;
   import org.as3commons.lang.StringUtils;
   
   public final class MethodBody implements ICloneable, IEquals
   {
       
      
      public var opcodes:Vector.<Op>;
      
      public var rawOpcodes:ByteArray;
      
      public var methodSignature:MethodInfo;
      
      public var maxStack:int = 1;
      
      public var localCount:int = 1;
      
      public var initScopeDepth:int = 1;
      
      public var maxScopeDepth:int = 1;
      
      public var exceptionInfos:Vector.<ExceptionInfo>;
      
      public var traits:Vector.<TraitInfo>;
      
      public var jumpTargets:Vector.<JumpTargetData>;
      
      public var opcodeBaseLocations:Dictionary;
      
      public function MethodBody()
      {
         super();
         this.opcodes = new Vector.<Op>();
         this.exceptionInfos = new Vector.<ExceptionInfo>();
         this.traits = new Vector.<TraitInfo>();
      }
      
      public function addExceptionInfo(exceptionInfo:ExceptionInfo) : uint
      {
         var idx:int = this.exceptionInfos.indexOf(exceptionInfo);
         if(idx < 0)
         {
            idx = this.exceptionInfos.push(exceptionInfo) - 1;
         }
         return idx;
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("\n\t{0}\n\t{\t\n\t\t//maxStack={1}, localCount={2}, initScopeDepth={3}, maxScopeDepth={4}\n\t\t{5}\n\t}\ntraits={6}",this.methodSignature,this.maxStack,this.localCount,this.initScopeDepth,this.maxScopeDepth,this.opcodes.join("\n\t\t"),this.traits.length == 0?"(no traits)":"[\n\t" + this.traits + "]\n");
      }
      
      public function clone() : *
      {
         var op:Op = null;
         var jumpIndex:int = 0;
         var targetIndex:int = 0;
         var targetOp:Op = null;
         var newJumpTargetData:JumpTargetData = null;
         var jumpTargetData:JumpTargetData = null;
         var clone:MethodBody = new MethodBody();
         clone.opcodes = AbcFileUtil.cloneVector(this.opcodes);
         if(this.rawOpcodes != null)
         {
            clone.rawOpcodes = AbcSpec.newByteArray();
            clone.rawOpcodes.writeBytes(this.rawOpcodes);
            clone.rawOpcodes.position = 0;
         }
         clone.maxStack = this.maxStack;
         clone.localCount = this.localCount;
         clone.initScopeDepth = this.initScopeDepth;
         clone.maxScopeDepth = this.maxScopeDepth;
         clone.jumpTargets = new Vector.<JumpTargetData>();
         for each(op in clone.opcodes)
         {
            if(op.opcode === Opcode.newcatch)
            {
               clone.exceptionInfos[clone.exceptionInfos.length] = op.parameters[0];
            }
         }
         for each(jumpTargetData in this.jumpTargets)
         {
            jumpIndex = this.opcodes.indexOf(jumpTargetData.jumpOpcode);
            targetIndex = this.opcodes.indexOf(jumpTargetData.targetOpcode);
            targetOp = targetIndex == -1?Opcode.END_OF_BODY.op():clone.opcodes[targetIndex];
            newJumpTargetData = new JumpTargetData(clone.opcodes[jumpIndex],targetOp);
            clone.jumpTargets[clone.jumpTargets.length] = newJumpTargetData;
            for each(op in jumpTargetData.extraOpcodes)
            {
               newJumpTargetData.addTarget(clone.opcodes[this.opcodes.indexOf(op)]);
            }
         }
         clone.traits = AbcFileUtil.cloneVector(this.traits);
         return clone;
      }
      
      public function equals(other:Object) : Boolean
      {
         var len:int = 0;
         var i:int = 0;
         var trait:TraitInfo = null;
         var otherTrait:TraitInfo = null;
         var len2:int = 0;
         var j:int = 0;
         var target:JumpTargetData = null;
         var otherTarget:JumpTargetData = null;
         var op:Op = null;
         var otherOp:Op = null;
         var otherBody:MethodBody = other as MethodBody;
         if(otherBody != null)
         {
            if(this.initScopeDepth != otherBody.initScopeDepth)
            {
               return false;
            }
            if(this.localCount != otherBody.localCount)
            {
               return false;
            }
            if(this.maxScopeDepth != otherBody.maxScopeDepth)
            {
               return false;
            }
            if(this.maxStack != otherBody.maxStack)
            {
               return false;
            }
            if(this.traits.length != otherBody.traits.length)
            {
               return false;
            }
            len = this.traits.length;
            for(i = 0; i < len; i++)
            {
               trait = this.traits[i];
               otherTrait = otherBody.traits[i];
               if(!trait.equals(otherTrait))
               {
                  return false;
               }
            }
            if(this.jumpTargets.length != otherBody.jumpTargets.length)
            {
               return false;
            }
            len = this.jumpTargets.length;
            for(i = 0; i < len; i++)
            {
               target = this.jumpTargets[i];
               otherTarget = otherBody.jumpTargets[i];
               if(target.extraOpcodes != null)
               {
                  if(otherTarget.extraOpcodes == null)
                  {
                     return false;
                  }
                  if(target.extraOpcodes.length != otherTarget.extraOpcodes.length)
                  {
                     return false;
                  }
                  len2 = target.extraOpcodes.length;
                  for(j = 0; j < len2; j++)
                  {
                     op = target.extraOpcodes[j];
                     otherOp = otherTarget.extraOpcodes[j];
                     if(!op.equals(otherOp))
                     {
                        return false;
                     }
                  }
               }
            }
            len = this.opcodes.length;
            for(i = 0; i < len; i++)
            {
               op = this.opcodes[i];
               otherOp = otherBody.opcodes[i];
               if(!op.equals(otherOp))
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
