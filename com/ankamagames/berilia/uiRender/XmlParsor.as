package com.ankamagames.berilia.uiRender
{
   import com.adobe.utils.StringUtil;
   import com.ankamagames.berilia.components.ComboBox;
   import com.ankamagames.berilia.components.Grid;
   import com.ankamagames.berilia.components.InputComboBox;
   import com.ankamagames.berilia.components.Tree;
   import com.ankamagames.berilia.enums.EventEnums;
   import com.ankamagames.berilia.enums.LocationTypeEnum;
   import com.ankamagames.berilia.enums.StatesEnum;
   import com.ankamagames.berilia.enums.StrataEnum;
   import com.ankamagames.berilia.enums.XmlAttributesEnum;
   import com.ankamagames.berilia.enums.XmlTagsEnum;
   import com.ankamagames.berilia.managers.BindsManager;
   import com.ankamagames.berilia.types.event.ParsingErrorEvent;
   import com.ankamagames.berilia.types.event.ParsorEvent;
   import com.ankamagames.berilia.types.event.PreProcessEndEvent;
   import com.ankamagames.berilia.types.graphic.ButtonContainer;
   import com.ankamagames.berilia.types.graphic.GraphicContainer;
   import com.ankamagames.berilia.types.graphic.GraphicLocation;
   import com.ankamagames.berilia.types.graphic.GraphicSize;
   import com.ankamagames.berilia.types.graphic.ScrollContainer;
   import com.ankamagames.berilia.types.graphic.StateContainer;
   import com.ankamagames.berilia.types.uiDefinition.BasicElement;
   import com.ankamagames.berilia.types.uiDefinition.ButtonElement;
   import com.ankamagames.berilia.types.uiDefinition.ComponentElement;
   import com.ankamagames.berilia.types.uiDefinition.ContainerElement;
   import com.ankamagames.berilia.types.uiDefinition.GridElement;
   import com.ankamagames.berilia.types.uiDefinition.ScrollContainerElement;
   import com.ankamagames.berilia.types.uiDefinition.StateContainerElement;
   import com.ankamagames.berilia.types.uiDefinition.UiDefinition;
   import com.ankamagames.berilia.utils.ComponentList;
   import com.ankamagames.berilia.utils.GridItemList;
   import com.ankamagames.jerakine.data.GameDataField;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.managers.LangManager;
   import com.ankamagames.jerakine.resources.events.ResourceErrorEvent;
   import com.ankamagames.jerakine.resources.events.ResourceLoadedEvent;
   import com.ankamagames.jerakine.resources.loaders.IResourceLoader;
   import com.ankamagames.jerakine.resources.loaders.ResourceLoaderFactory;
   import com.ankamagames.jerakine.resources.loaders.ResourceLoaderType;
   import com.ankamagames.jerakine.types.Uri;
   import com.ankamagames.jerakine.utils.misc.DescribeTypeCache;
   import com.ankamagames.jerakine.utils.misc.Levenshtein;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.system.ApplicationDomain;
   import flash.utils.getQualifiedClassName;
   import flash.xml.XMLDocument;
   import flash.xml.XMLNode;
   
   public class XmlParsor extends EventDispatcher
   {
      
      private static var _classDescCache:Object = new Object();
       
      
      protected const _componentList:ComponentList = null;
      
      protected const _GridItemList:GridItemList = null;
      
      protected const _log:Logger = Log.getLogger(getQualifiedClassName(XmlParsor));
      
      protected var _xmlDoc:XMLDocument;
      
      protected var _sUrl:String;
      
      protected var _aName:Array;
      
      protected var _glPoint:GraphicLocation;
      
      private var _loader:IResourceLoader;
      
      private var _describeType:Function;
      
      public var rootPath:String;
      
      public function XmlParsor()
      {
         this._loader = ResourceLoaderFactory.getLoader(ResourceLoaderType.PARALLEL_LOADER);
         this._describeType = DescribeTypeCache.typeDescription;
         super();
         this._loader.addEventListener(ResourceLoadedEvent.LOADED,this.onXmlLoadComplete);
         this._loader.addEventListener(ResourceErrorEvent.ERROR,this.onXmlLoadError);
      }
      
      public function get url() : String
      {
         return this._sUrl;
      }
      
      public function get xmlDocString() : String
      {
         return !!this._xmlDoc?this._xmlDoc.toString():null;
      }
      
      public function processFile(sUrl:String) : void
      {
         this._sUrl = sUrl;
         this._loader.load(new Uri(this._sUrl));
      }
      
      public function processXml(sXml:String) : void
      {
         var errorLog:String = null;
         var i:uint = 0;
         var regOpenTagAdv:RegExp = null;
         var regOpenTag:RegExp = null;
         var tmp:Array = null;
         var openTag:Array = null;
         var tag:String = null;
         var regCloseTag:RegExp = null;
         var closeTag:Array = null;
         this._xmlDoc = new XMLDocument();
         this._xmlDoc.ignoreWhite = true;
         try
         {
            this._xmlDoc.parseXML(sXml.toString());
         }
         catch(e:Error)
         {
            if(sXml)
            {
               regOpenTagAdv = /<\w+[^>]*/g;
               regOpenTag = /<\w+/g;
               tmp = sXml.match(regOpenTagAdv);
               openTag = new Array();
               i = 0;
               while(i < tmp.length)
               {
                  if(tmp[i].substr(tmp[i].length - 1) != "/")
                  {
                     tag = tmp[i].match(regOpenTag)[0];
                     if(!openTag[tag])
                     {
                        openTag[tag] = 0;
                     }
                     openTag[tag]++;
                  }
                  i++;
               }
               regCloseTag = /<\/\w+/g;
               tmp = sXml.match(regCloseTag);
               closeTag = new Array();
               i = 0;
               while(i < tmp.length)
               {
                  tag = "<" + tmp[i].substr(2);
                  if(!closeTag[tag])
                  {
                     closeTag[tag] = 0;
                  }
                  closeTag[tag]++;
                  i++;
               }
            }
            errorLog = "";
            for(tag in openTag)
            {
               if(!closeTag[tag] || closeTag[tag] != openTag[tag])
               {
                  errorLog = errorLog + ("\n - " + tag + " have no closing tag");
               }
            }
            for(tag in closeTag)
            {
               if(!openTag[tag] || openTag[tag] != closeTag[tag])
               {
                  errorLog = errorLog + ("\n - </" + tag.substr(1) + "> is lonely closing tag");
               }
            }
            _log.error("Error when parsing " + _sUrl + ", misformatted xml" + (!!errorLog.length?" : " + errorLog:""));
            dispatchEvent(new ParsorEvent(null,true));
         }
         this._aName = new Array();
         this.preProccessXml();
      }
      
      private function preProccessXml() : void
      {
         var tmp:XmlPreProcessor = new XmlPreProcessor(this._xmlDoc);
         tmp.addEventListener(PreProcessEndEvent.PRE_PROCESS_END,this.onPreProcessCompleted);
         tmp.processTemplate();
      }
      
      private function mainProcess() : void
      {
         if(this._xmlDoc && this._xmlDoc.firstChild)
         {
            dispatchEvent(new ParsorEvent(this.parseMainNode(this._xmlDoc.firstChild),false));
         }
         else
         {
            dispatchEvent(new ParsorEvent(null,true));
         }
      }
      
      protected function parseMainNode(mainNodes:XMLNode) : UiDefinition
      {
         var xnNode:XMLNode = null;
         var i:int = 0;
         var tmpBe:BasicElement = null;
         var suggestion:String = null;
         var ui:UiDefinition = new UiDefinition();
         var aNodes:Array = mainNodes.childNodes;
         if(!aNodes.length)
         {
            return null;
         }
         var mainNodesAttributes:Object = mainNodes.attributes;
         var attributesDebug:String = mainNodesAttributes[XmlAttributesEnum.ATTRIBUTE_DEBUG];
         var attributesUseCache:String = mainNodesAttributes[XmlAttributesEnum.ATTRIBUTE_USECACHE];
         var attributesUsePropertiesCache:String = mainNodesAttributes[XmlAttributesEnum.ATTRIBUTE_USEPROPERTIESCACHE];
         var attributesModal:String = mainNodesAttributes[XmlAttributesEnum.ATTRIBUTE_MODAL];
         var attributesScalable:String = mainNodesAttributes[XmlAttributesEnum.ATTRIBUTE_SCALABLE];
         var attributesFocus:String = mainNodesAttributes[XmlAttributesEnum.ATTRIBUTE_FOCUS];
         var attributesTransmitFocus:String = mainNodesAttributes[XmlAttributesEnum.ATTRIBUTE_TRANSMITFOCUS];
         var attributesLabelDebug:String = mainNodesAttributes[XmlAttributesEnum.ATTRIBUTE_LABEL_DEBUG];
         var attributesFullscreen:String = mainNodesAttributes[XmlAttributesEnum.ATTRIBUTE_FULLSCREEN];
         var attributesSetOnTopOnClick:String = mainNodesAttributes[XmlAttributesEnum.ATTRIBUTE_SETONTOP_ONCLICK];
         if(attributesDebug)
         {
            ui.debug = attributesDebug == "true";
         }
         if(attributesUseCache)
         {
            ui.useCache = attributesUseCache == "true";
         }
         if(attributesUsePropertiesCache)
         {
            ui.usePropertiesCache = attributesUsePropertiesCache == "true";
         }
         if(attributesModal)
         {
            ui.modal = attributesModal == "true";
         }
         if(attributesScalable)
         {
            ui.scalable = attributesScalable == "true";
         }
         if(attributesFocus)
         {
            ui.giveFocus = attributesFocus == "true";
         }
         if(attributesTransmitFocus)
         {
            ui.transmitFocus = attributesTransmitFocus == "true";
         }
         if(attributesLabelDebug)
         {
            ui.labelDebug = attributesLabelDebug == "true";
         }
         if(attributesFullscreen)
         {
            ui.fullscreen = attributesFullscreen == "true";
         }
         if(attributesSetOnTopOnClick)
         {
            ui.setOnTopOnClick = attributesSetOnTopOnClick == "true";
         }
         var numNodes:int = aNodes.length;
         this._glPoint = new GraphicLocation();
         for(i = 0; i < numNodes; )
         {
            xnNode = aNodes[i];
            switch(xnNode.nodeName)
            {
               case XmlTagsEnum.TAG_CONSTANTS:
                  this.parseConstants(xnNode,ui.constants);
                  break;
               case XmlTagsEnum.TAG_CONTAINER:
               case XmlTagsEnum.TAG_SCROLLCONTAINER:
               case XmlTagsEnum.TAG_STATECONTAINER:
               case XmlTagsEnum.TAG_BUTTON:
                  tmpBe = this.parseGraphicElement(xnNode);
                  if(tmpBe)
                  {
                     ui.graphicTree.push(tmpBe);
                     break;
                  }
                  break;
               case XmlTagsEnum.TAG_SHORTCUTS:
                  ui.shortcutsEvents = this.parseShortcutsEvent(xnNode);
                  break;
               default:
                  suggestion = "";
                  if(xnNode && xnNode.nodeName)
                  {
                     suggestion = this.suggest(xnNode.nodeName,[XmlTagsEnum.TAG_CONTAINER,XmlTagsEnum.TAG_STATECONTAINER,XmlTagsEnum.TAG_BUTTON,XmlTagsEnum.TAG_SHORTCUTS]);
                  }
                  this._log.warn("[" + this._sUrl + "] " + xnNode.nodeName + " is not allowed or unknown. " + suggestion);
            }
            i = i + 1;
         }
         this.cleanLocalConstants(ui.constants);
         this._glPoint = null;
         return ui;
      }
      
      private function cleanLocalConstants(constants:Array) : void
      {
         var constant:* = null;
         for(constant in constants)
         {
            LangManager.getInstance().deleteEntry("local." + constant);
         }
      }
      
      protected function parseConstants(xnNode:XMLNode, constants:Array) : void
      {
         var xnCurrentNode:XMLNode = null;
         var i:int = 0;
         var value:String = null;
         var nodeName:String = null;
         var nameAttribute:String = null;
         var typeAttribute:String = null;
         var xnNodeChildNodes:Array = xnNode.childNodes;
         var xnNodechildNodesLength:int = xnNodeChildNodes.length;
         for(i = 0; i < xnNodechildNodesLength; i = i + 1)
         {
            xnCurrentNode = xnNodeChildNodes[i];
            nodeName = xnCurrentNode.nodeName;
            if(nodeName != XmlTagsEnum.TAG_CONSTANT)
            {
               this._log.error(nodeName + " found, wrong node name, waiting for " + XmlTagsEnum.TAG_CONSTANT + " in " + this._sUrl);
            }
            else
            {
               nameAttribute = xnCurrentNode.attributes["name"];
               if(!nameAttribute)
               {
                  this._log.error("Constant name\'s not found in " + this._sUrl);
               }
               else
               {
                  value = LangManager.getInstance().replaceKey(xnCurrentNode.attributes["value"]);
                  typeAttribute = xnCurrentNode.attributes["type"];
                  if(typeAttribute)
                  {
                     typeAttribute = typeAttribute.toUpperCase();
                     if(typeAttribute == "STRING")
                     {
                        constants[nameAttribute] = value;
                     }
                     else if(typeAttribute == "NUMBER")
                     {
                        constants[nameAttribute] = Number(value);
                     }
                     else if(typeAttribute == "UINT" || typeAttribute == "INT")
                     {
                        constants[nameAttribute] = int(value);
                     }
                     else if(typeAttribute == "BOOLEAN")
                     {
                        constants[nameAttribute] = value == "true";
                     }
                     else if(typeAttribute == "ARRAY")
                     {
                        constants[nameAttribute] = value.split(",");
                     }
                  }
                  else
                  {
                     constants[nameAttribute] = value;
                  }
                  LangManager.getInstance().setEntry("local." + nameAttribute,value);
               }
            }
         }
      }
      
      protected function parseGraphicElement(xnNode:XMLNode, parentNode:XMLNode = null, be:BasicElement = null) : BasicElement
      {
         var xnCurrentNode:XMLNode = null;
         var i:int = 0;
         var j:String = null;
         var s:GraphicSize = null;
         var c:Class = null;
         var val:* = undefined;
         var classDesc:Object = null;
         var tmpBasicElement:BasicElement = null;
         var xmlStr:String = null;
         var contentstr:String = null;
         var clazz:Class = null;
         var tmpBe:BasicElement = null;
         var xmlStr2:String = null;
         var xnNodeChildNodes:Array = xnNode.childNodes;
         var xnNodeChildNodesLength:int = xnNodeChildNodes.length;
         if(!parentNode)
         {
            parentNode = xnNode;
         }
         if(!be)
         {
            switch(parentNode.nodeName)
            {
               case XmlTagsEnum.TAG_CONTAINER:
                  be = new ContainerElement();
                  be.className = getQualifiedClassName(GraphicContainer);
                  break;
               case XmlTagsEnum.TAG_SCROLLCONTAINER:
                  be = new ScrollContainerElement();
                  be.className = getQualifiedClassName(ScrollContainer);
                  break;
               case XmlTagsEnum.TAG_GRID:
                  be = new GridElement();
                  be.className = getQualifiedClassName(Grid);
                  break;
               case XmlTagsEnum.TAG_COMBOBOX:
                  be = new GridElement();
                  be.className = getQualifiedClassName(ComboBox);
                  break;
               case XmlTagsEnum.TAG_INPUTCOMBOBOX:
                  be = new GridElement();
                  be.className = getQualifiedClassName(InputComboBox);
                  break;
               case XmlTagsEnum.TAG_TREE:
                  be = new GridElement();
                  be.className = getQualifiedClassName(Tree);
                  break;
               case XmlTagsEnum.TAG_STATECONTAINER:
                  be = new StateContainerElement();
                  be.className = getQualifiedClassName(StateContainer);
                  break;
               case XmlTagsEnum.TAG_BUTTON:
                  be = new ButtonElement();
                  be.className = getQualifiedClassName(ButtonContainer);
                  break;
               default:
                  be = new ComponentElement();
                  ComponentElement(be).className = "com.ankamagames.berilia.components::" + parentNode.nodeName;
            }
         }
         for(var _loc21_ in parentNode.attributes)
         {
            switch(_loc21_)
            {
               case XmlAttributesEnum.ATTRIBUTE_NAME:
                  be.setName(parentNode.attributes[j]);
                  this._aName[parentNode.attributes[j]] = be;
                  continue;
               case XmlAttributesEnum.ATTRIBUTE_VISIBLE:
                  be.properties["visible"] = Boolean(parentNode.attributes[j]);
                  continue;
               case XmlAttributesEnum.ATTRIBUTE_STRATA:
                  be.strata = this.getStrataNum(parentNode.attributes[j]);
                  continue;
               case XmlAttributesEnum.ATTRIBUTE_IGNORE:
                  if(parentNode.attributes[j] == "1" || parentNode.attributes[j] == "true")
                  {
                     return null;
                  }
                  continue;
               default:
                  this._log.warn("[" + this._sUrl + "] Unknown attribute \'" + j + "\' in " + XmlTagsEnum.TAG_CONTAINER + " tag");
                  continue;
            }
         }
         for(i = 0; i < xnNodeChildNodesLength; )
         {
            xnCurrentNode = xnNodeChildNodes[i];
            loop4:
            switch(xnCurrentNode.nodeName)
            {
               case XmlTagsEnum.TAG_ANCHORS:
                  be.anchors = this.parseAnchors(xnCurrentNode);
                  break;
               case XmlTagsEnum.TAG_SIZE:
                  s = this.parseSize(xnCurrentNode,true);
                  if(s)
                  {
                     be.size = s.toSizeElement();
                     break;
                  }
                  break;
               case XmlTagsEnum.TAG_EVENTS:
                  be.event = this.parseEvent(xnCurrentNode);
                  break;
               case XmlTagsEnum.TAG_MINIMALSIZE:
                  be.minSize = this.parseSize(xnCurrentNode,false).toSizeElement();
                  break;
               case XmlTagsEnum.TAG_MAXIMALSIZE:
                  be.maxSize = this.parseSize(xnCurrentNode,false).toSizeElement();
                  break;
               case XmlTagsEnum.TAG_SCROLLCONTAINER:
               case XmlTagsEnum.TAG_CONTAINER:
               case XmlTagsEnum.TAG_GRID:
               case XmlTagsEnum.TAG_COMBOBOX:
               case XmlTagsEnum.TAG_INPUTCOMBOBOX:
               case XmlTagsEnum.TAG_TREE:
                  switch(parentNode.nodeName)
                  {
                     case XmlTagsEnum.TAG_CONTAINER:
                     case XmlTagsEnum.TAG_BUTTON:
                     case XmlTagsEnum.TAG_STATECONTAINER:
                     case XmlTagsEnum.TAG_SCROLLCONTAINER:
                     case XmlTagsEnum.TAG_COMBOBOX:
                     case XmlTagsEnum.TAG_INPUTCOMBOBOX:
                     case XmlTagsEnum.TAG_TREE:
                     case XmlTagsEnum.TAG_GRID:
                        tmpBasicElement = this.parseGraphicElement(xnCurrentNode);
                        if(tmpBasicElement)
                        {
                           ContainerElement(be).childs.push(tmpBasicElement);
                           break loop4;
                        }
                        break loop4;
                     default:
                        this._log.warn("[" + this._sUrl + "] " + parentNode.nodeName + " cannot contains " + xnCurrentNode.nodeName);
                        break loop4;
                  }
               case XmlTagsEnum.TAG_STATECONTAINER:
               case XmlTagsEnum.TAG_BUTTON:
                  switch(parentNode.nodeName)
                  {
                     case XmlTagsEnum.TAG_CONTAINER:
                     case XmlTagsEnum.TAG_STATECONTAINER:
                     case XmlTagsEnum.TAG_SCROLLCONTAINER:
                     case XmlTagsEnum.TAG_GRID:
                     case XmlTagsEnum.TAG_COMBOBOX:
                     case XmlTagsEnum.TAG_INPUTCOMBOBOX:
                     case XmlTagsEnum.TAG_TREE:
                        if(xnCurrentNode.attributes["ignore"] != "true")
                        {
                           ContainerElement(be).childs.push(this.parseStateContainer(xnCurrentNode,xnCurrentNode.nodeName));
                           break loop4;
                        }
                        break loop4;
                     default:
                        this._log.warn("[" + this._sUrl + "] " + parentNode.nodeName + " cannot contains Button");
                        break loop4;
                  }
               default:
                  switch(parentNode.nodeName)
                  {
                     case XmlTagsEnum.TAG_CONTAINER:
                        c = GraphicContainer;
                        break;
                     case XmlTagsEnum.TAG_BUTTON:
                        c = ButtonContainer;
                        break;
                     case XmlTagsEnum.TAG_STATECONTAINER:
                        c = StateContainer;
                        break;
                     case XmlTagsEnum.TAG_SCROLLCONTAINER:
                        c = ScrollContainer;
                        break;
                     case XmlTagsEnum.TAG_GRID:
                        c = Grid;
                        break;
                     case XmlTagsEnum.TAG_COMBOBOX:
                        c = ComboBox;
                        break;
                     case XmlTagsEnum.TAG_INPUTCOMBOBOX:
                        c = InputComboBox;
                        break;
                     case XmlTagsEnum.TAG_TREE:
                        c = Tree;
                  }
                  classDesc = this.getClassDesc(c);
                  if(classDesc[xnCurrentNode.nodeName])
                  {
                     if(xnCurrentNode.firstChild)
                     {
                        xmlStr = xnCurrentNode.toString();
                        contentstr = xmlStr.substr(xnCurrentNode.nodeName.length + 2,xmlStr.length - xnCurrentNode.nodeName.length * 2 - 5);
                        val = LangManager.getInstance().replaceKey(contentstr);
                        switch(classDesc[xnCurrentNode.nodeName])
                        {
                           case "Boolean":
                              val = val != "false";
                              break;
                           case "*":
                              val = val;
                              break;
                           default:
                              if(val.charAt(0) == "[" && val.charAt(val.length - 1) == "]")
                              {
                                 break;
                              }
                              clazz = GameDataField.getClassByName(classDesc[xnCurrentNode.nodeName]);
                              val = new clazz(val);
                              break;
                        }
                        ContainerElement(be).properties[xnCurrentNode.nodeName] = val;
                        break;
                     }
                     break;
                  }
                  switch(parentNode.nodeName)
                  {
                     case XmlTagsEnum.TAG_CONTAINER:
                     case XmlTagsEnum.TAG_BUTTON:
                     case XmlTagsEnum.TAG_STATECONTAINER:
                     case XmlTagsEnum.TAG_SCROLLCONTAINER:
                     case XmlTagsEnum.TAG_GRID:
                     case XmlTagsEnum.TAG_COMBOBOX:
                     case XmlTagsEnum.TAG_INPUTCOMBOBOX:
                     case XmlTagsEnum.TAG_TREE:
                        if(ApplicationDomain.currentDomain.hasDefinition("com.ankamagames.berilia.components." + xnCurrentNode.nodeName))
                        {
                           tmpBe = this.parseGraphicElement(xnCurrentNode);
                           if(tmpBe)
                           {
                              ContainerElement(be).childs.push(tmpBe);
                              break loop4;
                           }
                           break loop4;
                        }
                        if(!xnCurrentNode.nodeValue || StringUtil.trim(xnCurrentNode.nodeValue).length > 0)
                        {
                           this._log.warn("[" + this._sUrl + "] " + xnCurrentNode.nodeName + " is unknown component / property on " + parentNode.nodeName);
                           break loop4;
                        }
                        break loop4;
                     default:
                        if(xnCurrentNode.firstChild != null)
                        {
                           xmlStr2 = xnCurrentNode.toString();
                           be.properties[xnCurrentNode.nodeName] = xmlStr2.substr(xnCurrentNode.nodeName.length + 2,xmlStr2.length - xnCurrentNode.nodeName.length * 2 - 5);
                           break loop4;
                        }
                        break loop4;
                  }
            }
            i = i + 1;
         }
         if(be is ComponentElement)
         {
            this.cleanComponentProperty(ComponentElement(be));
         }
         return be;
      }
      
      protected function parseStateContainer(xnNode:XMLNode, elementType:String) : *
      {
         var xnCurrentNode:XMLNode = null;
         var i:int = 0;
         var stateContainerElement:StateContainerElement = null;
         var stateConst:* = undefined;
         var stateType:String = null;
         var possibilities:Array = null;
         var xnNodeChildNodes:Array = xnNode.childNodes;
         var xnNodeChildNodesLength:int = xnNodeChildNodes.length;
         if(elementType == XmlTagsEnum.TAG_BUTTON)
         {
            stateContainerElement = new ButtonElement();
         }
         if(elementType == XmlTagsEnum.TAG_STATECONTAINER)
         {
            stateContainerElement = new StateContainerElement();
         }
         stateContainerElement.className = getQualifiedClassName(ButtonContainer);
         for(i = 0; i < xnNodeChildNodesLength; )
         {
            xnCurrentNode = xnNodeChildNodes[i];
            switch(xnCurrentNode.nodeName)
            {
               case XmlTagsEnum.TAG_COMMON:
                  this.parseGraphicElement(xnCurrentNode,xnNode,stateContainerElement);
                  break;
               case XmlTagsEnum.TAG_STATE:
                  stateType = xnCurrentNode.attributes[XmlAttributesEnum.ATTRIBUTE_TYPE];
                  if(stateType)
                  {
                     if(elementType == XmlTagsEnum.TAG_STATECONTAINER)
                     {
                        stateConst = stateType;
                     }
                     else
                     {
                        stateConst = 9999;
                        switch(stateType)
                        {
                           case StatesEnum.STATE_CLICKED_STRING:
                              stateConst = StatesEnum.STATE_CLICKED;
                              break;
                           case StatesEnum.STATE_OVER_STRING:
                              stateConst = StatesEnum.STATE_OVER;
                              break;
                           case StatesEnum.STATE_DISABLED_STRING:
                              stateConst = StatesEnum.STATE_DISABLED;
                              break;
                           case StatesEnum.STATE_SELECTED_STRING:
                              stateConst = StatesEnum.STATE_SELECTED;
                              break;
                           case StatesEnum.STATE_SELECTED_OVER_STRING:
                              stateConst = StatesEnum.STATE_SELECTED_OVER;
                              break;
                           case StatesEnum.STATE_SELECTED_CLICKED_STRING:
                              stateConst = StatesEnum.STATE_SELECTED_CLICKED;
                              break;
                           default:
                              possibilities = new Array(StatesEnum.STATE_CLICKED_STRING,StatesEnum.STATE_OVER_STRING,StatesEnum.STATE_SELECTED_STRING,StatesEnum.STATE_SELECTED_OVER_STRING,StatesEnum.STATE_SELECTED_CLICKED_STRING,StatesEnum.STATE_DISABLED_STRING);
                              this._log.warn("[" + this._sUrl + "] " + stateType + " is not a valid state " + this.suggest(stateType,possibilities));
                        }
                     }
                     if(stateConst != 9999)
                     {
                        if(!stateContainerElement.stateChangingProperties[stateConst])
                        {
                           stateContainerElement.stateChangingProperties[stateConst] = new Array();
                        }
                        this.parseSetProperties(xnCurrentNode,stateContainerElement.stateChangingProperties[stateConst]);
                        break;
                     }
                     break;
                  }
                  this._log.warn("[" + this._sUrl + "] " + XmlTagsEnum.TAG_STATE + " must have attribute [" + XmlAttributesEnum.ATTRIBUTE_TYPE + "]");
                  break;
               default:
                  this._log.warn("[" + this._sUrl + "] " + elementType + " does not allow " + xnCurrentNode.nodeName + this.suggest(xnCurrentNode.nodeName,[XmlTagsEnum.TAG_COMMON,XmlTagsEnum.TAG_STATE]));
            }
            i = i + 1;
         }
         return stateContainerElement;
      }
      
      protected function parseSetProperties(xnNode:XMLNode, item:Object) : void
      {
         var xnCurrentNode:XMLNode = null;
         var i:int = 0;
         var target:String = null;
         var aProperties:Array = null;
         var propertyNode:XMLNode = null;
         var xnCurrentNodeChildNodes:Array = null;
         var xnCurrentNodeChildNodesLength:int = 0;
         var j:int = 0;
         var xnNodeChildNodes:Array = xnNode.childNodes;
         var xnNodeChildNodesLength:int = xnNodeChildNodes.length;
         for(i = 0; i < xnNodeChildNodesLength; i = i + 1)
         {
            xnCurrentNode = xnNodeChildNodes[i];
            if(xnCurrentNode.nodeName == XmlTagsEnum.TAG_SETPROPERTY)
            {
               if(xnCurrentNode.attributes[XmlAttributesEnum.ATTRIBUTE_IGNORE])
               {
                  if(xnCurrentNode.attributes[XmlAttributesEnum.ATTRIBUTE_IGNORE] == "true")
                  {
                     continue;
                  }
               }
               target = xnCurrentNode.attributes[XmlAttributesEnum.ATTRIBUTE_TARGET];
               if(target)
               {
                  if(this._aName[target])
                  {
                     if(!item[target])
                     {
                        item[target] = new Array();
                     }
                     aProperties = item[target];
                     xnCurrentNodeChildNodes = xnCurrentNode.childNodes;
                     xnCurrentNodeChildNodesLength = xnCurrentNodeChildNodes.length;
                     for(j = 0; j < xnCurrentNodeChildNodesLength; j = j + 1)
                     {
                        propertyNode = xnCurrentNodeChildNodes[j];
                        aProperties[propertyNode.nodeName] = LangManager.getInstance().replaceKey(propertyNode.firstChild.toString());
                     }
                     this.cleanComponentProperty(this._aName[target],aProperties);
                  }
                  else
                  {
                     this._log.warn("[" + this._sUrl + "] " + "Unknown reference to \"" + target + "\" in " + XmlTagsEnum.TAG_SETPROPERTY);
                  }
               }
               else
               {
                  this._log.warn("[" + this._sUrl + "] " + "Cannot set button properties, not yet implemented");
               }
            }
            else
            {
               this._log.warn("[" + this._sUrl + "] " + "Only " + XmlTagsEnum.TAG_SETPROPERTY + " tags are authorized in " + XmlTagsEnum.TAG_STATE + " tags (found " + xnCurrentNode.nodeName + ")");
            }
         }
      }
      
      private function cleanComponentProperty(be:BasicElement, properties:Array = null) : Boolean
      {
         var val:* = undefined;
         var clazz:Class = null;
         var sProperty:* = null;
         var key:* = null;
         var possibilities:Array = null;
         var propName:* = null;
         if(!properties)
         {
            properties = be.properties;
         }
         var cComponent:Class = GameDataField.getClassByName(be.className);
         var classProp:Object = this.getClassDesc(cComponent);
         var aNewProperties:Array = new Array();
         for(sProperty in properties)
         {
            if(classProp[sProperty])
            {
               if(sProperty == "text" && properties["parseText"] == "false")
               {
                  val = properties[sProperty];
               }
               else
               {
                  val = LangManager.getInstance().replaceKey(properties[sProperty]);
               }
               switch(classProp[sProperty])
               {
                  case "Boolean":
                     val = val != "false";
                     break;
                  case "*":
                     break;
                  default:
                     if(val.charAt(0) == "[" && val.charAt(val.length - 1) == "]")
                     {
                        break;
                     }
                     clazz = GameDataField.getClassByName(classProp[sProperty]);
                     val = new clazz(val);
                     break;
               }
               aNewProperties[sProperty] = val;
            }
            else
            {
               possibilities = new Array();
               for(propName in classProp)
               {
                  possibilities.push(propName);
               }
               this._log.warn("[" + this._sUrl + "] " + sProperty + " is unknown for " + be.className + " component " + this.suggest(sProperty,possibilities));
            }
         }
         for(key in aNewProperties)
         {
            properties[key] = aNewProperties[key];
         }
         return true;
      }
      
      protected function getClassDesc(o:Object) : Object
      {
         var acc:XML = null;
         var v:XML = null;
         var cn:String = getQualifiedClassName(o);
         if(_classDescCache[cn])
         {
            return _classDescCache[cn];
         }
         var xmlClassDef:XML = this._describeType(o);
         var res:Object = new Object();
         var factory:XMLList = xmlClassDef.child("factory");
         if(factory.length() > 0)
         {
            xmlClassDef = factory[0];
         }
         for each(acc in xmlClassDef.child("accessor"))
         {
            res[acc.@name.toString()] = acc.@type.toString();
         }
         for each(v in xmlClassDef.child("variable"))
         {
            res[v.@name.toString()] = v.@type.toString();
         }
         _classDescCache[cn] = res;
         return res;
      }
      
      protected function parseSize(xnNode:XMLNode, bAllowRelativeSize:Boolean) : GraphicSize
      {
         var xnCurrentNode:XMLNode = null;
         var k:int = 0;
         var posX:String = null;
         var posY:String = null;
         if(xnNode.attributes.length > 0 || xnNode.attributes["ignore"])
         {
            if(xnNode.attributes["ignore"])
            {
               if(xnNode.attributes["ignore"] == "true")
               {
                  return null;
               }
            }
            else
            {
               this._log.warn("[" + this._sUrl + "] " + xnNode.nodeName + " cannot have attribut except ignore");
            }
         }
         var xnNodeChildNodes:Array = xnNode.childNodes;
         var xnNodeChildNodesLength:int = xnNodeChildNodes.length;
         var graphicSize:GraphicSize = new GraphicSize();
         for(k = 0; k < xnNodeChildNodesLength; )
         {
            xnCurrentNode = xnNodeChildNodes[k];
            if(xnCurrentNode.nodeName == XmlTagsEnum.TAG_RELDIMENSION)
            {
               if(!bAllowRelativeSize)
               {
                  this._log.warn("[" + this._sUrl + "] " + xnNode.nodeName + " does not allow relative size");
               }
               else
               {
                  posX = xnCurrentNode.attributes["x"];
                  if(posX)
                  {
                     graphicSize.setX(Number(LangManager.getInstance().replaceKey(posX)),GraphicSize.SIZE_PRC);
                  }
                  posY = xnCurrentNode.attributes["y"];
                  if(posY)
                  {
                     graphicSize.setY(Number(LangManager.getInstance().replaceKey(posY)),GraphicSize.SIZE_PRC);
                  }
               }
            }
            if(xnCurrentNode.nodeName == XmlTagsEnum.TAG_ABSDIMENSION)
            {
               posX = xnCurrentNode.attributes["x"];
               if(posX)
               {
                  graphicSize.setX(int(LangManager.getInstance().replaceKey(posX)),GraphicSize.SIZE_PIXEL);
               }
               posY = xnCurrentNode.attributes["y"];
               if(posY)
               {
                  graphicSize.setY(int(LangManager.getInstance().replaceKey(posY)),GraphicSize.SIZE_PIXEL);
               }
            }
            k = k + 1;
         }
         return graphicSize;
      }
      
      protected function parseAnchors(xnNode:XMLNode) : Array
      {
         var xnCurrentNode:XMLNode = null;
         var i:int = 0;
         var k:int = 0;
         var xnOffsetNode:XMLNode = null;
         var j:String = null;
         var xnCurrentNodeChildNodes:Array = null;
         var xnCurrentNodeChildNodesLength:int = 0;
         if(xnNode.attributes.length)
         {
            this._log.warn("[" + this._sUrl + "] " + xnNode.nodeName + " cannot have attributes");
         }
         var xnNodeChildNodes:Array = xnNode.childNodes;
         var xnNodeChildNodesLength:int = xnNodeChildNodes.length;
         var aResult:Array = new Array();
         for(i = 0; i < xnNodeChildNodesLength; i = i + 1)
         {
            this._glPoint.reset();
            xnCurrentNode = xnNodeChildNodes[i];
            if(xnCurrentNode.nodeName == XmlTagsEnum.TAG_ANCHOR)
            {
               for(var _loc14_ in xnCurrentNode.attributes)
               {
                  switch(_loc14_)
                  {
                     case XmlAttributesEnum.ATTRIBUTE_POINT:
                        if(aResult.length != 0)
                        {
                           this._log.error("[" + this._sUrl + "] When using double anchors, you cannot define attribute POINT");
                        }
                        else
                        {
                           this._glPoint.setPoint(xnCurrentNode.attributes[j]);
                        }
                        continue;
                     case XmlAttributesEnum.ATTRIBUTE_RELATIVEPOINT:
                        this._glPoint.setRelativePoint(xnCurrentNode.attributes[j]);
                        continue;
                     case XmlAttributesEnum.ATTRIBUTE_RELATIVETO:
                        this._glPoint.setRelativeTo(xnCurrentNode.attributes[j]);
                        continue;
                     default:
                        this._log.warn("[" + this._sUrl + "] " + xnNode.nodeName + " cannot have attribute " + j);
                        continue;
                  }
               }
               xnCurrentNodeChildNodes = xnCurrentNode.childNodes;
               xnCurrentNodeChildNodesLength = xnCurrentNodeChildNodes.length;
               for(k = 0; k < xnCurrentNodeChildNodesLength; )
               {
                  xnOffsetNode = xnCurrentNodeChildNodes[k];
                  switch(xnOffsetNode.nodeName)
                  {
                     case XmlTagsEnum.TAG_OFFSET:
                        xnOffsetNode = xnOffsetNode.firstChild;
                        break;
                     case XmlTagsEnum.TAG_RELDIMENSION:
                        if(xnOffsetNode.attributes["x"] != null)
                        {
                           this._glPoint.offsetXType = LocationTypeEnum.LOCATION_TYPE_RELATIVE;
                           this._glPoint.setOffsetX(xnOffsetNode.attributes["x"]);
                        }
                        if(xnOffsetNode.attributes["y"] != null)
                        {
                           this._glPoint.offsetYType = LocationTypeEnum.LOCATION_TYPE_RELATIVE;
                           this._glPoint.setOffsetY(xnOffsetNode.attributes["y"]);
                           break;
                        }
                        break;
                     case XmlTagsEnum.TAG_ABSDIMENSION:
                        if(xnOffsetNode.attributes["x"] != null)
                        {
                           this._glPoint.offsetXType = LocationTypeEnum.LOCATION_TYPE_ABSOLUTE;
                           this._glPoint.setOffsetX(xnOffsetNode.attributes["x"]);
                        }
                        if(xnOffsetNode.attributes["y"] != null)
                        {
                           this._glPoint.offsetYType = LocationTypeEnum.LOCATION_TYPE_ABSOLUTE;
                           this._glPoint.setOffsetY(xnOffsetNode.attributes["y"]);
                           break;
                        }
                  }
                  k = k + 1;
               }
               aResult.push(this._glPoint.toLocationElement());
            }
            else
            {
               this._log.warn("[" + this._sUrl + "] " + xnNode.nodeName + " does not allow " + xnCurrentNode.nodeName + " tag");
            }
         }
         return !!aResult.length?aResult:null;
      }
      
      protected function parseShortcutsEvent(xnNode:XMLNode) : Array
      {
         var xnCurrentNode:XMLNode = null;
         var k:int = 0;
         var sShortcutName:String = null;
         var xnNodeChildNodes:Array = xnNode.childNodes;
         var xnNodeChildNodesLength:int = xnNodeChildNodes.length;
         var aResult:Array = new Array();
         for(k = 0; k < xnNodeChildNodesLength; k = k + 1)
         {
            xnCurrentNode = xnNodeChildNodes[k];
            sShortcutName = xnCurrentNode.nodeName;
            if(!BindsManager.getInstance().isRegisteredName(sShortcutName))
            {
               this._log.info("[" + this._sUrl + "] Shortcut " + sShortcutName + " is not defined.");
            }
            aResult.push(sShortcutName);
         }
         return aResult;
      }
      
      private function parseEvent(xnNode:XMLNode) : Array
      {
         var xnCurrentNode:XMLNode = null;
         var k:int = 0;
         var sEventClass:String = null;
         var possiblilities:Array = null;
         var xnNodeChildNodes:Array = xnNode.childNodes;
         var xnNodeChildNodesLength:int = xnNodeChildNodes.length;
         var aResult:Array = new Array();
         for(k = 0; k < xnNodeChildNodesLength; k = k + 1)
         {
            xnCurrentNode = xnNodeChildNodes[k];
            sEventClass = "";
            switch(xnCurrentNode.nodeName)
            {
               case EventEnums.EVENT_ONPRESS:
                  sEventClass = EventEnums.EVENT_ONPRESS_MSG;
                  break;
               case EventEnums.EVENT_ONRELEASE:
                  sEventClass = EventEnums.EVENT_ONRELEASE_MSG;
                  break;
               case EventEnums.EVENT_ONROLLOUT:
                  sEventClass = EventEnums.EVENT_ONROLLOUT_MSG;
                  break;
               case EventEnums.EVENT_ONROLLOVER:
                  sEventClass = EventEnums.EVENT_ONROLLOVER_MSG;
                  break;
               case EventEnums.EVENT_ONRELEASEOUTSIDE:
                  sEventClass = EventEnums.EVENT_ONRELEASEOUTSIDE_MSG;
                  break;
               case EventEnums.EVENT_ONRIGHTCLICK:
                  sEventClass = EventEnums.EVENT_ONRIGHTCLICK_MSG;
                  break;
               case EventEnums.EVENT_ONDOUBLECLICK:
                  sEventClass = EventEnums.EVENT_ONDOUBLECLICK_MSG;
                  break;
               case EventEnums.EVENT_MIDDLECLICK:
                  sEventClass = EventEnums.EVENT_MIDDLECLICK_MSG;
                  break;
               case EventEnums.EVENT_ONCOLORCHANGE:
                  sEventClass = EventEnums.EVENT_ONCOLORCHANGE_MSG;
                  break;
               case EventEnums.EVENT_ONENTITYREADY:
                  sEventClass = EventEnums.EVENT_ONENTITYREADY_MSG;
                  break;
               case EventEnums.EVENT_ONSELECTITEM:
                  sEventClass = EventEnums.EVENT_ONSELECTITEM_MSG;
                  break;
               case EventEnums.EVENT_ONSELECTEMPTYITEM:
                  sEventClass = EventEnums.EVENT_ONSELECTEMPTYITEM_MSG;
                  break;
               case EventEnums.EVENT_ONDROP:
                  sEventClass = EventEnums.EVENT_ONDROP_MSG;
                  break;
               case EventEnums.EVENT_ONCREATETAB:
                  sEventClass = EventEnums.EVENT_ONCREATETAB_MSG;
                  break;
               case EventEnums.EVENT_ONDELETETAB:
                  sEventClass = EventEnums.EVENT_ONDELETETAB_MSG;
                  break;
               case EventEnums.EVENT_ONRENAMETAB:
                  sEventClass = EventEnums.EVENT_ONRENAMETAB_MSG;
                  break;
               case EventEnums.EVENT_ONITEMROLLOVER:
                  sEventClass = EventEnums.EVENT_ONITEMROLLOVER_MSG;
                  break;
               case EventEnums.EVENT_ONITEMROLLOUT:
                  sEventClass = EventEnums.EVENT_ONITEMROLLOUT_MSG;
                  break;
               case EventEnums.EVENT_ONITEMRIGHTCLICK:
                  sEventClass = EventEnums.EVENT_ONITEMRIGHTCLICK_MSG;
                  break;
               case EventEnums.EVENT_ONWHEEL:
                  sEventClass = EventEnums.EVENT_ONWHEEL_MSG;
                  break;
               case EventEnums.EVENT_ONMOUSEUP:
                  sEventClass = EventEnums.EVENT_ONMOUSEUP_MSG;
                  break;
               case EventEnums.EVENT_ONMAPELEMENTROLLOUT:
                  sEventClass = EventEnums.EVENT_ONMAPELEMENTROLLOUT_MSG;
                  break;
               case EventEnums.EVENT_ONMAPELEMENTROLLOVER:
                  sEventClass = EventEnums.EVENT_ONMAPELEMENTROLLOVER_MSG;
                  break;
               case EventEnums.EVENT_ONMAPELEMENTRIGHTCLICK:
                  sEventClass = EventEnums.EVENT_ONMAPELEMENTRIGHTCLICK_MSG;
                  break;
               case EventEnums.EVENT_ONMAPMOVE:
                  sEventClass = EventEnums.EVENT_ONMAPMOVE_MSG;
                  break;
               case EventEnums.EVENT_ONMAPROLLOVER:
                  sEventClass = EventEnums.EVENT_ONMAPROLLOVER_MSG;
                  break;
               case EventEnums.EVENT_ONMAPROLLOUT:
                  sEventClass = EventEnums.EVENT_ONMAPROLLOUT_MSG;
                  break;
               case EventEnums.EVENT_ONCOMPONENTREADY:
                  sEventClass = EventEnums.EVENT_ONCOMPONENTREADY_MSG;
                  break;
               default:
                  possiblilities = [EventEnums.EVENT_ONPRESS,EventEnums.EVENT_ONRELEASE,EventEnums.EVENT_ONROLLOUT,EventEnums.EVENT_ONROLLOVER,EventEnums.EVENT_ONRIGHTCLICK,EventEnums.EVENT_ONRELEASEOUTSIDE,EventEnums.EVENT_ONDOUBLECLICK,EventEnums.EVENT_ONCOLORCHANGE,EventEnums.EVENT_ONENTITYREADY,EventEnums.EVENT_ONSELECTITEM,EventEnums.EVENT_ONSELECTEMPTYITEM,EventEnums.EVENT_ONITEMROLLOVER,EventEnums.EVENT_ONITEMROLLOUT,EventEnums.EVENT_ONDROP,EventEnums.EVENT_ONWHEEL,EventEnums.EVENT_ONMOUSEUP,EventEnums.EVENT_ONMAPELEMENTROLLOUT,EventEnums.EVENT_ONMAPELEMENTROLLOVER,EventEnums.EVENT_ONMAPELEMENTRIGHTCLICK,EventEnums.EVENT_ONCREATETAB,EventEnums.EVENT_ONDELETETAB,EventEnums.EVENT_MIDDLECLICK];
                  this._log.warn("[" + this._sUrl + "] " + xnCurrentNode.nodeName + " is an unknown event name " + this.suggest(xnCurrentNode.nodeName,possiblilities));
            }
            if(sEventClass.length)
            {
               aResult.push(sEventClass);
            }
         }
         return aResult;
      }
      
      private function getStrataNum(sName:String) : uint
      {
         var possiblilities:Array = null;
         if(sName == StrataEnum.STRATA_NAME_LOW)
         {
            return StrataEnum.STRATA_LOW;
         }
         if(sName == StrataEnum.STRATA_NAME_MEDIUM)
         {
            return StrataEnum.STRATA_MEDIUM;
         }
         if(sName == StrataEnum.STRATA_NAME_HIGH)
         {
            return StrataEnum.STRATA_HIGH;
         }
         if(sName == StrataEnum.STRATA_NAME_TOP)
         {
            return StrataEnum.STRATA_TOP;
         }
         if(sName == StrataEnum.STRATA_NAME_TOOLTIP)
         {
            return StrataEnum.STRATA_TOOLTIP;
         }
         possiblilities = [StrataEnum.STRATA_NAME_LOW,StrataEnum.STRATA_NAME_MEDIUM,StrataEnum.STRATA_NAME_HIGH,StrataEnum.STRATA_NAME_TOP,StrataEnum.STRATA_NAME_TOOLTIP];
         this._log.warn("[" + this._sUrl + "] " + sName + " is an unknown strata name " + this.suggest(sName,possiblilities));
         return StrataEnum.STRATA_MEDIUM;
      }
      
      private function suggest(word:String, aPossibilities:Array, max:uint = 5, suggestCount:uint = 3) : String
      {
         var value:Number = NaN;
         var i:int = 0;
         var suggest:* = "";
         var res:Array = new Array();
         for(i = 0; i < aPossibilities.length; )
         {
            value = Levenshtein.distance(word.toUpperCase(),aPossibilities[i].toUpperCase());
            if(value <= max)
            {
               res.push({
                  "dist":value,
                  "word":aPossibilities[i]
               });
            }
            i++;
         }
         if(res.length)
         {
            suggest = " (did you mean ";
            res.sortOn("dist",Array.NUMERIC);
            i = 0;
            while(i < res.length - 1 && i < suggestCount - 1)
            {
               suggest = suggest + ("\"" + res[i].word + "\"" + (i < res.length - 1?", ":""));
               i++;
            }
            if(res[i])
            {
               suggest = suggest + ((!!i?"or ":"") + "\"" + res[i].word);
            }
            suggest = suggest + "\" ?)";
         }
         return suggest;
      }
      
      private function onPreProcessCompleted(event:Event) : void
      {
         this.mainProcess();
      }
      
      private function onXmlLoadComplete(e:ResourceLoadedEvent) : void
      {
         this.processXml(e.resource);
      }
      
      private function onXmlLoadError(e:ResourceErrorEvent) : void
      {
         dispatchEvent(new ParsingErrorEvent(e.uri.toString(),e.errorMsg));
      }
   }
}
