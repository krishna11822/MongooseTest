/* jslint browser: true, nomen: true, plusplus: true */
/* global module, define, global */

/// @file coherent.js
/// @namespace engine

/// Coherent UI JavaScript interface.
/// The `engine` module contains all functions for communication between the UI and the game / application.
(function (factory) {
   if (typeof module === 'object' && module.exports) {
      module.exports = factory(global, global.engine, false);
   }
   if (typeof define === 'function') {
      define(function () {
         return factory(window, window.engine, true);
      });
   } else {
      window.engine = factory(window, window.engine, true);
   }
})(function (global, engine, hasOnLoad) {
   'use strict';


   /**
   * Event emitter
   *
   * @class Emitter
   */
   function Emitter() {
      this.events = {};
   }

   function Handler(code, context) {
      this.code = code;
      this.context = context;
   }

   Emitter.prototype._createClear = function (object, name, handler) {
      return function () {
         var handlers = object.events[name];
         if (handlers) {
            var index = handlers.indexOf(handler);
            if (index != -1) {
               handlers.splice(index, 1);
               if (handlers.length === 0) {
                  delete object.events[name];
               }
            }
         }
      };
   };

   /**
   * Add a handler for an event
   *
   * @method on
   * @param name the event name
   * @param callback function to be called when the event is triggered
   * @param context this binding for executing the handler, defaults to the Emitter
   * @return connection object
   */
   Emitter.prototype.on = function (name, callback, context) {
      var handlers = this.events[name];

      if (handlers === undefined) {
         handlers = this.events[name] = [];
      }

      var handler = new Handler(callback, context || this);
      handlers.push(handler);
      return { clear: this._createClear(this, name, handler) };
   };

   /**
   * Remove a handler from an event
   *
   * @method off
   * @param name the event name
   * @param callback function to be called when the event is triggered
   * @param context this binding for executing the handler, defaults to the Emitter
   * @return connection object
   */
   Emitter.prototype.off = function (name, handler, context) {
      var handlers = this.events[name];

      if (handlers !== undefined) {
         context = context || this;

         var index;
         var length = handlers.length;
         for (index = 0; index < length; ++index) {
            var reg = handlers[index];
            if (reg.code == handler && reg.context == context) {
               break;
            }
         }
         if (index < length) {
            handlers.splice(index, 1);
            if (handlers.length === 0) {
               delete this.events[name];
            }
         }
      }
   };

   /**
   * Remove a handler from an event
   *
   * @method off
   * @param name the event name
   * @param callback function to be called when the event is triggered
   * @param context this binding for executing the handler, defaults to the Emitter
   * @return connection object
   */
   Emitter.prototype.trigger = function (name) {
      var handlers = this.events[name];

      if (handlers !== undefined) {
         var args = Array.prototype.slice.call(arguments, 1);

         handlers.forEach(function (handler) {
            handler.code.apply(handler.context, args);
         });
      }
   };

   Emitter.prototype.merge = function (emitter) {
      var lhs = this.events,
         rhs = emitter.events,
         push = Array.prototype.push,
         events;

      for (var e in rhs) {
         events = lhs[e] = lhs[e] || [];
         push.apply(events, rhs[e]);
      }
   };

   var pending = 'pending';
   var fulfilled = 'fulfilled';
   var broken = 'broken';

   function callAsync(code, context, argument) {
      var async = function () {
         code.call(context, argument);
      };
      setTimeout(async);
   }

   function Promise() {
      this.emitter = new Emitter();
      this.state = pending;
      this.result = null;
   }

   Promise.prototype.resolve = function (result) {
      this.state = fulfilled;
      this.result = result;

      this.emitter.trigger(fulfilled, result);
   };

   Promise.prototype.reject = function (result) {
      this.state = broken;
      this.result = result;

      this.emitter.trigger(broken, result);
   };

   Promise.prototype.success = function (code, context) {
      if (this.state !== fulfilled) {
         this.emitter.on(fulfilled, code, context);
      } else {
         callAsync(code, context || this, this.result);
      }
      return this;
   };

   Promise.prototype.always = function (code, context) {
      this.success(code, context);
      this.otherwise(code, context);
      return this;
   };

   Promise.prototype.otherwise = function (code, context) {
      if (this.state !== broken) {
         this.emitter.on(broken, code, context);
      } else {
         callAsync(code, context || this, this.result);
      }
      return this;
   };

   Promise.prototype.merge = function (other) {
      if (this.state === pending) {
         this.emitter.merge(other.emitter);
      } else {
         var handlers = other.emitter.events[this.state];
         var self = this;
         if (handlers !== undefined) {
            handlers.forEach(function (handler) {
               handler.code.call(handler.context, self.result);
            });
         }
      }
   };

   Promise.prototype.make_chain = function (handler, promise, ok) {
      return function (result) {
         var handlerResult;
         try {
            handlerResult = handler.code.call(handler.context, result);
            if (handlerResult instanceof Promise) {
               handlerResult.merge(promise);
            } else if (this.state === ok) {
               promise.resolve(handlerResult);
            } else {
               promise.reject(handlerResult);
            }
         } catch (error) {
            promise.reject(error);
         }
      };
   };

   function makeDefaultHandler(promise) {
      return function () {
         return promise;
      };
   }

   Promise.prototype.then = function (callback, errback) {
      var promise = new Promise();

      var handler = new Handler(callback || makeDefaultHandler(this), this);

      this.success(this.make_chain(handler, promise, fulfilled), this);

      var errorHandler = new Handler(errback || makeDefaultHandler(this), this);
      this.otherwise(this.make_chain(errorHandler, promise, broken), this);


      return promise;
   };

   var isAttached = engine !== undefined;

   engine = engine || {};

   engine.events = {};
   for (var property in Emitter.prototype) {
      engine[property] = Emitter.prototype[property];
   }

   /// @function engine.on
   /// Register handler for and event
   /// @param {String} name name of the event
   /// @param {Function} callback callback function to be executed when the event has been triggered
   /// @param context *this* context for the function, by default the engine object

   /// @function engine.off
   /// Remove handler for an event
   /// @param {String} name name of the event, by default removes all events
   /// @param {Function} callback the callback function to be removed, by default removes all callbacks for a given event
   /// @param context *this* context for the function, by default all removes all callbacks, regardless of context
   /// @warning Removing all handlers for `engine` will remove some *Coherent UI* internal events, breaking some functionality.

   /// @function engine.trigger
   /// Trigger an event
   /// This function will trigger any C++ handler registered for this event with `Coherent::UI::View::RegisterForEvent`
   /// @param {String} name name of the event
   /// @param ... any extra arguments to be passed to the event handlers

   engine._trigger = Emitter.prototype.trigger;
   var concatArguments = Array.prototype.concat;
   engine.trigger = function (name) {
      this._trigger.apply(this, arguments);
      if (this._eventHandles[name] === undefined && this.IsAttached) {
         this.TriggerEvent.apply(this, arguments);
      }
      if (this.events.all !== undefined) {
         var allArguments = concatArguments.apply(['all'], arguments);
         this._trigger.apply(this, allArguments);
      }
   };

   engine.IsAttached = isAttached;
   engine._BindingsReady = false;
   engine._WindowLoaded = false;
   engine._RequestId = 0;
   engine._ActiveRequests = {};

   if (!engine.IsAttached) {
      engine.SendMessage = function (name, id) {
         var args = Array.prototype.slice.call(arguments, 2);
         var deferred = engine._ActiveRequests[id];

         delete engine._ActiveRequests[id];

         args.push(deferred);

         var call = (function (name, args) {
            return function () {
               var mock = engine['Mock_' + name];

               if (mock !== undefined) {
                  var callMock = function () {
                     mock.apply(engine, args);
                  };
                  window.setTimeout(callMock, 16);
               }
            };
         }(name, args));

         window.setTimeout(call, 16);
      };

      engine.TriggerEvent = function () {
         var args = Array.prototype.slice.call(arguments),
            trigger;

         args[0] = 'Fake_' + args[0];

         trigger = (function (args) {
            return function () {
               engine.trigger.apply(engine, args);
            };
         }(args));

         window.setTimeout(trigger, 16);
      };

      engine.BindingsReady = function () {
         engine._OnReady();
      };

      engine.__observeLifetime = function () {
      };
   }

   /// @function engine.createDeferred
   /// Create a new deferred object.
   /// Use this to create deferred / promises that can be used together with `engine.call`.
   /// @return {Deferred} a new deferred object
   /// @see @ref CustomizingPromises
   engine.createDeferred = (global.engineCreateDeferred === undefined) ?
      function () { return new Promise(); }
      : global.engineCreateDeferred;

   /// @function engine.call
   /// Call asynchronously a C++ handler and retrieve the result
   /// The C++ handler must have been registered with `Coherent::UI::View::BindCall`
   /// @param {String} name name of the C++ handler to be called
   /// @param ... any extra parameters to be passed to the C++ handler
   /// @return {Deferred} deferred object whose promise is resolved with the result of the C++ handler
   engine.call = function () {
      engine._RequestId++;
      var id = engine._RequestId;

      var deferred = engine.createDeferred();
      engine._ActiveRequests[id] = deferred;
      var messageArguments = Array.prototype.slice.call(arguments);
      messageArguments.splice(1, 0, id);

      engine.SendMessage.apply(this, messageArguments);
      return deferred;
   };

   engine._Result = function (requestId) {
      var deferred = engine._ActiveRequests[requestId];
      if (deferred !== undefined) {
         delete engine._ActiveRequests[requestId];

         var resultArguments = Array.prototype.slice.call(arguments);
         resultArguments.shift();
         deferred.resolve.apply(deferred, resultArguments);
      }
   };

   engine._Errors = ['Success', 'ArgumentType', 'NoSuchMethod', 'NoResult'];

   engine._ForEachError = function (errors, callback) {
      var length = errors.length;

      for (var i = 0; i < length; ++i) {
         callback(errors[i].first, errors[i].second);
      }
   };

   engine._MapErrors = function (errors) {
      var length = errors.length;

      for (var i = 0; i < length; ++i) {
         errors[i].first = engine._Errors[errors[i].first];
      }
   };

   engine._TriggerError = function (type, message) {
      engine.trigger('Error', type, message);
   };

   engine._OnError = function (requestId, errors) {
      engine._MapErrors(errors);

      if (requestId === null || requestId === 0) {
         engine._ForEachError(errors, engine._TriggerError);
      }
      else {
         var deferred = engine._ActiveRequests[requestId];

         delete engine._ActiveRequests[requestId];

         deferred.reject(errors);
      }
   };

   engine._eventHandles = {};

   engine._Register = function (eventName) {
      var trigger = (function (name, engine) {
         return function () {
            var eventArguments = [name];
            eventArguments.push.apply(eventArguments, arguments);
            engine.TriggerEvent.apply(this, eventArguments);
         };
      }(eventName, engine));

      engine._eventHandles[eventName] = engine.on(eventName, trigger);
   };

   engine._removeEventThunk = function (name) {
      var handle = engine._eventHandles[name];
      handle.clear();
      delete engine._eventHandles[name];
   };

   engine._Unregister = function (name) {
      if (typeof name === 'string') {
         engine._removeEventThunk(name);
      } else {
         name.forEach(engine._removeEventThunk, engine);
      }
   };

   function createMethodStub(name) {
      var stub = function () {
         var args = Array.prototype.slice.call(arguments);
         args.splice(0, 0, name, this._id);
         return engine.call.apply(engine, args);
      };
      return stub;
   }

   engine._boundTypes = {};

   engine._createInstance = function (args) {
      var type = args[0],
         id = args[1],
         methods = args[2],
         Constructor = engine._boundTypes[type];

      if (Constructor === undefined) {
         Constructor = function (id) {
            this._id = id;
         };
         Constructor.prototype.__Type = type;
         methods.forEach(function (name) {
            Constructor.prototype[name] = createMethodStub(type + '_' + name);
         });
         engine._boundTypes[type] = Constructor;
      }

      var instance = new Constructor(id);
      engine.__observeLifetime(instance);
      return instance;
   };

   engine._OnReady = function () {
      engine._BindingsReady = true;
      if (engine._WindowLoaded) {
         engine.trigger('Ready');
      }
   };

   engine._OnWindowLoaded = function () {
      engine._WindowLoaded = true;
      if (engine._BindingsReady) {
         engine.trigger('Ready');
      }
   };

   if (hasOnLoad) {
      global.onload = (function (originalWindowLoaded) {
         return function () {
            if (originalWindowLoaded) {
               originalWindowLoaded();
            }
            engine._OnWindowLoaded();
         };
      }(global.onload));
   } else {
      engine._WindowLoaded = true;
   }

   engine._coherentGlobalCanvas = document.createElement('canvas');
   engine._coherentGlobalCanvas.id = "coherentGlobalCanvas";
   engine._coherentGlobalCanvas.width = 1;
   engine._coherentGlobalCanvas.height = 1;
   engine._coherentGlobalCanvas.style.zIndex = 0;
   engine._coherentGlobalCanvas.style.position = "absolute";
   engine._coherentGlobalCanvas.style.border = "0px solid";

   engine._coherentLiveImageData = [];
   engine._coherentCreateImageData = function (name, guid) {
      var ctx = engine._coherentGlobalCanvas.getContext("2d");

      var coherentImage = ctx.coherentCreateImageData(guid);
      engine._coherentLiveImageData[name] = coherentImage;
   };
   engine._coherentUpdatedImageData = function (name) {
      engine._coherentLiveImageData[name].coherentUpdate();
      var canvases = document.getElementsByTagName('canvas');
      for (var i = 0; i < canvases.length; ++i) {
         if (!!canvases[i].onEngineImageDataUpdated) {
            canvases[i].onEngineImageDataUpdated(name,
               engine._coherentLiveImageData[name]);
         }
      }
   };

   engine.on("_coherentCreateImageData", engine._coherentCreateImageData);
   engine.on("_coherentUpdatedImageData", engine._coherentUpdatedImageData);

   engine.on('_Result', engine._Result, engine);
   engine.on('_Register', engine._Register, engine);
   engine.on('_Unregister', engine._Unregister, engine);
   engine.on('_OnReady', engine._OnReady, engine);
   engine.on('_OnError', engine._OnError, engine);

   engine.BindingsReady();

   return engine;
});



// UserControl.js - Smart Client version
HostConnector = (function () {
   var _formId, _compName;

   engine.on("setFormId", function (id) { _formId = id; });
   engine.on("setCompName", function (name) { _compName = name; });

   return {
      formId: function () { return _formId || -1; },
      compName: function() { return _compName || ""; }
   };
})();

MG = (function() {
   var origin = (window.location.protocol + "//" + window.location.host),
       userControlListener,
       HostListener,
       isFormReady = false,
       readyHandlers,
       parameters = {};

   engine.on("onMessage", function(message) {
      if (typeof (userControlListener) == "function")
         userControlListener(message);
   });
   engine.on("onEvent", function(eventName) {
      WSForm.fireEvent(eventName);
   });

   window["MG_Internal_onFormReady"] = function() { MG.Internal.onFormReady(); };

   // parse query parameters
   (function() {
      var query = window.location.search.substring(1),
          parms = query.split('&'),
          val = "",
          i, pos, key;

      for (i = 0; i < parms.length; i++) {
         pos = parms[i].indexOf('=');
         if (pos > 0) {
            key = parms[i].substring(0, pos);
            parameters[key] = parms[i].substring(pos + 1);
         }
      }
   })();

   return {

      debug: {
         log: function() {
            var logFn;

            if (window.console && window.console.log)
               logFn = function () { return window.console.log.apply(window.console, arguments); };

            return {
               log: logFn || (function() {})
            }
         }
      },

      Internal: {
         onFormReady: function() {
            var ix, rh, callHandlers;

            isFormReady = true;

            callHandlers = function() {
               if (readyHandlers) {
                  for (ix = 0; ix < readyHandlers.length; ix++) {
                     rh = readyHandlers[ix];
                     rh.fn.apply(rh.scope);
                  }
                  delete readyHandlers;
               }
            }

            if (document.readyState == "complete")
               callHandlers();
            else 
               document.addEventListener("readystatechange", function() {
                  if (document.readyState == "complete")
                     callHandlers();
               });
         }
      },

      Ajax: {
         get: function(path, cb, onError) {
            var req = new XMLHttpRequest(),
                url;

            if (path.indexOf("?") == -1)
               url = origin + "/" + MG.getInstanceId() + path + "?zid=" + new Date().getTime();
            else
               url = origin + "/" + MG.getInstanceId() + path + "&zid=" + new Date().getTime();

            req.onreadystatechange = function() {
               if (req.readyState == 4) {    // complete
                  req.onreadystatechange = null;
                  if (req.status == 200) {   // success
                     if (typeof (cb) == "function")
                        cb(JSON.parse(req.responseText));
                  } else {
                     if (typeof (onError) == "function")
                        onError();
                  }
               }
            };

            req.open("GET", url, true);
            req.send();
         },

         post: function(path, payload, cb, onError) {
            var req = new XMLHttpRequest(),
                url = origin + "/" + MG.getInstanceId() + path;

            req.onreadystatechange = function() {
               if (req.readyState == 4) { // complete
                  req.onreadystatechange = null;
                  if (req.status == 200) { // success
                     if (typeof (cb) == "function")
                        cb(JSON.parse(req.responseText));
                  } else {
                     if (typeof (onError) == "function")
                        onError();
                  }
               }
            };

            req.open("POST", url, true);
            req.send(JSON.stringify(payload));
         }
      },

      UserControl: {
         // registerListener: 2 ways to initiate call to listener from server/winstudio:
         //    1. From form script: PostUserControlMessage method
         //    2. From user control assembly: QueueClientResponse method
         registerListener: function(callback) {
            userControlListener = callback;
         }
      },

      getIsConnected: function() { return HostConnector.formId() != -1; },  // running in browser control in winstudio?

      getOrigin: function() { return origin; },

      getPlatform: function() { return parameters["platform"]; },

      getTheme: function() { return parameters["theme"]; },

      getInstanceId: function() { return parameters["id"]; },

      // options: 
      //    page = portal      * use PortalPage.html
      //           formonly    * (future) use PlainForm.aspx
      //           mobile      * (future) use MobileForm.aspx
      //           full        * (future?) use WSWebForm.aspx
      getWebClientUrl: function(options) { 
         var page = "portal",
             theme = MG.getTheme(),
             url;
 
         try {
            if (options)
               page = (options.page || page);
 
            url = origin + "/" + MG.getInstanceId() + "/webclient/" + page;
 
            if (theme)
               url += "?theme=" + theme;
         } catch ( e ) {
            // alert(e.message);
         }
 
         return url;
      },  

      getConfigName: function() { return parameters["config"]; },

      getSession: function() { return parameters["session"]; },

      /*
      * MG.generateServerEvent function - user control events, routed to server-side assembly
      */
      generateServerEvent: function(payload) {
         var msg = (typeof (payload) == "string") ? payload : JSON.stringify(payload),
             data = {
                componentName: WSForm.UserControl.getName(),
                message: msg
             };

         MG.Ajax.post("/form/" + HostConnector.formId().toString() + "/userctrl", data);
      },

      onReady: function(fn, scope) {
         if (typeof (fn) === "function") {
            if (isFormReady && (document.readyState == "complete"))
               fn.apply(scope || window);
            else {
               readyHandlers = readyHandlers || [];
               readyHandlers.push({
                  fn: fn,
                  scope: scope || window
               });
            }
         }
      }
   }
})();

WSForm = (function() {
   var subscriptions = {};

   return {
      UserControl: {
         getName: function() { return HostConnector.compName(); },

         registerListener: function(cb) { MG.UserControl.registerListener(cb); },

         invoke: function(args) {
            MG.generateServerEvent(args);
         },

         // not yet implemented:
         getStyle: function(cb) {
            MG.Ajax.get("/form/" + HostConnector.formId().toString() + "/getstyle?name=" + HostConnector.compName(), function(result) {
               if (cb && result.success)
                  cb(result.value);
            });
         }
      },

      fireEvent: function(eventName) {
         if (typeof (subscriptions[eventName]) == "function") {
            subscriptions[eventName](eventName);
         }
      },

      getFormId: function() { return HostConnector.formId(); },

      getCompValue: function(name, cb) {
         MG.Ajax.get("/form/" + HostConnector.formId().toString() + "/getcomp?name=" + name, function(result) {
            if (cb && result.success)
               cb(result.value);
         });
      },

      setCompValue: function(name, value, cb) {
         var data = {
            "name": name,
            "value": value
         };

         MG.Ajax.post("/form/" + HostConnector.formId().toString() + "/setcomp", data, function(result) {
            if (cb && result.success)
               cb(result.value);
         });
      },

      getVarValue: function(name, cb) {
         MG.Ajax.get("/form/" + HostConnector.formId().toString() + "/getvar?name=" + name, function(result) {
            if (cb && result.success)
               cb(result.value);
         });
      },

      setVarValue: function(name, value, cb) {
         var data = {
            "name": name,
            "value": value
         };

         MG.Ajax.post("/form/" + HostConnector.formId().toString() + "/setvar", data, function(result) {
            if (cb && result.success)
               cb(result.value);
         });
      },

      getPropValue: function(name, cb) {
         MG.Ajax.get("/form/" + HostConnector.formId().toString() + "/getprop?name=" + name, function(result) {
            if (cb && result.success)
               cb(result.value);
         });
      },

      setPropValue: function(name, value, cb) {
         var data = {
            "name": name,
            "value": value
         };

         MG.Ajax.post("/form/" + HostConnector.formId().toString() + "/setprop", data, function(result) {
            if (cb && result.success)
               cb(result.value);
         });
      },

      invoke: function(method) {
         var parameters = [],
             data, cb;

         for (var i = 1; i < arguments.length; i++) {
            if (typeof (arguments[i]) == "function")
               cb = arguments[i];
            else
               parameters.push(arguments[i]);
         }

         data = {
            "method": method,
            "parameters": parameters
         };

         MG.Ajax.post("/form/" + HostConnector.formId().toString() + "/invoke", data, function(result) {
            if (cb)
               cb(result);
         });
      },

      call: function (method) {
         var data = {
            "method": method.name,
            "parameters": method.parameters
         };

         MG.Ajax.post("/form/" + HostConnector.formId().toString() + "/call", data, function (response) {
            if (response.success) {
               if (method.onCompleted)
                  method.onCompleted.apply(window, [response.result]);
            } else if (method.onError)
               method.onError.apply(method.scope || window, []);
         });
      },

      generate: function(eventName, cb, async) {
         var data = {
            "eventName": eventName,
            "async": false || (async == true)
         };

         MG.Ajax.post("/form/" + HostConnector.formId().toString() + "/generate", data, function(result) {
            if (cb)
               cb(result);
         });
      },

      subscribe: function(eventName, handler, cb) {
         var data = {
            "componentName": WSForm.UserControl.getName(),
            "eventName": eventName
         };

         subscriptions[eventName] = handler;
         MG.Ajax.post("/form/" + HostConnector.formId().toString() + "/subscribe", data, function(result) { if (cb) cb(result); });
      },

      getImageSrc: function(propertyName, row, cb) {
         var src = MG.getOrigin() + "/" + MG.getInstanceId() + "/form/" + HostConnector.formId().toString() + "/getprop?format=image&name=" + propertyName;

         if (row !== undefined)
            src += "&row=" + row.toString();

         if (typeof (cb) == "function")
            cb(src + "&zid=" + new Date().getTime());
      }
   };
})();

WSUserControl = {       // backward compatibility
   generateServerEvent: MG.generateServerEvent,
   registerCallback: MG.UserControl.registerListener,
   onReady: MG.onReady
};
