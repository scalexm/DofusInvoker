package com.ankamagames.berilia.api
{
   import com.ankamagames.berilia.managers.UiModuleManager;
   import com.ankamagames.berilia.types.data.UiModule;
   import com.ankamagames.berilia.utils.errors.ApiError;
   import com.ankamagames.jerakine.logger.Log;
   import com.ankamagames.jerakine.logger.Logger;
   import com.ankamagames.jerakine.utils.misc.DescribeTypeCache;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class ApiBinder
   {
      
      protected static const _log:Logger = Log.getLogger(getQualifiedClassName(ApiBinder));
      
      private static var _apiClass:Dictionary = new Dictionary();
      
      private static var _apiInstance:Dictionary = new Dictionary();
      
      private static var _apiData:Dictionary = new Dictionary();
      
      private static var _apiDataTagsCache:Dictionary = new Dictionary();
      
      private static var _apiConfigurationsCache:Dictionary = new Dictionary();
       
      
      public function ApiBinder()
      {
         super();
      }
      
      public static function addApi(name:String, apiClass:Class) : void
      {
         _apiClass[getQualifiedClassName(apiClass)] = apiClass;
      }
      
      public static function removeApi(apiClass:Class) : void
      {
         _apiClass[getQualifiedClassName(apiClass)] = null;
      }
      
      public static function reset() : void
      {
         _apiInstance = new Dictionary();
         _apiData = new Dictionary();
      }
      
      public static function addApiData(name:String, value:*) : void
      {
         _apiData[name] = value;
      }
      
      public static function getApiData(name:String) : *
      {
         return _apiData[name];
      }
      
      public static function removeApiData(name:String) : void
      {
         _apiData[name] = null;
      }
      
      public static function initApi(target:Object, module:UiModule) : void
      {
         var api:Object = null;
         var configCache:ApiConfigurationCache = null;
         var tuple:Vector.<String> = null;
         var desc:XML = null;
         var cache:ApiConfigurationCache = null;
         var classVariables:XMLList = null;
         var variableDeclaration:XML = null;
         var variableMetaTags:XMLList = null;
         var metaData:XML = null;
         var modName:String = null;
         addApiData("module",module);
         var targetClassName:String = getQualifiedClassName(target);
         if(_apiConfigurationsCache[targetClassName])
         {
            configCache = _apiConfigurationsCache[targetClassName];
            for each(tuple in configCache.apisToBind)
            {
               api = getApiInstance(tuple[1]);
               if(module.apiList.indexOf(api) == -1)
               {
                  module.apiList.push(api);
               }
               target[tuple[0]] = api;
            }
            for each(tuple in configCache.modulesToBind)
            {
               target[tuple[0]] = UiModuleManager.getInstance().getModule(tuple[1]).mainClass;
            }
         }
         else
         {
            desc = DescribeTypeCache.typeDescription(target);
            cache = new ApiConfigurationCache();
            _apiConfigurationsCache[targetClassName] = cache;
            classVariables = desc.child("variable");
            for each(variableDeclaration in classVariables)
            {
               if(_apiClass[variableDeclaration.@type.toString()])
               {
                  api = getApiInstance(variableDeclaration.@type.toString());
                  if(module.apiList.indexOf(api) == -1)
                  {
                     module.apiList.push(api);
                  }
                  target[variableDeclaration.@name] = api;
                  cache.apisToBind.push(new <String>[variableDeclaration.@name,variableDeclaration.@type.toString()]);
               }
               else
               {
                  variableMetaTags = variableDeclaration.child("metadata");
                  for each(metaData in variableMetaTags)
                  {
                     if(metaData.@name == "Module")
                     {
                        if(metaData.arg.@key == "name")
                        {
                           modName = metaData.arg.@value;
                           if(!UiModuleManager.getInstance().getModules()[modName])
                           {
                              throw new ApiError("Module " + modName + " does not exist (in " + module.id + ")");
                           }
                           if(module.trusted || modName == "Ankama_Common" || modName == "Ankama_ContextMenu" || !UiModuleManager.getInstance().getModule(modName).trusted)
                           {
                              target[variableDeclaration.@name] = UiModuleManager.getInstance().getModule(modName).mainClass;
                              cache.modulesToBind.push(new <String>[variableDeclaration.@name,modName]);
                              continue;
                           }
                           throw new ApiError(module.id + ", untrusted module cannot acces to trusted modules " + modName);
                        }
                        throw new ApiError(module.id + " module, unknow property \"" + metaData.arg.@key + "\" in Api tag");
                     }
                  }
               }
            }
         }
      }
      
      private static function getApiInstance(name:String) : Object
      {
         var keyVal:Vector.<String> = null;
         if(_apiInstance[name])
         {
            return _apiInstance[name];
         }
         if(!_apiClass[name])
         {
            _log.error("Api [" + name + "] is not available");
            return null;
         }
         var apiDesc:XML = DescribeTypeCache.typeDescription(_apiClass[name]);
         var descCache:ApiDataTagCache = _apiDataTagsCache[name];
         if(!descCache)
         {
            descCache = new ApiDataTagCache(apiDesc);
            _apiDataTagsCache[name] = descCache;
         }
         var api:Object = new (_apiClass[name] as Class)();
         for each(keyVal in descCache.tags)
         {
            api[keyVal[0]] = _apiData[keyVal[1]];
         }
         if(!descCache.isInstancied)
         {
            _apiInstance[name] = api;
         }
         return api;
      }
   }
}

class ApiConfigurationCache
{
    
   
   public var apisToBind:Vector.<Vector.<String>>;
   
   public var modulesToBind:Vector.<Vector.<String>>;
   
   function ApiConfigurationCache()
   {
      this.apisToBind = new Vector.<Vector.<String>>();
      this.modulesToBind = new Vector.<Vector.<String>>();
      super();
   }
}

class ApiDataTagCache
{
    
   
   public var isInstancied:Boolean = false;
   
   public var tags:Vector.<Vector.<String>>;
   
   function ApiDataTagCache(apiDesc:XML)
   {
      var tag:XML = null;
      var accessorList:XMLList = null;
      var accessor:XML = null;
      var accessorMetadataList:XMLList = null;
      var accessorMetadata:XML = null;
      this.tags = new Vector.<Vector.<String>>();
      super();
      var classMetaData:XMLList = apiDesc.factory.child("metadata");
      for each(tag in classMetaData)
      {
         if(tag.@name == "InstanciedApi")
         {
            this.isInstancied = true;
            break;
         }
      }
      accessorList = apiDesc.factory.child("accessor");
      for each(accessor in accessorList)
      {
         accessorMetadataList = accessor.child("metadata");
         for each(accessorMetadata in accessorMetadataList)
         {
            if(accessorMetadata.@name == "ApiData")
            {
               this.tags.push(new <String>[accessor.@name,accessorMetadata.arg.@value.toString()]);
            }
         }
      }
   }
}
