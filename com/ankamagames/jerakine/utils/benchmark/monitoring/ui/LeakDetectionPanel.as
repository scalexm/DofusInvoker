package com.ankamagames.jerakine.utils.benchmark.monitoring.ui
{
   import com.ankamagames.jerakine.utils.benchmark.monitoring.FpsManagerConst;
   import com.ankamagames.jerakine.utils.benchmark.monitoring.FpsManagerEvent;
   import com.ankamagames.jerakine.utils.benchmark.monitoring.FpsManagerUtils;
   import com.ankamagames.jerakine.utils.benchmark.monitoring.List;
   import com.ankamagames.jerakine.utils.benchmark.monitoring.MonitoredObject;
   import com.ankamagames.jerakine.utils.misc.DescribeTypeCache;
   import flash.display.Sprite;
   import flash.events.TextEvent;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class LeakDetectionPanel extends Sprite
   {
      
      private static const WIDTH:int = FpsManagerConst.BOX_WIDTH;
      
      private static const HEIGHT:int = 300;
       
      
      private var _listDataObject:Dictionary;
      
      private var _dataTf:TextField;
      
      public var dataToDisplay:Vector.<Number>;
      
      public function LeakDetectionPanel()
      {
         super();
         this._listDataObject = new Dictionary();
         this._dataTf = new TextField();
         this._dataTf.multiline = true;
         this._dataTf.thickness = 200;
         this._dataTf.autoSize = "left";
         this._dataTf.addEventListener(TextEvent.LINK,this.linkHandler);
         addChild(this._dataTf);
         this.drawBG();
      }
      
      private function drawBG() : void
      {
         graphics.clear();
         graphics.beginFill(FpsManagerConst.BOX_COLOR,0.7);
         graphics.lineStyle(2,FpsManagerConst.BOX_COLOR);
         graphics.drawRoundRect(0,0,WIDTH,this._dataTf.textHeight + 8,8,8);
         graphics.endFill();
      }
      
      public function watchObject(o:Object, pColor:uint, incrementParents:Boolean = false, objectClassName:String = null) : void
      {
         var list:List = null;
         var firstList:List = null;
         var secondList:List = null;
         var type:XML = null;
         var c:String = null;
         var ex:XML = null;
         var qualifiedClassName:String = getQualifiedClassName(o);
         var objectName:String = !!objectClassName?objectClassName:qualifiedClassName.split("::")[1];
         var mObject:MonitoredObject = this._listDataObject[objectName];
         if(mObject == null)
         {
            if(incrementParents)
            {
               list = new List(objectName);
               firstList = list;
               type = DescribeTypeCache.typeDescription(o);
               for each(ex in type.extendsClass)
               {
                  c = ex.@type.toString().split("::")[1];
                  if(this._listDataObject[c] != null)
                  {
                     firstList.next = this._listDataObject[c].extendsClass;
                     break;
                  }
                  secondList = new List(c);
                  firstList.next = secondList;
                  secondList = firstList;
               }
            }
            mObject = new MonitoredObject(objectName,pColor,list);
            this._listDataObject[objectName] = mObject;
            if(incrementParents && list != null)
            {
               this.updateParents(list,mObject);
            }
         }
         else if(mObject.color == 16777215)
         {
            mObject.color = pColor;
         }
         mObject.addNewValue(o);
      }
      
      private function updateParents(pList:List, o:Object) : void
      {
         var list:List = pList;
         if(list != null)
         {
            do
            {
               if(list.value != null)
               {
                  this.updateParent(list.value.toString(),o,list.next);
               }
            }
            while((list = list.next) != null);
            
         }
      }
      
      private function updateParent(pName:String, pValue:Object, pList:List) : void
      {
         var mObject:MonitoredObject = this._listDataObject[pName];
         if(mObject == null)
         {
            mObject = new MonitoredObject(pName,16777215,pList);
            this._listDataObject[pName] = mObject;
         }
         mObject.addNewValue(pValue);
      }
      
      public function updateData() : void
      {
         var mo:MonitoredObject = null;
         var i:int = 0;
         var str:* = "";
         var moList:Array = new Array();
         for each(mo in this._listDataObject)
         {
            moList.push(mo);
            mo.update();
         }
         moList.sortOn("name");
         for(i = 0; i < moList.length; i++)
         {
            mo = moList[i];
            str = str + ("<font face=\'Verdana\' size=\'15\' color=\'#" + mo.color.toString(16) + "\' >");
            if(mo.selected)
            {
               str = str + "(*) ";
            }
            str = str + ("<a href=\'event:" + mo.name + "\'>[" + mo.name + "]</a> : " + FpsManagerUtils.countKeys(mo.list));
            str = str + "</font>\n";
         }
         this._dataTf.htmlText = str;
         this._dataTf.width = this._dataTf.textWidth + 10;
         this.drawBG();
      }
      
      private function linkHandler(pEvt:TextEvent) : void
      {
         var mo:MonitoredObject = this._listDataObject[pEvt.text];
         if(mo == null)
         {
            return;
         }
         var evt:FpsManagerEvent = new FpsManagerEvent("follow");
         evt.data = mo;
         dispatchEvent(evt);
      }
   }
}
