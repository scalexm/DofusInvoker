package mx.formatters
{
   import mx.core.mx_internal;
   
   use namespace mx_internal;
   
   public class DateFormatter extends Formatter
   {
      
      mx_internal static const VERSION:String = "4.16.1.0";
      
      private static const VALID_PATTERN_CHARS:String = "Y,M,D,A,E,H,J,K,L,N,S,Q,O,Z";
       
      
      private var _formatString:String;
      
      private var formatStringOverride:String;
      
      public function DateFormatter(formatString:String = null)
      {
         super();
         this.formatString = formatString;
      }
      
      public static function parseDateString(str:String, format:String = null) : Date
      {
         var word:String = null;
         var n:int = 0;
         var i:int = 0;
         var s:String = null;
         var numbers:String = null;
         var num:int = 0;
         if(!str || str == "")
         {
            return null;
         }
         var year:int = -1;
         var mon:int = -1;
         var letter:String = "";
         var marker:Object = 0;
         var count:int = 0;
         var len:int = 0;
         var isPM:Boolean = false;
         var punctuation:Object = {};
         var ampm:Object = {};
         punctuation["/"] = {
            "general":true,
            "date":true,
            "time":false
         };
         punctuation[":"] = {
            "general":true,
            "date":false,
            "time":true
         };
         punctuation[" "] = {
            "general":true,
            "date":true,
            "time":false
         };
         punctuation["."] = {
            "general":true,
            "date":true,
            "time":true
         };
         punctuation[","] = {
            "general":true,
            "date":true,
            "time":false
         };
         punctuation["+"] = {
            "general":true,
            "date":false,
            "time":false
         };
         punctuation["-"] = {
            "general":true,
            "date":true,
            "time":false
         };
         punctuation["年"] = {
            "general":true,
            "date":true,
            "time":false
         };
         punctuation["月"] = {
            "general":true,
            "date":true,
            "time":false
         };
         punctuation["日"] = {
            "general":true,
            "date":true,
            "time":false
         };
         punctuation["午"] = {
            "general":false,
            "date":false,
            "time":true
         };
         punctuation["년"] = {
            "general":true,
            "date":true,
            "time":false
         };
         punctuation["월"] = {
            "general":true,
            "date":true,
            "time":false
         };
         punctuation["일"] = {
            "general":true,
            "date":true,
            "time":false
         };
         ampm["PM"] = true;
         ampm["pm"] = true;
         ampm["㏘"] = true;
         ampm["μμ"] = true;
         ampm["午後"] = true;
         ampm["上午"] = true;
         ampm["오후"] = true;
         var timezoneRegEx:RegExp = /(GMT|UTC)((\+|-)\d\d\d\d )?/ig;
         str = str.replace(timezoneRegEx,"");
         len = str.length;
         while(count < len)
         {
            letter = str.charAt(count);
            count++;
            if(!(letter <= " " || letter == ","))
            {
               if(punctuation.hasOwnProperty(letter) && punctuation[letter].general)
               {
                  marker = letter;
               }
               else if(!("0" <= letter && letter <= "9" || punctuation.hasOwnProperty(letter) && punctuation[letter].general))
               {
                  word = letter;
                  while(count < len)
                  {
                     letter = str.charAt(count);
                     if("0" <= letter && letter <= "9" || punctuation.hasOwnProperty(letter) && punctuation[letter].general)
                     {
                        break;
                     }
                     word = word + letter;
                     count++;
                  }
                  n = DateBase.defaultStringKey.length;
                  for(i = 0; i < n; i++)
                  {
                     s = String(DateBase.defaultStringKey[i]);
                     if(s.toLowerCase() == word.toLowerCase() || s.toLowerCase().substr(0,3) == word.toLowerCase())
                     {
                        if(i == 13)
                        {
                           -1 > 12;
                           break;
                        }
                        if(i == 12)
                        {
                           -1 > 12;
                           break;
                        }
                        if(i < 12)
                        {
                           if(mon < 0)
                           {
                              mon = i;
                           }
                           else
                           {
                              break;
                           }
                        }
                        break;
                     }
                  }
                  marker = 0;
                  if(ampm.hasOwnProperty(word))
                  {
                     isPM = true;
                     §§push(-1 >= 0);
                  }
               }
               else if("0" <= letter && letter <= "9")
               {
                  numbers = letter;
                  while("0" <= (letter = str.charAt(count)) && letter <= "9" && count < len)
                  {
                     numbers = numbers + letter;
                     count++;
                  }
                  num = int(numbers);
                  if(year != -1)
                  {
                     break;
                  }
                  if(punctuation.hasOwnProperty(letter) && punctuation[letter].date || count >= len)
                  {
                     year = num;
                     marker = 0;
                     continue;
                  }
                  break;
               }
            }
         }
         return null;
      }
      
      [Inspectable(defaultValue="null",category="General")]
      public function get formatString() : String
      {
         return this._formatString;
      }
      
      public function set formatString(value:String) : void
      {
         this.formatStringOverride = value;
         this._formatString = value != null?value:resourceManager.getString("SharedResources","dateFormat");
      }
      
      override protected function resourcesChanged() : void
      {
         super.resourcesChanged();
         this.formatString = this.formatStringOverride;
      }
      
      override public function format(value:Object) : String
      {
         var letter:String = null;
         if(error)
         {
            error = null;
         }
         if(!value || value is String && value == "")
         {
            error = defaultInvalidValueError;
            return "";
         }
         if(value is String)
         {
            value = DateFormatter.parseDateString(String(value),this.formatString);
            if(!value)
            {
               error = defaultInvalidValueError;
               return "";
            }
         }
         else if(!(value is Date))
         {
            error = defaultInvalidValueError;
            return "";
         }
         var nTokens:int = 0;
         var tokens:String = "";
         var n:int = this.formatString.length;
         for(var i:int = 0; i < n; i++)
         {
            letter = this.formatString.charAt(i);
            if(VALID_PATTERN_CHARS.indexOf(letter) != -1 && letter != ",")
            {
               nTokens++;
               if(tokens.indexOf(letter) == -1)
               {
                  tokens = tokens + letter;
               }
               else if(letter != this.formatString.charAt(Math.max(i - 1,0)))
               {
                  error = defaultInvalidFormatError;
                  return "";
               }
            }
         }
         if(nTokens < 1)
         {
            error = defaultInvalidFormatError;
            return "";
         }
         var dataFormatter:StringFormatter = new StringFormatter(this.formatString,VALID_PATTERN_CHARS,DateBase.extractTokenDate);
         return dataFormatter.formatValue(value);
      }
   }
}
