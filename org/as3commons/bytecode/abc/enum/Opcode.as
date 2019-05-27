package org.as3commons.bytecode.abc.enum
{
   import flash.errors.IllegalOperationError;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import org.as3commons.bytecode.abc.AbcFile;
   import org.as3commons.bytecode.abc.BaseMultiname;
   import org.as3commons.bytecode.abc.ByteCodeErrorEvent;
   import org.as3commons.bytecode.abc.ClassInfo;
   import org.as3commons.bytecode.abc.ExceptionInfo;
   import org.as3commons.bytecode.abc.IConstantPool;
   import org.as3commons.bytecode.abc.Integer;
   import org.as3commons.bytecode.abc.JumpTargetData;
   import org.as3commons.bytecode.abc.LNamespace;
   import org.as3commons.bytecode.abc.MethodBody;
   import org.as3commons.bytecode.abc.Op;
   import org.as3commons.bytecode.abc.UnsignedInteger;
   import org.as3commons.bytecode.emit.asm.ClassInfoReference;
   import org.as3commons.bytecode.util.AbcSpec;
   import org.as3commons.bytecode.util.ReadWritePair;
   import org.as3commons.lang.StringUtils;
   
   public final class Opcode
   {
      
      private static var _enumCreated:Boolean = false;
      
      private static const _ALL_OPCODES:Dictionary = new Dictionary();
      
      private static const _opcodeNameLookup:Dictionary = new Dictionary();
      
      public static const errorDispatcher:IEventDispatcher = new EventDispatcher();
      
      public static const add:Opcode = new Opcode(160,"add");
      
      public static const add_d:Opcode = new Opcode(155,"add_d");
      
      public static const add_i:Opcode = new Opcode(197,"add_i");
      
      public static const applytype:Opcode = new Opcode(83,"applytype",[int,AbcSpec.U30]);
      
      public static const astype:Opcode = new Opcode(134,"astype",[BaseMultiname,AbcSpec.U30]);
      
      public static const astypelate:Opcode = new Opcode(135,"astypelate");
      
      public static const bitand:Opcode = new Opcode(168,"bitand");
      
      public static const bitnot:Opcode = new Opcode(151,"bitnot");
      
      public static const bitor:Opcode = new Opcode(169,"bitor");
      
      public static const bitxor:Opcode = new Opcode(170,"bitxor");
      
      public static const bkpt:Opcode = new Opcode(1,"bkpt");
      
      public static const bkptline:Opcode = new Opcode(242,"bkptline",[Integer,AbcSpec.U30]);
      
      public static const call:Opcode = new Opcode(65,"call",[int,AbcSpec.U30]);
      
      public static const callinterface:Opcode = new Opcode(77,"callinterface",[BaseMultiname,AbcSpec.U30],[int,AbcSpec.U30]);
      
      public static const callmethod:Opcode = new Opcode(67,"callmethod",[int,AbcSpec.U30],[int,AbcSpec.U30]);
      
      public static const callproperty:Opcode = new Opcode(70,"callproperty",[BaseMultiname,AbcSpec.U30],[int,AbcSpec.U30]);
      
      public static const callproplex:Opcode = new Opcode(76,"callproplex",[BaseMultiname,AbcSpec.U30],[int,AbcSpec.U30]);
      
      public static const callpropvoid:Opcode = new Opcode(79,"callpropvoid",[BaseMultiname,AbcSpec.U30],[int,AbcSpec.U30]);
      
      public static const callstatic:Opcode = new Opcode(68,"callstatic",[int,AbcSpec.U30],[int,AbcSpec.U30]);
      
      public static const callsuper:Opcode = new Opcode(69,"callsuper",[BaseMultiname,AbcSpec.U30],[int,AbcSpec.U30]);
      
      public static const callsuperid:Opcode = new Opcode(75,"callsuperid");
      
      public static const callsupervoid:Opcode = new Opcode(78,"callsupervoid",[BaseMultiname,AbcSpec.U30],[int,AbcSpec.U30]);
      
      public static const checkfilter:Opcode = new Opcode(120,"checkfilter");
      
      public static const coerce:Opcode = new Opcode(128,"coerce",[BaseMultiname,AbcSpec.U30]);
      
      public static const coerce_a:Opcode = new Opcode(130,"coerce_a");
      
      public static const coerce_b:Opcode = new Opcode(129,"coerce_b");
      
      public static const coerce_d:Opcode = new Opcode(132,"coerce_d");
      
      public static const coerce_i:Opcode = new Opcode(131,"coerce_i");
      
      public static const coerce_o:Opcode = new Opcode(137,"coerce_o");
      
      public static const coerce_s:Opcode = new Opcode(133,"coerce_s");
      
      public static const coerce_u:Opcode = new Opcode(136,"coerce_u");
      
      public static const concat:Opcode = new Opcode(154,"concat");
      
      public static const construct:Opcode = new Opcode(66,"construct",[int,AbcSpec.U30]);
      
      public static const constructprop:Opcode = new Opcode(74,"constructprop",[BaseMultiname,AbcSpec.U30],[int,AbcSpec.U30]);
      
      public static const constructsuper:Opcode = new Opcode(73,"constructsuper",[int,AbcSpec.U30]);
      
      public static const convert_b:Opcode = new Opcode(118,"convert_b");
      
      public static const convert_d:Opcode = new Opcode(117,"convert_d");
      
      public static const convert_i:Opcode = new Opcode(115,"convert_i");
      
      public static const convert_o:Opcode = new Opcode(119,"convert_o");
      
      public static const convert_s:Opcode = new Opcode(112,"convert_s");
      
      public static const convert_u:Opcode = new Opcode(116,"convert_u");
      
      public static const debug:Opcode = new Opcode(239,"debug",[uint,AbcSpec.U8],[int,AbcSpec.U30],[uint,AbcSpec.U8],[int,AbcSpec.U30]);
      
      public static const debugfile:Opcode = new Opcode(241,"debugfile",[String,AbcSpec.U30]);
      
      public static const debugline:Opcode = new Opcode(240,"debugline",[int,AbcSpec.U30]);
      
      public static const declocal:Opcode = new Opcode(148,"declocal",[int,AbcSpec.U30]);
      
      public static const declocal_i:Opcode = new Opcode(195,"declocal_i",[int,AbcSpec.U30]);
      
      public static const decrement:Opcode = new Opcode(147,"decrement");
      
      public static const decrement_i:Opcode = new Opcode(193,"decrement_i");
      
      public static const deleteproperty:Opcode = new Opcode(106,"deleteproperty",[BaseMultiname,AbcSpec.U30]);
      
      public static const deletepropertylate:Opcode = new Opcode(107,"deletepropertylate");
      
      public static const divide:Opcode = new Opcode(163,"divide");
      
      public static const dup:Opcode = new Opcode(42,"dup");
      
      public static const dxns:Opcode = new Opcode(6,"dxns",[String,AbcSpec.U30]);
      
      public static const dxnslate:Opcode = new Opcode(7,"dxnslate");
      
      public static const equals:Opcode = new Opcode(171,"equals");
      
      public static const esc_xattr:Opcode = new Opcode(114,"esc_xattr");
      
      public static const esc_xelem:Opcode = new Opcode(113,"esc_xelem");
      
      public static const finddef:Opcode = new Opcode(95,"finddef",[BaseMultiname,AbcSpec.U30]);
      
      public static const findproperty:Opcode = new Opcode(94,"findproperty",[BaseMultiname,AbcSpec.U30]);
      
      public static const findpropglobal:Opcode = new Opcode(92,"findpropglobal",[BaseMultiname,AbcSpec.U30]);
      
      public static const findpropglobalstrict:Opcode = new Opcode(91,"findpropglobalstrict",[BaseMultiname,AbcSpec.U30]);
      
      public static const findpropstrict:Opcode = new Opcode(93,"findpropstrict",[BaseMultiname,AbcSpec.U30]);
      
      public static const getdescendants:Opcode = new Opcode(89,"getdescendants",[BaseMultiname,AbcSpec.U30]);
      
      public static const getglobalscope:Opcode = new Opcode(100,"getglobalscope");
      
      public static const getglobalslot:Opcode = new Opcode(110,"getglobalslot",[int,AbcSpec.U30]);
      
      public static const getlex:Opcode = new Opcode(96,"getlex",[BaseMultiname,AbcSpec.U30]);
      
      public static const getlocal:Opcode = new Opcode(98,"getlocal",[int,AbcSpec.U30]);
      
      public static const getlocal_0:Opcode = new Opcode(208,"getlocal_0");
      
      public static const getlocal_1:Opcode = new Opcode(209,"getlocal_1");
      
      public static const getlocal_2:Opcode = new Opcode(210,"getlocal_2");
      
      public static const getlocal_3:Opcode = new Opcode(211,"getlocal_3");
      
      public static const getouterscope:Opcode = new Opcode(103,"getouterscope",[int,AbcSpec.U30]);
      
      public static const getproperty:Opcode = new Opcode(102,"getproperty",[BaseMultiname,AbcSpec.U30]);
      
      public static const getscopeobject:Opcode = new Opcode(101,"getscopeobject",[int,AbcSpec.U8]);
      
      public static const getslot:Opcode = new Opcode(108,"getslot",[int,AbcSpec.U30]);
      
      public static const getsuper:Opcode = new Opcode(4,"getsuper",[BaseMultiname,AbcSpec.U30]);
      
      public static const greaterequals:Opcode = new Opcode(176,"greaterequals");
      
      public static const greaterthan:Opcode = new Opcode(175,"greaterthan");
      
      public static const hasnext2:Opcode = new Opcode(50,"hasnext2",[int,AbcSpec.U30],[int,AbcSpec.U30]);
      
      public static const hasnext:Opcode = new Opcode(31,"hasnext");
      
      public static const ifeq:Opcode = new Opcode(19,"ifeq",[int,AbcSpec.S24]);
      
      public static const iffalse:Opcode = new Opcode(18,"iffalse",[int,AbcSpec.S24]);
      
      public static const ifge:Opcode = new Opcode(24,"ifge",[int,AbcSpec.S24]);
      
      public static const ifgt:Opcode = new Opcode(23,"ifgt",[int,AbcSpec.S24]);
      
      public static const ifle:Opcode = new Opcode(22,"ifle",[int,AbcSpec.S24]);
      
      public static const iflt:Opcode = new Opcode(21,"iflt",[int,AbcSpec.S24]);
      
      public static const ifne:Opcode = new Opcode(20,"ifne",[int,AbcSpec.S24]);
      
      public static const ifnge:Opcode = new Opcode(15,"ifnge",[int,AbcSpec.S24]);
      
      public static const ifngt:Opcode = new Opcode(14,"ifngt",[int,AbcSpec.S24]);
      
      public static const ifnle:Opcode = new Opcode(13,"ifnle",[int,AbcSpec.S24]);
      
      public static const ifnlt:Opcode = new Opcode(12,"ifnlt",[int,AbcSpec.S24]);
      
      public static const ifstricteq:Opcode = new Opcode(25,"ifstricteq",[int,AbcSpec.S24]);
      
      public static const ifstrictne:Opcode = new Opcode(26,"ifstrictne",[int,AbcSpec.S24]);
      
      public static const iftrue:Opcode = new Opcode(17,"iftrue",[int,AbcSpec.S24]);
      
      public static const in_op:Opcode = new Opcode(180,"in");
      
      public static const inclocal:Opcode = new Opcode(146,"inclocal",[int,AbcSpec.U30]);
      
      public static const inclocal_i:Opcode = new Opcode(194,"inclocal_i",[int,AbcSpec.U30]);
      
      public static const increment:Opcode = new Opcode(145,"increment");
      
      public static const increment_i:Opcode = new Opcode(192,"increment_i");
      
      public static const initproperty:Opcode = new Opcode(104,"initproperty",[BaseMultiname,AbcSpec.U30]);
      
      public static const instance_of:Opcode = new Opcode(177,"instance_of");
      
      public static const istype:Opcode = new Opcode(178,"istype",[BaseMultiname,AbcSpec.U30]);
      
      public static const istypelate:Opcode = new Opcode(179,"istypelate");
      
      public static const jump:Opcode = new Opcode(16,"jump",[int,AbcSpec.S24]);
      
      public static const kill:Opcode = new Opcode(8,"kill",[int,AbcSpec.U30]);
      
      public static const label:Opcode = new Opcode(9,"label");
      
      public static const lessequals:Opcode = new Opcode(174,"lessequals");
      
      public static const lessthan:Opcode = new Opcode(173,"lessthan");
      
      public static const lookupswitch:Opcode = new Opcode(27,"lookupswitch",[int,AbcSpec.S24],[int,AbcSpec.U30],[Array,AbcSpec.S24_ARRAY]);
      
      public static const lshift:Opcode = new Opcode(165,"lshift");
      
      public static const modulo:Opcode = new Opcode(164,"modulo");
      
      public static const multiply:Opcode = new Opcode(162,"multiply");
      
      public static const multiply_i:Opcode = new Opcode(199,"multiply_i");
      
      public static const negate:Opcode = new Opcode(144,"negate");
      
      public static const negate_i:Opcode = new Opcode(196,"negate_i");
      
      public static const newactivation:Opcode = new Opcode(87,"newactivation");
      
      public static const newarray:Opcode = new Opcode(86,"newarray",[int,AbcSpec.U30]);
      
      public static const newcatch:Opcode = new Opcode(90,"newcatch",[ExceptionInfo,AbcSpec.U30]);
      
      public static const newclass:Opcode = new Opcode(88,"newclass",[ClassInfo,AbcSpec.U30]);
      
      public static const newfunction:Opcode = new Opcode(64,"newfunction",[int,AbcSpec.U30]);
      
      public static const newobject:Opcode = new Opcode(85,"newobject",[int,AbcSpec.U30]);
      
      public static const nextname:Opcode = new Opcode(30,"nextname");
      
      public static const nextvalue:Opcode = new Opcode(35,"nextvalue");
      
      public static const nop:Opcode = new Opcode(2,"nop");
      
      public static const not:Opcode = new Opcode(150,"not");
      
      public static const pop:Opcode = new Opcode(41,"pop");
      
      public static const popscope:Opcode = new Opcode(29,"popscope");
      
      public static const pushbyte:Opcode = new Opcode(36,"pushbyte",[int,AbcSpec.UNSIGNED_BYTE]);
      
      public static const pushconstant:Opcode = new Opcode(34,"pushconstant",[String,AbcSpec.U30]);
      
      public static const pushdecimal:Opcode = new Opcode(51,"pushdecimal",[Number,AbcSpec.U30]);
      
      public static const pushdnan:Opcode = new Opcode(52,"pushdnan");
      
      public static const pushdouble:Opcode = new Opcode(47,"pushdouble",[Number,AbcSpec.U30]);
      
      public static const pushfalse:Opcode = new Opcode(39,"pushfalse");
      
      public static const pushint:Opcode = new Opcode(45,"pushint",[Integer,AbcSpec.U30]);
      
      public static const pushnamespace:Opcode = new Opcode(49,"pushnamespace",[LNamespace,AbcSpec.U30]);
      
      public static const pushnan:Opcode = new Opcode(40,"pushnan");
      
      public static const pushnull:Opcode = new Opcode(32,"pushnull");
      
      public static const pushscope:Opcode = new Opcode(48,"pushscope");
      
      public static const pushshort:Opcode = new Opcode(37,"pushshort",[int,AbcSpec.S32]);
      
      public static const pushstring:Opcode = new Opcode(44,"pushstring",[String,AbcSpec.U30]);
      
      public static const pushtrue:Opcode = new Opcode(38,"pushtrue");
      
      public static const pushuint:Opcode = new Opcode(46,"pushuint",[UnsignedInteger,AbcSpec.U30]);
      
      public static const pushundefined:Opcode = new Opcode(33,"pushundefined");
      
      public static const pushwith:Opcode = new Opcode(28,"pushwith");
      
      public static const returnvalue:Opcode = new Opcode(72,"returnvalue");
      
      public static const returnvoid:Opcode = new Opcode(71,"returnvoid");
      
      public static const rshift:Opcode = new Opcode(166,"rshift");
      
      public static const setglobalslot:Opcode = new Opcode(111,"setglobalslot",[int,AbcSpec.U30]);
      
      public static const setlocal:Opcode = new Opcode(99,"setlocal",[int,AbcSpec.U30]);
      
      public static const setlocal_0:Opcode = new Opcode(212,"setlocal_0");
      
      public static const setlocal_1:Opcode = new Opcode(213,"setlocal_1");
      
      public static const setlocal_2:Opcode = new Opcode(214,"setlocal_2");
      
      public static const setlocal_3:Opcode = new Opcode(215,"setlocal_3");
      
      public static const setproperty:Opcode = new Opcode(97,"setproperty",[BaseMultiname,AbcSpec.U30]);
      
      public static const setpropertylate:Opcode = new Opcode(105,"setpropertylate");
      
      public static const setslot:Opcode = new Opcode(109,"setslot",[int,AbcSpec.U30]);
      
      public static const setsuper:Opcode = new Opcode(5,"setsuper",[BaseMultiname,AbcSpec.U30]);
      
      public static const strictequals:Opcode = new Opcode(172,"strictequals");
      
      public static const subtract:Opcode = new Opcode(161,"subtract");
      
      public static const subtract_i:Opcode = new Opcode(198,"subtract_i");
      
      public static const swap:Opcode = new Opcode(43,"swap");
      
      public static const throw_op:Opcode = new Opcode(3,"throw");
      
      public static const typeof_op:Opcode = new Opcode(149,"typeof");
      
      public static const urshift:Opcode = new Opcode(167,"urshift");
      
      public static const si8:Opcode = new Opcode(58,"si8");
      
      public static const si16:Opcode = new Opcode(59,"si16");
      
      public static const si32:Opcode = new Opcode(60,"si32");
      
      public static const sf32:Opcode = new Opcode(61,"sf32");
      
      public static const sf64:Opcode = new Opcode(62,"sf64");
      
      public static const li8:Opcode = new Opcode(53,"li8");
      
      public static const li16:Opcode = new Opcode(54,"li16");
      
      public static const li32:Opcode = new Opcode(55,"li32");
      
      public static const lf32:Opcode = new Opcode(56,"lf32");
      
      public static const lf64:Opcode = new Opcode(57,"lf64");
      
      public static const sxi1:Opcode = new Opcode(80,"sxi1");
      
      public static const sxi8:Opcode = new Opcode(81,"sxi8");
      
      public static const sxi16:Opcode = new Opcode(82,"sxi16");
      
      public static const END_OF_BODY:Opcode = new Opcode(int.MIN_VALUE,"endOfBody");
      
      private static const UNKNOWN_OPCODE_ARGUMENTTYPE:String = "Unknown Opcode argument type. {0}";
      
      private static var _jumpLookup:Dictionary;
      
      public static const jumpOpcodes:Dictionary = new Dictionary();
      
      {
         jumpOpcodes[ifeq] = true;
         jumpOpcodes[ifge] = true;
         jumpOpcodes[ifgt] = true;
         jumpOpcodes[ifle] = true;
         jumpOpcodes[iflt] = true;
         jumpOpcodes[ifne] = true;
         jumpOpcodes[ifnge] = true;
         jumpOpcodes[ifngt] = true;
         jumpOpcodes[ifnle] = true;
         jumpOpcodes[ifnlt] = true;
         jumpOpcodes[ifstricteq] = true;
         jumpOpcodes[ifstrictne] = true;
         jumpOpcodes[iffalse] = true;
         jumpOpcodes[iftrue] = true;
         jumpOpcodes[jump] = true;
         jumpOpcodes[lookupswitch] = true;
         _enumCreated = true;
      }
      
      private var _opcodeName:String;
      
      private var _value:int;
      
      private var _argumentTypes:Array;
      
      public function Opcode(opcodeValue:int, opcodeName:String, ... typeAndReadWritePairs)
      {
         super();
         this._value = opcodeValue;
         this._opcodeName = opcodeName;
         this._argumentTypes = typeAndReadWritePairs;
         if(_ALL_OPCODES[this._value] == null)
         {
            _ALL_OPCODES[this._value] = this;
            _opcodeNameLookup[opcodeName] = this;
            return;
         }
         throw new IllegalOperationError("duplicate! " + opcodeName + " : " + Opcode(_ALL_OPCODES[this._value]).opcodeName);
      }
      
      public static function fromName(opcodeName:String) : Opcode
      {
         return _opcodeNameLookup[opcodeName] as Opcode;
      }
      
      public static function serialize(ops:Vector.<Op>, methodBody:MethodBody, abcFile:AbcFile) : ByteArray
      {
         var op:Op = null;
         var opcodePositions:Dictionary = new Dictionary();
         var serializedOpcodes:ByteArray = AbcSpec.newByteArray();
         for each(op in ops)
         {
            op.baseLocation = serializedOpcodes.position;
            opcodePositions[op] = serializedOpcodes.position;
            AbcSpec.writeU8(op.opcode._value,serializedOpcodes);
            serializeOpcodeArguments(op,abcFile,methodBody,serializedOpcodes);
            op.endLocation = serializedOpcodes.position;
         }
         serializedOpcodes.position = 0;
         resolveJumpTargets(serializedOpcodes,methodBody.jumpTargets,opcodePositions);
         serializedOpcodes.position = 0;
         methodBody.opcodeBaseLocations = opcodePositions;
         return serializedOpcodes;
      }
      
      public static function resolveJumpTargets(serializedOpcodes:ByteArray, backPatches:Vector.<JumpTargetData>, positions:Dictionary) : void
      {
         var jumpData:JumpTargetData = null;
         var changed:Boolean = false;
         var idx:int = 0;
         var targetOpcode:Op = null;
         for each(jumpData in backPatches)
         {
            changed = false;
            if(jumpData.targetOpcode != null)
            {
               if(resolveJumpTarget(positions,jumpData.jumpOpcode,jumpData.targetOpcode,serializedOpcodes,jumpData.jumpOpcode.opcode === Opcode.lookupswitch) == true)
               {
                  changed = true;
               }
            }
            if(jumpData.extraOpcodes != null)
            {
               idx = 0;
               for each(targetOpcode in jumpData.extraOpcodes)
               {
                  if(resolveJumpTarget(positions,jumpData.jumpOpcode,targetOpcode,serializedOpcodes,true,idx++))
                  {
                     changed = true;
                  }
               }
            }
         }
      }
      
      public static function resolveJumpTarget(positions:Dictionary, jumpOpcode:Op, targetOpcode:Op, serializedOpcodes:ByteArray, isLookupSwitch:Boolean = false, index:int = -1) : Boolean
      {
         var operandPos:int = 0;
         var newJump:int = 0;
         var jumpParam:int = index < 0?int(int(jumpOpcode.parameters[0])):int(jumpOpcode.parameters[2][index]);
         var baseLocation:int = !!isLookupSwitch?int(jumpOpcode.baseLocation):int(jumpOpcode.endLocation);
         var targetPos:int = baseLocation + jumpParam;
         if(targetPos != targetOpcode.baseLocation)
         {
            operandPos = jumpOpcode.baseLocation;
            newJump = targetOpcode.baseLocation - baseLocation;
            serializedOpcodes.position = operandPos + 1;
            if(index > -1)
            {
               AbcSpec.readU30(serializedOpcodes);
            }
            while(index-- > 0)
            {
               AbcSpec.readS24(serializedOpcodes);
            }
            AbcSpec.writeS24(newJump,serializedOpcodes);
            return true;
         }
         return false;
      }
      
      public static function serializeOpcodeArguments(op:Op, abcFile:AbcFile, methodBody:MethodBody, serializedOpcodes:ByteArray) : void
      {
         var typeAndReadWritePair:Array = null;
         var argumentType:* = undefined;
         var readWritePair:ReadWritePair = null;
         var rawValue:* = undefined;
         var serializedArgumentCount:int = 0;
         for each(typeAndReadWritePair in op.opcode.argumentTypes)
         {
            argumentType = typeAndReadWritePair[0];
            readWritePair = typeAndReadWritePair[1];
            rawValue = op.parameters[serializedArgumentCount++];
            serializeOpcodeArgument(rawValue,argumentType,abcFile,methodBody,op,serializedOpcodes,readWritePair);
         }
      }
      
      public static function serializeOpcodeArgument(rawValue:*, argumentType:*, abcFile:AbcFile, methodBody:MethodBody, op:Op, serializedOpcodes:ByteArray, readWritePair:ReadWritePair) : void
      {
         var arr:Array = null;
         var caseCount:int = 0;
         var i:int = 0;
         var abcCompatibleValue:* = rawValue;
         switch(argumentType)
         {
            case uint:
            case int:
               abcCompatibleValue = rawValue;
               break;
            case Integer:
               abcCompatibleValue = abcFile.constantPool.addInt(rawValue);
               break;
            case UnsignedInteger:
               abcCompatibleValue = abcFile.constantPool.addUint(rawValue);
               break;
            case Number:
               abcCompatibleValue = abcFile.constantPool.addDouble(rawValue);
               break;
            case BaseMultiname:
               abcCompatibleValue = abcFile.constantPool.addMultiname(rawValue);
               break;
            case ClassInfo:
               if(rawValue is ClassInfoReference)
               {
                  abcCompatibleValue = abcFile.addClassInfoReference(rawValue);
               }
               else
               {
                  abcCompatibleValue = abcFile.addClassInfo(rawValue);
               }
               break;
            case String:
               abcCompatibleValue = abcFile.constantPool.addString(rawValue);
               break;
            case LNamespace:
               abcCompatibleValue = abcFile.constantPool.addNamespace(rawValue);
               break;
            case ExceptionInfo:
               abcCompatibleValue = methodBody.addExceptionInfo(rawValue);
               break;
            case Array:
               arr = rawValue as Array;
               caseCount = arr.length;
               for(i = 0; i < caseCount; i++)
               {
                  readWritePair.write(arr[i],serializedOpcodes);
               }
               break;
            default:
               throw new Error(StringUtils.substitute(UNKNOWN_OPCODE_ARGUMENTTYPE,Number(argumentType)));
         }
         try
         {
            if(!(abcCompatibleValue is Array))
            {
               readWritePair.write(abcCompatibleValue,serializedOpcodes);
            }
         }
         catch(e:Error)
         {
            trace(e);
         }
      }
      
      public static function parse(byteArray:ByteArray, opcodeByteCodeLength:int, methodBody:MethodBody, constantPool:IConstantPool) : Vector.<Op>
      {
         var methodBodyPosition:uint = 0;
         var newOp:Op = null;
         var pos:int = 0;
         var fragment:ByteArray = null;
         var opcodePositions:Dictionary = new Dictionary();
         var opcodeEndPositions:Dictionary = new Dictionary();
         var ops:Vector.<Op> = new Vector.<Op>();
         methodBody.jumpTargets = methodBody.jumpTargets || new Vector.<JumpTargetData>();
         methodBodyPosition = byteArray.position;
         var opcodeStartPosition:uint = 0;
         var offset:uint = 0;
         var positionAtEndOfBytecode:int = byteArray.position + opcodeByteCodeLength;
         try
         {
            while(byteArray.position < positionAtEndOfBytecode)
            {
               opcodeStartPosition = byteArray.position;
               newOp = parseOpcode(byteArray,constantPool,ops,methodBody);
               newOp.baseLocation = offset;
               offset = offset + (byteArray.position - opcodeStartPosition);
               newOp.endLocation = offset;
               opcodePositions[newOp.baseLocation] = newOp;
               opcodeEndPositions[newOp.endLocation] = newOp;
            }
            if(byteArray.position > positionAtEndOfBytecode)
            {
               throw new Error("Opcode parsing read beyond end of method body");
            }
         }
         catch(e:*)
         {
            pos = byteArray.position - methodBodyPosition;
            fragment = AbcSpec.newByteArray();
            fragment.writeBytes(byteArray,methodBodyPosition,opcodeByteCodeLength);
            fragment.position = 0;
            errorDispatcher.dispatchEvent(new ByteCodeErrorEvent(ByteCodeErrorEvent.BYTECODE_METHODBODY_ERROR,fragment,pos));
            throw e;
         }
         resolveParsedJumpTargets(methodBody,opcodePositions,opcodeEndPositions,opcodeByteCodeLength);
         methodBody.opcodeBaseLocations = opcodePositions;
         return ops;
      }
      
      public static function resolveParsedJumpTargets(methodBody:MethodBody, opcodeStartPositions:Dictionary, opcodeEndPositions:Dictionary, positionAtEndOfMethodBody:int) : void
      {
         var pos:int = 0;
         var targetPos:int = 0;
         var target:Op = null;
         var len:int = 0;
         var arr:Array = null;
         var jmpTarget:JumpTargetData = null;
         var i:int = 0;
         for each(jmpTarget in methodBody.jumpTargets)
         {
            if(jmpTarget.jumpOpcode.opcode !== Opcode.lookupswitch)
            {
               pos = int(jmpTarget.jumpOpcode.parameters[0]);
               targetPos = jmpTarget.jumpOpcode.endLocation + pos;
               target = opcodeStartPositions[targetPos];
               if(target == null)
               {
                  target = Opcode.END_OF_BODY.op();
                  target.baseLocation = positionAtEndOfMethodBody;
               }
               jmpTarget.targetOpcode = target;
            }
            else
            {
               arr = jmpTarget.jumpOpcode.parameters[2] as Array;
               len = arr.length;
               for(i = 0; i < len; i++)
               {
                  pos = arr[i];
                  targetPos = jmpTarget.jumpOpcode.baseLocation + pos;
                  target = opcodeStartPositions[targetPos];
                  if(target == null)
                  {
                     target = Opcode.END_OF_BODY.op();
                     target.baseLocation = positionAtEndOfMethodBody;
                  }
                  jmpTarget.addTarget(target);
               }
               pos = jmpTarget.jumpOpcode.parameters[0];
               targetPos = jmpTarget.jumpOpcode.baseLocation + pos;
               target = opcodeStartPositions[targetPos];
               if(target == null)
               {
                  target = Opcode.END_OF_BODY.op();
                  target.baseLocation = positionAtEndOfMethodBody;
               }
               jmpTarget.targetOpcode = target;
            }
         }
      }
      
      public static function parseOpcode(byteArray:ByteArray, constantPool:IConstantPool, ops:Vector.<Op>, methodBody:MethodBody) : Op
      {
         var argument:* = undefined;
         var endPos:int = 0;
         var op:Op = null;
         var startPos:int = byteArray.position;
         var opcode:Opcode = determineOpcode(AbcSpec.readU8(byteArray));
         var argumentValues:Array = [];
         for each(argument in opcode.argumentTypes)
         {
            parseOpcodeArguments(argument,byteArray,constantPool,methodBody,argumentValues);
         }
         endPos = byteArray.position;
         op = opcode.op(argumentValues);
         ops[ops.length] = op;
         if(jumpOpcodes[opcode] == true)
         {
            methodBody.jumpTargets[methodBody.jumpTargets.length] = new JumpTargetData(op);
         }
         return op;
      }
      
      public static function parseOpcodeArguments(argument:*, byteArray:ByteArray, constantPool:IConstantPool, methodBody:MethodBody, argumentValues:Array) : void
      {
         var constantPoolValue:* = undefined;
         var caseOffsets:Array = null;
         var caseCount:int = 0;
         var i:int = 0;
         var argumentType:* = argument[0];
         var readWritePair:ReadWritePair = argument[1];
         var byteCodeValue:* = readWritePair.read(byteArray);
         switch(argumentType)
         {
            case uint:
            case int:
               argumentValues[argumentValues.length] = byteCodeValue;
               break;
            case Integer:
               constantPoolValue = constantPool.integerPool[byteCodeValue];
               argumentValues[argumentValues.length] = constantPoolValue;
               break;
            case UnsignedInteger:
               constantPoolValue = constantPool.uintPool[byteCodeValue];
               argumentValues[argumentValues.length] = constantPoolValue;
               break;
            case Number:
               constantPoolValue = constantPool.doublePool[byteCodeValue];
               argumentValues[argumentValues.length] = constantPoolValue;
               break;
            case BaseMultiname:
               constantPoolValue = constantPool.multinamePool[byteCodeValue];
               argumentValues[argumentValues.length] = constantPoolValue;
               break;
            case ClassInfo:
               constantPoolValue = constantPool.classInfo[byteCodeValue];
               argumentValues[argumentValues.length] = constantPoolValue;
               break;
            case String:
               constantPoolValue = constantPool.stringPool[byteCodeValue];
               argumentValues[argumentValues.length] = constantPoolValue;
               break;
            case LNamespace:
               constantPoolValue = constantPool.namespacePool[byteCodeValue];
               argumentValues[argumentValues.length] = constantPoolValue;
               break;
            case Array:
               caseOffsets = [];
               caseCount = int(argumentValues[1]);
               caseOffsets[caseOffsets.length] = byteCodeValue;
               for(i = 0; i < caseCount; i++)
               {
                  caseOffsets[caseOffsets.length] = readWritePair.read(byteArray);
               }
               argumentValues[argumentValues.length] = caseOffsets;
               break;
            case ExceptionInfo:
               argumentValues[argumentValues.length] = byteCodeValue;
               break;
            default:
               throw new Error("Unknown Opcode argument type." + argumentType.toString());
         }
      }
      
      public static function determineOpcode(opcodeByte:int) : Opcode
      {
         var matchingOpcode:Opcode = _ALL_OPCODES[opcodeByte];
         if(!matchingOpcode)
         {
            throw new Error("No match for Opcode: 0x" + opcodeByte.toString(16) + " (" + opcodeByte + ")");
         }
         return matchingOpcode;
      }
      
      public function get argumentTypes() : Array
      {
         return this._argumentTypes;
      }
      
      public function get opcodeName() : String
      {
         return this._opcodeName;
      }
      
      public function toString() : String
      {
         return StringUtils.substitute("[Opcode(value={0},name={1})]",this._value,this._opcodeName);
      }
      
      public function op(opArguments:Array = null) : Op
      {
         if(this._argumentTypes != null && this._argumentTypes.length > 0)
         {
            return new Op(this,opArguments);
         }
         return new Op(this);
      }
   }
}
