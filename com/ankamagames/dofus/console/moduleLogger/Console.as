package com.ankamagames.dofus.console.moduleLogger
{
   import com.ankamagames.berilia.managers.CssManager;
   import com.ankamagames.berilia.types.data.ExtendedStyleSheet;
   import com.ankamagames.dofus.Constants;
   import com.ankamagames.dofus.datacenter.communication.ChatChannel;
   import com.ankamagames.dofus.kernel.Kernel;
   import com.ankamagames.dofus.logic.game.common.frames.AllianceFrame;
   import com.ankamagames.dofus.logic.game.common.frames.ChatFrame;
   import com.ankamagames.dofus.logic.game.common.frames.PartyManagementFrame;
   import com.ankamagames.dofus.logic.game.common.frames.SocialFrame;
   import com.ankamagames.dofus.logic.game.common.managers.PlayedCharacterManager;
   import com.ankamagames.dofus.logic.game.common.managers.TimeManager;
   import com.ankamagames.dofus.misc.options.ChatOptions;
   import com.ankamagames.dofus.network.enums.ChatActivableChannelsEnum;
   import com.ankamagames.jerakine.data.I18n;
   import com.ankamagames.jerakine.data.XmlConfig;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.logger.ModuleLogger;
   import com.ankamagames.jerakine.managers.OptionManager;
   import com.ankamagames.jerakine.managers.StoreDataManager;
   import com.ankamagames.jerakine.types.events.PropertyChangeEvent;
   import com.ankamagames.jerakine.utils.misc.CallWithParameters;
   import flash.display.NativeMenu;
   import flash.display.NativeMenuItem;
   import flash.display.NativeWindow;
   import flash.display.NativeWindowInitOptions;
   import flash.display.Sprite;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.NativeWindowBoundsEvent;
   import flash.events.NativeWindowDisplayStateEvent;
   import flash.events.TextEvent;
   import flash.events.TimerEvent;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.geom.ColorTransform;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   
   public final class Console
   {
      
      private static const OPTIONS_HEIGHT:uint = 30;
      
      private static const OPTIONS_BACKGROUND_COLOR:uint = 4473941;
      
      public static const ICON_SIZE:int = 22;
      
      public static const ICON_INTERVAL:int = 15;
      
      private static const SCROLLBAR_SIZE:uint = 10;
      
      private static const FILTER_UI_COLOR:uint = 4473941;
      
      private static const BACKGROUND_COLOR:uint = 2236962;
      
      private static const OUTPUT_COLOR:uint = 6710920;
      
      private static const SCROLL_BG_COLOR:uint = 4473941;
      
      private static const SCROLL_COLOR:uint = 6710920;
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(Console));
      
      private static const ALL_HTML_TAGS:RegExp = /<\/?\w+((\s+\w+(\s*=\s*(?:".*?"|'.*?'|[^'">\s]+))?)+\s*|\s*)\/?>/g;
      
      public static var showActionLog:Boolean = true;
      
      public static var logChatMessagesOnly:Boolean;
      
      private static var _self:Console;
      
      private static var _displayed:Boolean = false;
       
      
      private var _consoleStyle:StyleSheet;
      
      private var _bgColor:uint;
      
      private var _chatChannelsMenu:NativeMenu;
      
      private var _window:NativeWindow;
      
      private var _filterUI:FilterUI;
      
      private var _lines:Vector.<String>;
      
      private var _allInfo:Vector.<TypeMessage>;
      
      private var _active:Boolean = false;
      
      private var _iconList:ConsoleIconList;
      
      private var _textField:TextField;
      
      private var _scrollBar:TextFieldScrollBar;
      
      private var _scrollBarH:TextFieldOldScrollBarH;
      
      private var _backGround:Sprite;
      
      private var _filterButton:Array;
      
      private var _showHook:Boolean = true;
      
      private var _showUI:Boolean = true;
      
      private var _showAction:Boolean = true;
      
      private var _showShortcut:Boolean = true;
      
      private var _chatMode:Boolean;
      
      private var _updateWordWrapTimer:Timer;
      
      private var _wordWrapLinesCache:Dictionary;
      
      private var regExp:RegExp;
      
      private var regExp2:RegExp;
      
      public function Console()
      {
         this._lines = new Vector.<String>();
         this._allInfo = new Vector.<TypeMessage>();
         this._updateWordWrapTimer = new Timer(50);
         this._wordWrapLinesCache = new Dictionary(true);
         this.regExp = /<[^>]*>/g;
         this.regExp2 = /•/g;
         super();
         if(_self)
         {
            throw new Error();
         }
         ModuleLogger.addCallback(this.log);
      }
      
      public static function getInstance() : Console
      {
         var chatOptions:OptionManager = null;
         if(!_self)
         {
            _self = new Console();
            chatOptions = OptionManager.getOptionManager("chat");
            if(chatOptions)
            {
               chatOptions.addEventListener(PropertyChangeEvent.PROPERTY_CHANGED,_self.onPropertyChanged);
            }
         }
         return _self;
      }
      
      public static function isVisible() : Boolean
      {
         return _displayed;
      }
      
      public function get consoleStyle() : StyleSheet
      {
         if(!this._consoleStyle)
         {
            this.initConsoleStyle();
         }
         return this._consoleStyle;
      }
      
      public function get chatMode() : Boolean
      {
         return this._chatMode;
      }
      
      public function set chatMode(pValue:Boolean) : void
      {
         this._chatMode = pValue;
      }
      
      public function get opened() : Boolean
      {
         return this._window != null;
      }
      
      private function output(message:TypeMessage) : void
      {
         var type:int = 0;
         var text:String = null;
         var newLines:Array = null;
         if(this._active)
         {
            this._allInfo.push(message);
            if(!_displayed)
            {
               return;
            }
            if(this._filterUI && this._filterUI.isOn && this._filterUI.isFiltered(message.name))
            {
               return;
            }
            type = message.type;
            if(type == TypeMessage.TYPE_HOOK && !this._showHook)
            {
               return;
            }
            if(type == TypeMessage.TYPE_UI && !this._showUI)
            {
               return;
            }
            if(type == TypeMessage.TYPE_ACTION && !this._showAction)
            {
               return;
            }
            if(type == TypeMessage.TYPE_SHORTCUT && !this._showShortcut)
            {
               return;
            }
            if(this._chatMode && type != TypeMessage.LOG_CHAT)
            {
               return;
            }
            text = message.textInfo;
            newLines = text.split("\n");
            this._lines.push.apply(this._lines,newLines);
            if(this._textField.wordWrap)
            {
               this._updateWordWrapTimer.reset();
               this._updateWordWrapTimer.start();
               return;
            }
            this._scrollBar.updateScrolling();
            this._scrollBarH.resize();
         }
      }
      
      public function close() : void
      {
         _displayed = false;
         if(this._window)
         {
            this._window.close();
            this._window = null;
         }
         this.saveData();
      }
      
      public function disableLogEvent() : void
      {
         var icon:ConsoleIcon = null;
         this._showHook = false;
         this._showUI = false;
         this._showAction = false;
         this._showShortcut = false;
         for each(icon in this._filterButton)
         {
            icon.disable(true);
         }
         this.onFilterChange();
      }
      
      public function activate() : void
      {
         ModuleLogger.active = true;
         this._active = true;
      }
      
      public function display(quietMode:Boolean = false) : void
      {
         ModuleLogger.active = true;
         this._active = true;
         if(quietMode)
         {
            return;
         }
         if(!this._window)
         {
            this.createWindow();
         }
         _displayed = true;
         this._window.activate();
      }
      
      public function toggleDisplay() : void
      {
         if(_displayed)
         {
            this.close();
         }
         else
         {
            this.display();
         }
      }
      
      private function log(... args) : void
      {
         var message:TypeMessage = null;
         if(this._active && args.length)
         {
            message = CallWithParameters.callConstructor(TypeMessage,args);
            if(!logChatMessagesOnly || logChatMessagesOnly && message.type == TypeMessage.LOG_CHAT)
            {
               this.output(message);
            }
         }
      }
      
      private function onPropertyChanged(pEvent:PropertyChangeEvent) : void
      {
         var styleId:String = null;
         var style:Object = null;
         if(this._chatMode && pEvent.currentTarget is ChatOptions && pEvent.propertyName.indexOf("channelColor") != -1)
         {
            styleId = ".p" + parseInt(pEvent.propertyName.split("channelColor")[1]);
            style = this._consoleStyle.getStyle(styleId);
            style.color = "#" + pEvent.propertyValue.toString(16);
            this._consoleStyle.setStyle(styleId,style);
            if(_displayed)
            {
               this._updateWordWrapTimer.reset();
               this._updateWordWrapTimer.start();
            }
         }
      }
      
      public function clearConsole(e:Event = null) : void
      {
         var text:* = undefined;
         if(this._chatMode)
         {
            for(text in this._wordWrapLinesCache)
            {
               delete this._wordWrapLinesCache[text];
            }
         }
         this._lines.splice(0,this._lines.length);
         this._allInfo.splice(0,this._allInfo.length);
         this._scrollBar.updateScrolling();
         this._scrollBarH.resize();
         this._textField.text = "";
      }
      
      private function initConsoleStyle() : void
      {
         var ss:ExtendedStyleSheet = null;
         var styleName:String = null;
         var chatOptions:ChatOptions = null;
         var option:* = null;
         var styleId:String = null;
         var style:Object = null;
         if(!this._chatMode)
         {
            this._consoleStyle = new StyleSheet();
            this._consoleStyle.setStyle(".yellow",{"color":"#ADAE30"});
            this._consoleStyle.setStyle(".orange",{"color":"#EDC597"});
            this._consoleStyle.setStyle(".red",{"color":"#DD5555"});
            this._consoleStyle.setStyle(".red+",{"color":"#FF0000"});
            this._consoleStyle.setStyle(".gray",{"color":"#666688"});
            this._consoleStyle.setStyle(".gray+",{"color":"#8888AA"});
            this._consoleStyle.setStyle(".pink",{"color":"#DD55DD"});
            this._consoleStyle.setStyle(".green",{"color":"#00BBBB"});
            this._consoleStyle.setStyle(".blue",{"color":"#97A2ED"});
            this._consoleStyle.setStyle(".white",{"color":"#C2C2DA"});
            this._consoleStyle.setStyle("a:hover",{"color":"#EDC597"});
         }
         else
         {
            this._consoleStyle = new StyleSheet();
            ss = CssManager.getInstance().getCss("theme://css/chat.css");
            for each(styleName in ss.styleNames)
            {
               this._consoleStyle.setStyle("." + styleName,ss.getStyle(styleName));
            }
            chatOptions = OptionManager.getOptionManager("chat") as ChatOptions;
            for(option in chatOptions)
            {
               if(option.indexOf("channelColor") != -1)
               {
                  styleId = ".p" + parseInt(option.split("channelColor")[1]);
                  style = this._consoleStyle.getStyle(styleId);
                  style.color = "#" + chatOptions[option].toString(16);
                  this._consoleStyle.setStyle(styleId,style);
               }
            }
         }
      }
      
      private function createIcons() : void
      {
         this._iconList = new ConsoleIconList();
         var erase:ConsoleIcon = new ConsoleIcon("cancel",ICON_SIZE,!!this._chatMode?I18n.getUiText("ui.chat.external.eraseConversation"):"",this._iconList);
         erase.addEventListener(MouseEvent.MOUSE_DOWN,this.clearConsole);
         var disk:ConsoleIcon = new ConsoleIcon("disk",ICON_SIZE,!!this._chatMode?I18n.getUiText("ui.chat.external.saveConversation"):"",this._iconList);
         disk.addEventListener(MouseEvent.MOUSE_DOWN,this.saveText);
      }
      
      private function initUI() : void
      {
         this._window.addEventListener(NativeWindowDisplayStateEvent.DISPLAY_STATE_CHANGE,this.onResize);
         this._window.stage.addChild(this._backGround);
         this._window.stage.addChild(this._textField);
         this._window.stage.addChild(this._scrollBar);
         this._window.stage.addChild(this._scrollBarH);
         this._window.stage.addChild(this._iconList);
         this.onResize();
      }
      
      private function createUI() : void
      {
         var book:ConsoleIcon = null;
         this._backGround = new Sprite();
         this._textField = new TextField();
         this._textField.addEventListener(TextEvent.LINK,this.onTextClick);
         this._textField.multiline = true;
         this._textField.wordWrap = false;
         this._textField.mouseWheelEnabled = false;
         this._scrollBar = new TextFieldScrollBar(this._textField,this._lines,10,SCROLL_BG_COLOR,SCROLL_COLOR);
         this._scrollBarH = new TextFieldOldScrollBarH(this._textField,5,SCROLL_BG_COLOR,SCROLL_COLOR);
         var textFormat:TextFormat = new TextFormat();
         textFormat.font = "Courier New";
         textFormat.size = 16;
         textFormat.color = OUTPUT_COLOR;
         this._textField.defaultTextFormat = textFormat;
         this._textField.styleSheet = this.consoleStyle;
         this.createIcons();
         var filter:ConsoleIcon = new ConsoleIcon("list",ICON_SIZE,"",this._iconList);
         filter.addEventListener(MouseEvent.MOUSE_DOWN,this.onIconFilterMouseDown);
         this._filterButton = new Array();
         var bookList:Array = new Array(new ColorTransform(0.9,1,1.1),new ColorTransform(0.9,1.2,0.8),new ColorTransform(1.3,0.7,0.8),new ColorTransform(1.3,1.3,0.5));
         for(var i:int = 0; i < bookList.length; i++)
         {
            book = new ConsoleIcon("book",ICON_SIZE);
            this._filterButton[i] = book;
            book.changeColor(bookList[i]);
            this._iconList.addChild(book);
            book.name = "_" + i;
            book.addEventListener(MouseEvent.MOUSE_DOWN,this.onBookClick);
         }
         this._filterUI = new FilterUI(FILTER_UI_COLOR);
         this._filterUI.addEventListener(Event.CHANGE,this.onFilterChange);
         this._bgColor = BACKGROUND_COLOR;
         this.initUI();
         var data:Object = StoreDataManager.getInstance().getData(Constants.DATASTORE_MODULE_DEBUG,"console_pref");
         this.loadData(data);
      }
      
      private function createChatUI() : void
      {
         this._backGround = new Sprite();
         this._textField = new TextField();
         this._textField.addEventListener(TextEvent.LINK,this.onTextClick);
         this._textField.multiline = true;
         this._textField.wordWrap = true;
         this._textField.mouseWheelEnabled = false;
         this._textField.embedFonts = true;
         this._scrollBar = new TextFieldScrollBar(this._textField,this._lines,10,SCROLL_BG_COLOR,SCROLL_COLOR);
         this._scrollBarH = new TextFieldOldScrollBarH(this._textField,5,SCROLL_BG_COLOR,SCROLL_COLOR);
         this._textField.styleSheet = this.consoleStyle;
         this.createIcons();
         this._chatChannelsMenu = null;
         var channelsFilter:ConsoleIcon = new ConsoleIcon("list",ICON_SIZE,I18n.getUiText("ui.chat.external.showChannelsList"),this._iconList);
         channelsFilter.addEventListener(MouseEvent.MOUSE_DOWN,this.openChatChannelsMenu);
         this._bgColor = XmlConfig.getInstance().getEntry("colors.chat.bgColor");
         this._updateWordWrapTimer.addEventListener(TimerEvent.TIMER,this.onUpdateWordWrap);
         this.initUI();
      }
      
      private function isChanAvailable(pChanId:uint) : Boolean
      {
         var partyManagementFrame:PartyManagementFrame = null;
         switch(pChanId)
         {
            case ChatActivableChannelsEnum.CHANNEL_GUILD:
               return SocialFrame.getInstance().hasGuild;
            case ChatActivableChannelsEnum.CHANNEL_PARTY:
               return PlayedCharacterManager.getInstance().isInParty;
            case ChatActivableChannelsEnum.CHANNEL_ARENA:
               partyManagementFrame = Kernel.getWorker().getFrame(PartyManagementFrame) as PartyManagementFrame;
               return partyManagementFrame.arenaPartyMembers.length > 0;
            case ChatActivableChannelsEnum.CHANNEL_ALLIANCE:
               return AllianceFrame.getInstance().hasAlliance;
            case ChatActivableChannelsEnum.CHANNEL_TEAM:
               return PlayedCharacterManager.getInstance().isSpectator || PlayedCharacterManager.getInstance().isFighting;
            default:
               return true;
         }
      }
      
      private function openChatChannelsMenu(pEvent:MouseEvent) : void
      {
         var chan:ChatChannel = null;
         var item:NativeMenuItem = null;
         if(!this._chatChannelsMenu)
         {
            this._chatChannelsMenu = new NativeMenu();
            this._chatChannelsMenu.addEventListener(Event.SELECT,this.filterChatChannel);
         }
         while(this._chatChannelsMenu.items.length)
         {
            this._chatChannelsMenu.getItemAt(0).removeEventListener(Event.SELECT,this.filterChatChannel);
            this._chatChannelsMenu.removeItemAt(0);
         }
         var chatFrame:ChatFrame = Kernel.getWorker().getFrame(ChatFrame) as ChatFrame;
         var channels:Array = ChatChannel.getChannels();
         var externalChatChannels:Array = OptionManager.getOptionManager("chat")["externalChatEnabledChannels"];
         for each(chan in channels)
         {
            if(chatFrame.disallowedChannels.indexOf(chan.id) == -1 && this.isChanAvailable(chan.id))
            {
               item = new NativeMenuItem(chan.name);
               item.data = chan;
               if(externalChatChannels.indexOf(chan.id) != -1)
               {
                  item.checked = true;
               }
               item.addEventListener(Event.SELECT,this.filterChatChannel);
               this._chatChannelsMenu.addItem(item);
            }
         }
         this._chatChannelsMenu.display(this._window.stage,this._window.stage.mouseX,this._window.stage.mouseY);
      }
      
      private function filterChatChannel(pEvent:Event) : void
      {
         var chan:ChatChannel = null;
         var externalChatChannels:Array = null;
         var item:NativeMenuItem = pEvent.currentTarget as NativeMenuItem;
         if(item)
         {
            chan = item.data as ChatChannel;
            item.checked = !item.checked;
            externalChatChannels = OptionManager.getOptionManager("chat")["externalChatEnabledChannels"];
            if(item.checked)
            {
               externalChatChannels.push(chan.id);
            }
            else
            {
               externalChatChannels.splice(externalChatChannels.indexOf(chan.id),1);
            }
         }
      }
      
      public function updateEnabledChatChannels() : void
      {
         var item:NativeMenuItem = null;
         if(!this._chatChannelsMenu)
         {
            return;
         }
         var externalChatChannels:Array = OptionManager.getOptionManager("chat")["externalChatEnabledChannels"];
         for each(item in this._chatChannelsMenu.items)
         {
            if(externalChatChannels.indexOf(item.data.id) != -1)
            {
               item.checked = true;
            }
            else
            {
               item.checked = false;
            }
         }
      }
      
      private function openFilterUI(open:Boolean) : void
      {
         if(open)
         {
            this._window.stage.addChild(this._filterUI);
            this.onResize();
         }
         else if(this._filterUI.parent)
         {
            this._filterUI.parent.removeChild(this._filterUI);
         }
      }
      
      private function createWindow() : void
      {
         var options:NativeWindowInitOptions = null;
         if(!this._window)
         {
            options = new NativeWindowInitOptions();
            options.resizable = true;
            this._window = new NativeWindow(options);
            this._window.width = !this._chatMode?Number(800):Number(600);
            this._window.height = !this._chatMode?Number(600):Number(400);
            this._window.title = !!this._chatMode?"Dofus Chat - " + PlayedCharacterManager.getInstance().infos.name:"Module Console";
            this._window.addEventListener(Event.CLOSE,this.onClose);
            this._window.addEventListener(NativeWindowBoundsEvent.RESIZE,this.onResize);
            this._window.stage.align = StageAlign.TOP_LEFT;
            this._window.stage.scaleMode = StageScaleMode.NO_SCALE;
            this._window.stage.tabChildren = false;
            if(this._chatMode)
            {
               if(this._filterUI)
               {
                  this.openFilterUI(false);
               }
               this.createChatUI();
            }
            else
            {
               this.createUI();
            }
         }
      }
      
      private function saveData() : void
      {
         var data:Object = null;
         try
         {
            data = new Object();
            if(this._filterUI)
            {
               data.filter = this._filterUI.getCurrentOptions();
            }
            data.showHook = this._showHook;
            data.showUI = this._showUI;
            data.showAction = this._showAction;
            data.showShortcut = this._showShortcut;
            StoreDataManager.getInstance().setData(Constants.DATASTORE_MODULE_DEBUG,"console_pref",data);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function loadData(data:Object) : void
      {
         if(data)
         {
            if(data.filter)
            {
               this._filterUI.setOptions(data.filter);
               if(data.filter.isOn)
               {
                  this.openFilterUI(true);
               }
            }
            if(data.hasOwnProperty("showHook") && !data.showHook)
            {
               this._filterButton[0].disable(true);
               this._showHook = false;
            }
            if(data.hasOwnProperty("showUI") && !data.showUI)
            {
               this._filterButton[1].disable(true);
               this._showUI = false;
            }
            if(data.hasOwnProperty("showAction") && !data.showAction)
            {
               this._filterButton[2].disable(true);
               this._showAction = false;
            }
            if(data.hasOwnProperty("showShortcut") && !data.showShortcut)
            {
               this._filterButton[3].disable(true);
               this._showShortcut = false;
            }
            this.onFilterChange();
         }
      }
      
      private function onUpdateWordWrap(pEvent:TimerEvent) : void
      {
         this._updateWordWrapTimer.stop();
         this.updateWordWrapLines();
         this._scrollBar.updateScrolling();
         this._scrollBarH.resize();
      }
      
      private function updateWordWrapLines() : void
      {
         var i:int = 0;
         var j:int = 0;
         var k:int = 0;
         var l:int = 0;
         var htmlLine:String = null;
         var htmlTags:Array = null;
         var deleteTags:Array = null;
         var htmlTag:String = null;
         var tmpText:String = null;
         var words:Array = null;
         var w:String = null;
         var numWords:int = 0;
         var numTags:int = 0;
         var openTags:Array = null;
         var closeTags:Array = null;
         var newSpanIndex:int = 0;
         var rawText:String = null;
         var lineText:* = null;
         var openedSpanTag:Boolean = false;
         var currentLine:int = 0;
         var tmpIndex:int = 0;
         var lastIndex:int = 0;
         var tsText:String = null;
         var tmpLineText:String = null;
         var tmpReplaceText:String = null;
         var wordOccurenceIndex:int = 0;
         var wordIndex:int = 0;
         this._textField.text = this._lines.join("\n");
         this._scrollBar.textFieldNumLines = this._textField.numLines;
         if(!this._scrollBar.wordWrapLines)
         {
            this._scrollBar.wordWrapLines = new Vector.<String>(0);
         }
         this._scrollBar.wordWrapLines.length = 0;
         var numLines:uint = this._lines.length;
         var wordCount:Dictionary = new Dictionary(true);
         var lastLine:int = 0;
         for(i = 0; i < this._scrollBar.textFieldNumLines; i++)
         {
            rawText = lineText = this._textField.getLineText(i).replace("\r","");
            if(this._wordWrapLinesCache[rawText])
            {
               this._scrollBar.wordWrapLines.push(this._wordWrapLinesCache[rawText]);
            }
            else
            {
               for(j = lastLine; j < numLines; )
               {
                  htmlLine = this._lines[j];
                  htmlTags = htmlLine.match(ALL_HTML_TAGS);
                  numTags = htmlTags.length;
                  for(k = 0; k < numTags; )
                  {
                     if(htmlTags[k].indexOf("span") == -1)
                     {
                        htmlLine = htmlLine.replace(htmlTags[k],"");
                     }
                     k++;
                  }
                  tmpIndex = htmlLine.indexOf(lineText);
                  if(tmpIndex != -1 && (j > currentLine || j == currentLine && tmpIndex > lastIndex))
                  {
                     deleteTags = [];
                     for each(htmlTag in htmlTags)
                     {
                        if(htmlTag.indexOf("span") != -1 || htmlTag.indexOf("</") != -1)
                        {
                           deleteTags.push(htmlTag);
                        }
                     }
                     for each(htmlTag in deleteTags)
                     {
                        htmlTags.splice(htmlTags.indexOf(htmlTag),1);
                     }
                     words = lineText.split(" ");
                     if((words[0] as String).match(/\[(\d{2}:?){3}\]/g).length > 0)
                     {
                        words.splice(0,1);
                     }
                     numWords = words.length;
                     numTags = htmlTags.length;
                     for(k = 0; k < numWords; )
                     {
                        w = words[k];
                        w = w.replace(".","");
                        w = w.replace("(","");
                        w = w.replace(")","");
                        if(w.length != 0)
                        {
                           if(!wordCount[j])
                           {
                              wordCount[j] = new Dictionary(true);
                           }
                           if(!wordCount[j][w])
                           {
                              wordCount[j][w] = 1;
                           }
                           else
                           {
                              wordCount[j][w]++;
                           }
                           wordOccurenceIndex = wordCount[j][w] - 1;
                           openTags = [];
                           closeTags = [];
                           tmpText = this._lines[j];
                           for(l = 0; l < numTags; l++)
                           {
                              if(this.isWithinTag(tmpText,htmlTags[l],w,wordOccurenceIndex))
                              {
                                 openTags.push(htmlTags[l]);
                              }
                              tmpText = tmpText.replace(htmlTags[l],"");
                              tmpText = tmpText.replace(this.getCloseTag(htmlTags[l]),"");
                           }
                           for(l = openTags.length - 1; l >= 0; l--)
                           {
                              closeTags.push(this.getCloseTag(openTags[l]));
                           }
                           tmpLineText = this.getTextWithoutTimeStamp(lineText);
                           wordIndex = this.getWordIndex(tmpLineText,w,wordOccurenceIndex);
                           if(wordIndex != -1)
                           {
                              tmpReplaceText = tmpLineText.substr(wordIndex,tmpLineText.length - wordIndex).replace(w,openTags.join("") + w + closeTags.join(""));
                              tsText = lineText != tmpLineText && lineText.indexOf("]") != -1?lineText.substr(0,lineText.indexOf("]") + 2):"";
                              lineText = tsText + tmpLineText.substr(0,wordIndex) + tmpReplaceText;
                           }
                        }
                        k++;
                     }
                     lastIndex = tmpIndex;
                     newSpanIndex = htmlLine.indexOf("<span");
                     if(newSpanIndex != -1)
                     {
                        if(openedSpanTag && i > 0)
                        {
                           this._scrollBar.wordWrapLines[i - 1] = this._scrollBar.wordWrapLines[i - 1] + "</span>";
                        }
                        lineText = htmlLine.substring(newSpanIndex,htmlLine.indexOf(">") + 1) + lineText;
                        openedSpanTag = true;
                     }
                     if(j > currentLine)
                     {
                        currentLine = j;
                     }
                     lastLine = j;
                     break;
                  }
                  lastIndex = -1;
                  j++;
               }
               if(i == this._scrollBar.textFieldNumLines - 1)
               {
                  lineText = lineText + "</span>";
               }
               this._scrollBar.wordWrapLines.push(lineText);
               this._wordWrapLinesCache[rawText] = lineText;
            }
         }
      }
      
      private function getCloseTag(pOpenTag:String) : String
      {
         var closeTag:* = null;
         var hasParams:* = pOpenTag.indexOf(" ") != -1;
         if(!hasParams)
         {
            closeTag = "</" + pOpenTag.substring(pOpenTag.indexOf("<") + 1,pOpenTag.indexOf(">") + 1);
         }
         else
         {
            closeTag = "</" + pOpenTag.substring(pOpenTag.indexOf("<") + 1,pOpenTag.indexOf(" ")) + ">";
         }
         return closeTag;
      }
      
      private function isWithinTag(pSourceText:String, pSourceTag:String, pText:String, pWordOccurrenceIndex:int) : Boolean
      {
         var textStartIndex:int = 0;
         var i:int = 0;
         var currentIndex:int = 0;
         var sourceText:String = this.getTextWithoutTimeStamp(pSourceText);
         var openTagIndex:int = sourceText.indexOf(pSourceTag);
         var closeTagIndex:int = sourceText.indexOf(this.getCloseTag(pSourceTag),openTagIndex);
         if(pWordOccurrenceIndex == 0)
         {
            textStartIndex = pSourceTag.indexOf(pText) != -1?int(openTagIndex + pSourceTag.length):0;
         }
         else
         {
            currentIndex = sourceText.indexOf(pText);
            for(i = 0; i < pWordOccurrenceIndex; i++)
            {
               textStartIndex = sourceText.indexOf(pText,currentIndex + pText.length);
               currentIndex = textStartIndex;
            }
         }
         var textIndex:int = sourceText.indexOf(pText,textStartIndex);
         return openTagIndex < textIndex && closeTagIndex > textIndex;
      }
      
      private function getTextWithoutTimeStamp(pText:String) : String
      {
         if(pText.match(/\[(\d{2}:?){3}\]/g).length == 0)
         {
            return pText;
         }
         var textStart:int = pText.indexOf("]") + 2;
         return pText.substr(textStart,pText.length - textStart);
      }
      
      private function getWordIndex(pFullText:String, pWord:String, pWordOcurrence:int) : int
      {
         var testTag:String = null;
         var wordIndex:int = 0;
         var startIndex:int = 0;
         var numWord:int = 0;
         var found:Boolean = false;
         var tags:Array = pFullText.match(ALL_HTML_TAGS);
         var previousIndex:int = -1;
         for(var wordLen:int = pWord.length; !found; )
         {
            wordIndex = pFullText.indexOf(pWord,startIndex);
            if(wordIndex != -1)
            {
               testTag = pFullText.substring(startIndex + pFullText.substring(startIndex,wordIndex).lastIndexOf("<"),wordIndex) + pFullText.substring(wordIndex,pFullText.indexOf(">",wordIndex + wordLen) + 1);
               if(tags.indexOf(testTag) == -1)
               {
                  previousIndex = wordIndex;
                  if(numWord == pWordOcurrence)
                  {
                     found = true;
                  }
                  else
                  {
                     numWord++;
                  }
               }
               startIndex = wordIndex + wordLen;
               continue;
            }
            return previousIndex;
         }
         return wordIndex;
      }
      
      private function onIconFilterMouseDown(e:Event) : void
      {
         if(this._filterUI)
         {
            this.openFilterUI(!this._filterUI.parent);
         }
         else
         {
            this.openFilterUI(true);
         }
      }
      
      private function onFilterChange(event:Event = null) : void
      {
         var message:TypeMessage = null;
         var type:int = 0;
         var text:String = null;
         var newLines:Array = null;
         this._lines.splice(0,this._lines.length);
         var filterIsOn:Boolean = this._filterUI && this._filterUI.isOn;
         var num:int = this._allInfo.length;
         for(var i:int = -1; ++i < num; )
         {
            message = this._allInfo[i];
            if(!(filterIsOn && this._filterUI.isFiltered(message.name)))
            {
               type = message.type;
               if(!(type == TypeMessage.TYPE_HOOK && !this._showHook))
               {
                  if(!(type == TypeMessage.TYPE_UI && !this._showUI))
                  {
                     if(!(type == TypeMessage.TYPE_ACTION && !this._showAction))
                     {
                        if(!(type == TypeMessage.TYPE_SHORTCUT && !this._showShortcut))
                        {
                           if(!(this._chatMode && type != TypeMessage.LOG_CHAT))
                           {
                              text = message.textInfo;
                              newLines = text.split("\n");
                              this._lines.push.apply(this._lines,newLines);
                           }
                        }
                     }
                  }
               }
            }
         }
         this._scrollBar.scrollText(-1);
         this._scrollBarH.resize();
         this.onResize();
      }
      
      private function onResize(event:Event = null) : void
      {
         var posX:int = 0;
         var k:int = 0;
         this._backGround.graphics.clear();
         this._backGround.graphics.beginFill(this._bgColor);
         this._backGround.graphics.drawRect(0,0,this._window.stage.stageWidth,this._window.stage.stageHeight);
         this._backGround.graphics.endFill();
         this._backGround.graphics.beginFill(OPTIONS_BACKGROUND_COLOR);
         this._backGround.graphics.drawRect(0,0,this._window.stage.stageWidth,OPTIONS_HEIGHT);
         this._backGround.graphics.endFill();
         if(this._iconList)
         {
            this._iconList.x = 10;
            this._iconList.y = 3;
         }
         if(this._filterButton)
         {
            posX = this._window.stage.stageWidth - ICON_SIZE - 20;
            for(k = this._filterButton.length - 1; k >= 0; k--)
            {
               this._filterButton[k].x = posX;
               posX = posX - (ICON_SIZE + 5);
            }
         }
         if(this._filterUI)
         {
            this._filterUI.x = this._window.stage.stageWidth - this._filterUI.width - 20;
            this._filterUI.y = OPTIONS_HEIGHT + 10;
         }
         this._textField.y = OPTIONS_HEIGHT;
         this._textField.width = this._window.stage.stageWidth - TextFieldScrollBar.WIDTH;
         this._textField.height = this._window.stage.stageHeight - this._textField.y - SCROLLBAR_SIZE;
         if(this._textField.wordWrap)
         {
            this.updateWordWrapLines();
         }
         var numLines:int = this._textField.numLines / (this._textField.textHeight / this._textField.height);
         this._scrollBar.addEventListener(Event.CHANGE,this.onScrollVChange);
         this._scrollBar.scrollAtEnd();
         this._scrollBar.resize(numLines);
         this._scrollBarH.resize();
      }
      
      private function onTextClick(textEvent:TextEvent) : void
      {
         var text:String = textEvent.text;
         if(text.charAt(0) == "@")
         {
            this._filterUI.addToFilter(text.substr(1));
         }
      }
      
      private function onBookClick(e:MouseEvent) : void
      {
         var target:ConsoleIcon = e.currentTarget as ConsoleIcon;
         var type:int = int(target.name.substr(1));
         if(type == TypeMessage.TYPE_HOOK)
         {
            this._showHook = !this._showHook;
            target.disable(!this._showHook);
         }
         else if(type == TypeMessage.TYPE_UI)
         {
            this._showUI = !this._showUI;
            target.disable(!this._showUI);
         }
         else if(type == TypeMessage.TYPE_ACTION)
         {
            this._showAction = !this._showAction;
            target.disable(!this._showAction);
         }
         else if(type == TypeMessage.TYPE_SHORTCUT)
         {
            this._showShortcut = !this._showShortcut;
            target.disable(!this._showShortcut);
         }
         this.onFilterChange();
      }
      
      private function saveText(e:Event) : void
      {
         var fileName:* = File.desktopDirectory.nativePath + File.separator + "dofus_chat-";
         var d:Date = new Date();
         fileName = fileName + TimeManager.getInstance().formatDateIRL(d.time).split("/").join("-");
         fileName = fileName + ("." + TimeManager.getInstance().formatClock(d.time).replace(":",""));
         fileName = fileName + ".txt";
         var file:File = new File(fileName);
         file.browseForSave(I18n.getUiText("ui.common.save"));
         file.addEventListener(Event.SELECT,this.onFileSelect);
      }
      
      private function onClose(e:Event) : void
      {
         var chatFrame:ChatFrame = null;
         var text:* = undefined;
         _displayed = false;
         this._window = null;
         this.saveData();
         if(this._chatMode)
         {
            chatFrame = Kernel.getWorker().getFrame(ChatFrame) as ChatFrame;
            if(chatFrame)
            {
               chatFrame.getHistoryMessages().length = 0;
            }
            this._updateWordWrapTimer.removeEventListener(TimerEvent.TIMER,this.onUpdateWordWrap);
            for(text in this._wordWrapLinesCache)
            {
               delete this._wordWrapLinesCache[text];
            }
         }
      }
      
      private function onFileSelect(e:Event) : void
      {
         var fileStream:FileStream = null;
         var text:String = null;
         try
         {
            text = this._lines.join(File.lineEnding);
            text = text.replace(this.regExp,"");
            text = text.replace(this.regExp2," ");
            fileStream = new FileStream();
            fileStream.open(e.target as File,FileMode.WRITE);
            fileStream.writeUTFBytes(text);
            fileStream.close();
            return;
         }
         catch(e:Error)
         {
            return;
         }
         finally
         {
            if(fileStream)
            {
               fileStream.close();
            }
         }
      }
      
      private function onScrollVChange(e:Event) : void
      {
         this._scrollBarH.resize();
      }
   }
}
