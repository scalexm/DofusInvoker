package com.ankama.codegen.client.model
{
   public class BakBalance
   {
      
      public static const Debit_currencyEnum_OGR:String = "OGR";
      
      public static const Debit_currencyEnum_GOU:String = "GOU";
      
      public static const Debit_currencyEnum_KMS:String = "KMS";
      
      public static const Credit_currencyEnum_OGR:String = "OGR";
      
      public static const Credit_currencyEnum_GOU:String = "GOU";
      
      public static const Credit_currencyEnum_KMS:String = "KMS";
       
      
      public var sale:Number = 0;
      
      public var debit_currency:String = null;
      
      public var debit_amount:Number = 0;
      
      public var credit_currency:String = null;
      
      public var credit_amount:Number = 0;
      
      public var soft_specified:Number = 0;
      
      public var soft_added:Number = 0;
      
      public var soft_bonus:Number = 0;
      
      public function BakBalance()
      {
         super();
      }
      
      public function toString() : String
      {
         var sb:String = "";
         sb.concat("class BakBalance {\n");
         sb.concat("  sale: ").concat(this.sale).concat("\n");
         sb.concat("  debit_currency: ").concat(this.debit_currency).concat("\n");
         sb.concat("  debit_amount: ").concat(this.debit_amount).concat("\n");
         sb.concat("  credit_currency: ").concat(this.credit_currency).concat("\n");
         sb.concat("  credit_amount: ").concat(this.credit_amount).concat("\n");
         sb.concat("  soft_specified: ").concat(this.soft_specified).concat("\n");
         sb.concat("  soft_added: ").concat(this.soft_added).concat("\n");
         sb.concat("  soft_bonus: ").concat(this.soft_bonus).concat("\n");
         sb.concat("}\n");
         return sb;
      }
   }
}
