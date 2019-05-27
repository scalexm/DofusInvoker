package org.as3commons.bytecode.abc
{
   import org.as3commons.bytecode.abc.enum.MultinameKind;
   import org.as3commons.lang.IEquals;
   
   public final class MultinameG extends BaseMultiname
   {
       
      
      private var _qualifiedName:QualifiedName;
      
      private var _parameters:Array;
      
      public function MultinameG(qName:QualifiedName, params:Array, kindValue:MultinameKind = null)
      {
         kindValue = kindValue || MultinameKind.GENERIC;
         super(kindValue);
         assertAppropriateMultinameKind([MultinameKind.GENERIC],kindValue);
         this._qualifiedName = qName;
         this._parameters = params;
      }
      
      override public function clone() : *
      {
         return new MultinameG(this._qualifiedName.clone(),this._parameters,kind);
      }
      
      public function get paramCount() : uint
      {
         return this._parameters.length;
      }
      
      public function get parameters() : Array
      {
         return this._parameters;
      }
      
      public function set parameters(value:Array) : void
      {
         this._parameters = value;
      }
      
      public function get qualifiedName() : QualifiedName
      {
         return this._qualifiedName;
      }
      
      public function set qualifiedName(value:QualifiedName) : void
      {
         this._qualifiedName = value;
      }
      
      override public function equals(other:Object) : Boolean
      {
         var i:int = 0;
         var mg:MultinameG = other as MultinameG;
         if(mg != null)
         {
            if(this._qualifiedName.equals(mg.qualifiedName))
            {
               if(this.paramCount == mg.paramCount)
               {
                  for(i = 0; i < this.paramCount; i++)
                  {
                     if(!IEquals(this._parameters[i]).equals(mg.parameters[i]))
                     {
                        return false;
                     }
                  }
                  return super.equals(other);
               }
            }
         }
         return false;
      }
      
      override public function toString() : String
      {
         return "MultinameG{qualifiedName:" + this._qualifiedName + ", parameters:[" + this.paramatersToString(this._parameters) + "]}";
      }
      
      private function paramatersToString(params:Array) : String
      {
         var mn:BaseMultiname = null;
         var result:Vector.<String> = new Vector.<String>();
         for each(mn in params)
         {
            result[result.length] = mn.toString();
         }
         return result.join(",");
      }
   }
}
