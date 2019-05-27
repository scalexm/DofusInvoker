package org.as3commons.bytecode.util
{
   import org.as3commons.bytecode.abc.BaseMultiname;
   import org.as3commons.bytecode.abc.LNamespace;
   import org.as3commons.bytecode.abc.Multiname;
   import org.as3commons.bytecode.abc.MultinameG;
   import org.as3commons.bytecode.abc.NamespaceSet;
   import org.as3commons.bytecode.abc.QualifiedName;
   import org.as3commons.bytecode.abc.enum.BuiltIns;
   import org.as3commons.bytecode.abc.enum.NamespaceKind;
   import org.as3commons.bytecode.emit.enum.MemberVisibility;
   import org.as3commons.lang.StringUtils;
   
   public final class MultinameUtil
   {
      
      public static const PROTECTED_SCOPE_NAME:String = "protected:";
      
      public static const PRIVATE_SCOPE_NAME:String = "private:";
      
      public static const DOUBLE_COLON:String = "::";
      
      public static const SINGLE_COLON:String = ":";
      
      public static const DOUBLE_COLON_REGEXP:RegExp = /[:]+/;
      
      public static const PERIOD:String = ".";
      
      public static const COMMA:String = ",";
      
      public static const FORWARD_SLASH:String = "/";
      
      public static const VECTOR_INDICATOR:String = "<";
      
      public static const ASTERISK:String = "*";
       
      
      public function MultinameUtil()
      {
         super();
      }
      
      public static function toArgumentMultiName(className:String, kind:NamespaceKind = null) : BaseMultiname
      {
         var portions:Array = null;
         var namespacePortion:String = null;
         var classNamePortion:String = null;
         var paramPortion:String = null;
         var params:Array = null;
         var i:uint = 0;
         var QName:QualifiedName = null;
         if(className.indexOf(VECTOR_INDICATOR) < 0)
         {
            return toQualifiedName(className,kind);
         }
         kind = kind || NamespaceKind.PACKAGE_NAMESPACE;
         if(className.match(DOUBLE_COLON_REGEXP) != null)
         {
            portions = className.split(DOUBLE_COLON_REGEXP);
            namespacePortion = String(portions[0]);
            portions = String(portions[1]).split(PERIOD);
            classNamePortion = portions[0];
            paramPortion = portions[1];
            paramPortion = paramPortion.substr(1,paramPortion.length - 2);
            params = paramPortion.split(COMMA);
            for(i = 0; i < params.length; i++)
            {
               params[i] = toArgumentMultiName(String(params[i]));
            }
         }
         else
         {
            portions = className.split(PERIOD);
            paramPortion = String(portions.pop());
            paramPortion = paramPortion.substr(1,paramPortion.length - 2);
            params = paramPortion.split(COMMA);
            for(i = 0; i < params.length; i++)
            {
               params[i] = toArgumentMultiName(String(params[i]));
            }
            classNamePortion = String(portions.pop());
            namespacePortion = portions.join(PERIOD);
         }
         QName = new QualifiedName(classNamePortion,toLNamespace(namespacePortion + PERIOD + classNamePortion,kind));
         return new MultinameG(QName,params);
      }
      
      public static function toQualifiedName(className:String, kind:NamespaceKind = null, nameSpaceURI:String = null) : QualifiedName
      {
         var name:QualifiedName = null;
         var portions:Array = null;
         var namespacePortion:String = null;
         var classNamePortion:String = null;
         kind = kind || NamespaceKind.PACKAGE_NAMESPACE;
         switch(className)
         {
            case BuiltIns.OBJECT.fullName:
               name = BuiltIns.OBJECT;
               break;
            case BuiltIns.ANY.fullName:
               name = BuiltIns.ANY;
               break;
            case BuiltIns.BOOLEAN.fullName:
               name = BuiltIns.BOOLEAN;
               break;
            case BuiltIns.VOID.fullName:
               name = BuiltIns.VOID;
               break;
            case BuiltIns.DICTIONARY.fullName:
               name = BuiltIns.DICTIONARY;
               break;
            case BuiltIns.FUNCTION.fullName:
               name = BuiltIns.FUNCTION;
               break;
            case BuiltIns.NUMBER.fullName:
               name = BuiltIns.NUMBER;
               break;
            case BuiltIns.STRING.fullName:
               name = BuiltIns.STRING;
               break;
            default:
               if(className.match(DOUBLE_COLON_REGEXP) != null)
               {
                  portions = className.split(DOUBLE_COLON_REGEXP);
                  namespacePortion = portions[0];
                  classNamePortion = portions[1];
               }
               else
               {
                  portions = className.split(PERIOD);
                  classNamePortion = String(portions.pop());
                  namespacePortion = portions.join(PERIOD);
               }
               name = new QualifiedName(classNamePortion,toLNamespace(className,kind,nameSpaceURI));
         }
         return name;
      }
      
      public static function toMultiName(className:String, kind:NamespaceKind = null) : Multiname
      {
         var portions:Array = null;
         var classNamePortion:String = null;
         kind = kind || NamespaceKind.PACKAGE_NAMESPACE;
         if(className.match(DOUBLE_COLON_REGEXP) != null)
         {
            portions = className.split(DOUBLE_COLON_REGEXP);
            classNamePortion = portions[1];
         }
         else
         {
            portions = className.split(PERIOD);
            classNamePortion = String(portions.pop());
         }
         var namesp:LNamespace = toLNamespace(className,kind);
         var namespSet:NamespaceSet = new NamespaceSet([namesp]);
         return new Multiname(classNamePortion,namespSet);
      }
      
      public static function toLNamespace(className:String, kind:NamespaceKind, nameSpaceURI:String = null) : LNamespace
      {
         var namesp:LNamespace = null;
         var portions:Array = null;
         var namespacePortion:String = null;
         var classNamePortion:String = null;
         switch(className)
         {
            case BuiltIns.OBJECT.fullName:
               namesp = BuiltIns.OBJECT.nameSpace;
               break;
            case BuiltIns.BOOLEAN.fullName:
               namesp = BuiltIns.BOOLEAN.nameSpace;
               break;
            case BuiltIns.ANY.fullName:
               namesp = BuiltIns.ANY.nameSpace;
               break;
            case BuiltIns.VOID.fullName:
               namesp = BuiltIns.VOID.nameSpace;
               break;
            case BuiltIns.DICTIONARY.fullName:
               namesp = BuiltIns.DICTIONARY.nameSpace;
               break;
            case BuiltIns.FUNCTION.fullName:
               namesp = BuiltIns.FUNCTION.nameSpace;
               break;
            case BuiltIns.NUMBER.fullName:
               namesp = BuiltIns.NUMBER.nameSpace;
               break;
            case BuiltIns.STRING.fullName:
               namesp = BuiltIns.STRING.nameSpace;
               break;
            default:
               if(className.match(DOUBLE_COLON_REGEXP) != null)
               {
                  portions = className.split(DOUBLE_COLON_REGEXP);
                  namespacePortion = portions[0];
                  classNamePortion = portions[1];
               }
               else
               {
                  portions = className.split(PERIOD);
                  classNamePortion = String(portions.pop());
                  namespacePortion = portions.join(PERIOD);
               }
               if(kind == NamespaceKind.PACKAGE_NAMESPACE)
               {
                  namesp = new LNamespace(kind,namespacePortion);
               }
               else if(nameSpaceURI == null)
               {
                  namesp = new LNamespace(kind,namespacePortion + SINGLE_COLON + classNamePortion);
               }
               else
               {
                  namesp = new LNamespace(kind,nameSpaceURI);
               }
         }
         return namesp;
      }
      
      public static function extractPackageName(fullName:String) : String
      {
         var idx:int = 0;
         var matches:Array = fullName.match(MultinameUtil.DOUBLE_COLON_REGEXP);
         if(matches != null)
         {
            return fullName.split(MultinameUtil.DOUBLE_COLON_REGEXP)[0];
         }
         idx = fullName.lastIndexOf(MultinameUtil.PERIOD);
         return fullName.substr(0,idx);
      }
      
      public static function convertToQualifiedName(classMultiname:BaseMultiname) : QualifiedName
      {
         var classMultinameAsMultiname:Multiname = null;
         if(classMultiname is QualifiedName)
         {
            return classMultiname as QualifiedName;
         }
         var qualifiedName:QualifiedName = null;
         if(classMultiname is Multiname)
         {
            classMultinameAsMultiname = classMultiname as Multiname;
            if(classMultinameAsMultiname.namespaceSet.namespaces.length == 1)
            {
               qualifiedName = new QualifiedName(classMultinameAsMultiname.name,classMultinameAsMultiname.namespaceSet.namespaces[0]);
            }
         }
         else if(classMultiname is MultinameG)
         {
            qualifiedName = (classMultiname as MultinameG).qualifiedName;
         }
         return qualifiedName;
      }
      
      public static function extractInterfaceScopeFromFullName(methodName:String) : String
      {
         if(!StringUtils.hasText(methodName))
         {
            return "";
         }
         var parts:Array = methodName.split(PERIOD);
         if(parts.length > 1)
         {
            parts.pop();
            return parts.join(PERIOD);
         }
         return "";
      }
      
      public static function getNamespaceKind(visibility:MemberVisibility) : NamespaceKind
      {
         switch(visibility)
         {
            case MemberVisibility.PUBLIC:
               return NamespaceKind.PACKAGE_NAMESPACE;
            case MemberVisibility.PROTECTED:
               return NamespaceKind.PROTECTED_NAMESPACE;
            case MemberVisibility.PRIVATE:
               return NamespaceKind.PRIVATE_NAMESPACE;
            case MemberVisibility.NAMESPACE:
               return NamespaceKind.NAMESPACE;
            default:
               return NamespaceKind.PACKAGE_NAMESPACE;
         }
      }
      
      public static function createScopeNameFromQualifiedName(qualifiedName:QualifiedName) : String
      {
         var scope:String = null;
         switch(qualifiedName.nameSpace.kind)
         {
            case NamespaceKind.PROTECTED_NAMESPACE:
               scope = PROTECTED_SCOPE_NAME;
               break;
            case NamespaceKind.PRIVATE_NAMESPACE:
               scope = PRIVATE_SCOPE_NAME;
               break;
            case NamespaceKind.NAMESPACE:
               scope = qualifiedName.nameSpace.name + MultinameUtil.SINGLE_COLON;
               break;
            case MemberVisibility.INTERNAL:
               scope = qualifiedName.fullName.split(MultinameUtil.SINGLE_COLON)[0] + MultinameUtil.SINGLE_COLON;
         }
         return scope;
      }
   }
}
