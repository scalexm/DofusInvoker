package com.ankamagames.dofus.console.moduleLogger
{
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.getQualifiedClassName;
   
   public final class TextFieldScrollBar extends Sprite
   {
      
      public static const WIDTH:int = 10;
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(TextFieldScrollBar));
       
      
      private var _textField:TextField;
      
      private var _lines:Vector.<String>;
      
      private var _numLines:int = 20;
      
      private var _power:int = 4;
      
      private var _scroll:int;
      
      private var _maxScroll:int;
      
      private var _scrollAtEnd:Boolean;
      
      private var _backgroundColor:uint;
      
      private var _color:uint;
      
      private var _background:Shape;
      
      private var _scrollBar:Sprite;
      
      public var textFieldNumLines:uint;
      
      public var wordWrapLines:Vector.<String>;
      
      private var offsetY:int;
      
      public function TextFieldScrollBar(textField:TextField, lines:Vector.<String>, power:int, backgroundColor:uint, color:uint)
      {
         super();
         this._textField = textField;
         this._lines = lines;
         this._power = power;
         this._backgroundColor = backgroundColor;
         this._color = color;
         this._textField.mouseEnabled = true;
         this._textField.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
         this.createUI();
      }
      
      public function reset(lines:Vector.<String>) : void
      {
         this._textField.text = "";
         this._lines = lines;
      }
      
      public function resize(numLines:int = 0) : void
      {
         if(numLines)
         {
            this._numLines = numLines;
         }
         this._background.graphics.clear();
         this._background.graphics.beginFill(this._backgroundColor);
         this._background.graphics.drawRoundRect(0,0,WIDTH,this._textField.height,5);
         this._background.graphics.endFill();
         x = this._textField.x + this._textField.width;
         y = this._textField.y;
         this.drawScrollBar();
      }
      
      public function updateScrolling() : void
      {
         var numLines:uint = 0;
         if(this._scrollAtEnd)
         {
            this.scrollAtEnd();
         }
         else
         {
            numLines = !!this._textField.wordWrap?uint(this.textFieldNumLines):uint(this._lines.length);
            this._maxScroll = numLines - this._numLines;
            this.drawScrollBar();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function scrollText(value:int) : void
      {
         var numLines:uint = !!this._textField.wordWrap?uint(this.textFieldNumLines):uint(this._lines.length);
         if(value == -1)
         {
            value = this._scroll;
         }
         this._scrollAtEnd = false;
         if(value < 0)
         {
            value = 0;
         }
         else if(value >= numLines - this._numLines)
         {
            this._scrollAtEnd = true;
            value = numLines - this._numLines;
         }
         var lines:Vector.<String> = !!this._textField.wordWrap?this.wordWrapLines:this._lines;
         var newText:String = lines.slice(value,value + this._numLines).join("\n");
         this._textField.htmlText = !!this._textField.wordWrap?this.checkSpan(newText,value):newText;
         this._scroll = value;
         this._maxScroll = numLines - this._numLines;
         this.resize();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function scrollAtEnd() : void
      {
         var num:int = !!this._textField.wordWrap?int(this.textFieldNumLines):int(this._lines.length);
         var value:int = num - this._numLines;
         if(value < 0)
         {
            value = 0;
         }
         var lines:Vector.<String> = !!this._textField.wordWrap?this.wordWrapLines:this._lines;
         var newText:String = lines.slice(value).join("\n");
         this._textField.htmlText = !!this._textField.wordWrap?this.checkSpan(newText,value):newText;
         var lastLineIndex:uint = this._textField.numLines - 1;
         var lastLineFirstCharBounds:Rectangle = this._textField.getCharBoundaries(this._textField.getLineOffset(this._textField.numLines - 1));
         if(lastLineFirstCharBounds && lastLineFirstCharBounds.y + lastLineFirstCharBounds.height + Math.abs(this._textField.getLineMetrics(lastLineIndex).leading) > this._textField.height)
         {
            this._textField.htmlText = !!this._textField.wordWrap?this.checkSpan(lines.slice(value + 1).join("\n"),value + 1):lines.slice(value + 1).join("\n");
         }
         this._scroll = num;
         this._maxScroll = this._scroll;
         this._scrollAtEnd = true;
         this.resize();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function checkSpan(pText:String, pLineIndex:int) : String
      {
         var i:int = 0;
         var spanIndex:int = 0;
         var lastSpan:String = null;
         var text:String = pText;
         var openSpanIndex:int = pText.indexOf("<span");
         var closeSpanIndex:int = pText.indexOf("</span>");
         if(closeSpanIndex < openSpanIndex)
         {
            for(i = 0; i <= pLineIndex; )
            {
               spanIndex = this.wordWrapLines[i].indexOf("<span");
               if(spanIndex != -1)
               {
                  lastSpan = this.wordWrapLines[i].substring(spanIndex,this.wordWrapLines[i].indexOf(">") + 1);
               }
               i++;
            }
            text = lastSpan + text;
         }
         return text;
      }
      
      private function updateTextPosition() : void
      {
         var p:Number = this._scrollBar.y / (this._textField.height - this._scrollBar.height);
         this.scrollText(this._maxScroll * p);
      }
      
      private function drawScrollBar() : void
      {
         var numLines:uint = !!this._textField.wordWrap?uint(this.textFieldNumLines):uint(this._lines.length);
         if(numLines <= this._numLines)
         {
            visible = false;
            this._scrollAtEnd = true;
            return;
         }
         visible = true;
         var pHeight:Number = this._numLines / numLines;
         var vHeight:int = int(this._textField.height * pHeight);
         if(vHeight < 40)
         {
            vHeight = 40;
         }
         this._scrollBar.graphics.clear();
         this._scrollBar.graphics.beginFill(this._color);
         this._scrollBar.graphics.drawRoundRect(0,0,WIDTH,vHeight,5);
         this._scrollBar.graphics.endFill();
         this._scrollBar.y = this._scroll * (this._textField.height - this._scrollBar.height) / this._maxScroll;
      }
      
      private function createUI() : void
      {
         if(this._background)
         {
            throw new Error();
         }
         this._background = new Shape();
         this._scrollBar = new Sprite();
         this._scrollBar.mouseChildren = false;
         this._scrollBar.addEventListener(MouseEvent.MOUSE_DOWN,this.onScrollBarMouseDown);
         addChild(this._background);
         addChild(this._scrollBar);
         this.resize();
      }
      
      private function onScrollBarMouseDown(mouseEvent:MouseEvent) : void
      {
         this.offsetY = this._scrollBar.mouseY;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      private function onMouseWheel(mouseEvent:MouseEvent) : void
      {
         if(!visible)
         {
            return;
         }
         var scroll:int = this._scroll + (mouseEvent.delta < 0?1:-1) * this._power;
         if(scroll < 0)
         {
            scroll = 0;
         }
         this.scrollText(scroll);
         this.resize();
      }
      
      private function onMouseUp(mouseEvent:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      private function onMouseMove(mouseEvent:MouseEvent) : void
      {
         var value:int = mouseY - this.offsetY;
         var maxValue:int = this._textField.height - this._scrollBar.height;
         if(value < 0)
         {
            value = 0;
         }
         else if(value > maxValue)
         {
            value = maxValue;
         }
         this._scrollBar.y = value;
         this.updateTextPosition();
         mouseEvent.updateAfterEvent();
      }
   }
}
