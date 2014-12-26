#
# Copyright 2014 Red Hat, Inc.
#
# Red Hat licenses this file to you under the Apache License, version 2.0
# (the "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at:
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.
#

require 'java'
java_import io.vertx.codegen.testmodel.TestEnum
java_import io.vertx.codegen.testmodel.TestOptions
java_import java.util.Map
java_import io.vertx.core.json.JsonObject
java_import io.vertx.core.AsyncResult
java_import java.util.Set
java_import io.vertx.core.json.JsonArray
java_import java.util.List
java_import io.vertx.core.Handler
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class TestInterface < SuperInterface1 
include SuperInterface2
  attr_reader :delegate
  def initialize(delegate)
    super(delegate);
    @delegate = delegate
  end
    
  def otherSuperMethodWithBasicParams b, s, i, l, f, d, bool, ch, str
    ((io.vertx.codegen.testmodel.SuperInterface2) this.delegate).otherSuperMethodWithBasicParams(b, s, i, l, f, d, bool, ch, str);
  end
    
  def methodWithBasicParams b, s, i, l, f, d, bool, ch, str
    this.delegate.methodWithBasicParams(b, s, i, l, f, d, bool, ch, str);
  end
    
  def methodWithBasicBoxedParams b, s, i, l, f, d, bool, ch
    this.delegate.methodWithBasicBoxedParams(b, s, i, l, f, d, bool, ch);
  end
    
  def methodWithHandlerBasicTypes byteHandler, shortHandler, intHandler, longHandler, floatHandler, doubleHandler, booleanHandler, charHandler, stringHandler
    this.delegate.methodWithHandlerBasicTypes(byteHandler, shortHandler, intHandler, longHandler, floatHandler, doubleHandler, booleanHandler, charHandler, stringHandler);
  end
    
  def methodWithHandlerAsyncResultByte stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultByte(stoFailure, handler);
  end
    
  def methodWithHandlerAsyncResultShort stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultShort(stoFailure, handler);
  end
    
  def methodWithHandlerAsyncResultInteger stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultInteger(stoFailure, handler);
  end
    
  def methodWithHandlerAsyncResultLong stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultLong(stoFailure, handler);
  end
    
  def methodWithHandlerAsyncResultFloat stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultFloat(stoFailure, handler);
  end
    
  def methodWithHandlerAsyncResultDouble stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultDouble(stoFailure, handler);
  end
    
  def methodWithHandlerAsyncResultBoolean stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultBoolean(stoFailure, handler);
  end
    
  def methodWithHandlerAsyncResultCharacter stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultCharacter(stoFailure, handler);
  end
    
  def methodWithHandlerAsyncResultString stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultString(stoFailure, handler);
  end
    
  def methodWithHandlerAsyncResultOptions stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultOptions(stoFailure, handler);
  end
    
  def methodWithUserTypes refed
    this.delegate.methodWithUserTypes((io.vertx.codegen.testmodel.RefedInterface1)refed.getDelegate());
  end
    
  def methodWithObjectParam str, obj
    this.delegate.methodWithObjectParam(str, InternalHelper.unwrapObject(obj));
  end
    
  def methodWithOptionsParam options = {}
    this.delegate.methodWithOptionsParam(options != null ? new io.vertx.codegen.testmodel.TestOptions(new io.vertx.core.json.JsonObject(options)) : null);
  end
    
  def methodWithNullOptionsParam options = {}
    this.delegate.methodWithNullOptionsParam(options != null ? new io.vertx.codegen.testmodel.TestOptions(new io.vertx.core.json.JsonObject(options)) : null);
  end
    
  def methodWithListParams listString, listByte, listShort, listInt, listLong, listJsonObject, listJsonArray, listVertxGen
    this.delegate.methodWithListParams(listString, listByte, listShort, listInt, listLong, listJsonObject.collect({underpants -> new JsonObject(underpants)}), listJsonArray.collect({underpants -> new JsonArray(underpants)}), (List<io.vertx.codegen.testmodel.RefedInterface1>)(listVertxGen.collect({underpants -> underpants.getDelegate()})));
  end
    
  def methodWithSetParams setString, setByte, setShort, setInt, setLong, setJsonObject, setJsonArray, setVertxGen
    this.delegate.methodWithSetParams(setString, setByte, setShort, setInt, setLong, setJsonObject.collect({underpants -> new JsonObject(underpants)}) as Set, setJsonArray.collect({underpants -> new JsonArray(underpants)}) as Set, (Set<io.vertx.codegen.testmodel.RefedInterface1>)(setVertxGen.collect({underpants -> underpants.getDelegate()}) as Set));
  end
    
  def methodWithMapParams mapString, mapByte, mapShort, mapInt, mapLong, mapJsonObject, mapJsonArray, mapVertxGen
    this.delegate.methodWithMapParams(mapString, mapByte, mapShort, mapInt, mapLong, (Map<String, io.vertx.core.json.JsonObject>)(mapJsonObject.collectEntries({k, v -> [k, new JsonObject(v)]})), (Map<String, io.vertx.core.json.JsonArray>)(mapJsonArray.collectEntries({k, v -> [k, new JsonArray(v)]})), (Map<String, io.vertx.codegen.testmodel.RefedInterface1>)(mapVertxGen.collectEntries({k, v -> [k, v.getDelegate()]})));
  end
    
  def methodWithHandlerListAndSet listStringHandler, listIntHandler, setStringHandler, setIntHandler
    this.delegate.methodWithHandlerListAndSet(listStringHandler, listIntHandler, setStringHandler, setIntHandler);
  end
    
  def methodWithHandlerAsyncResultListString handler
    this.delegate.methodWithHandlerAsyncResultListString(handler);
  end
    
  def methodWithHandlerAsyncResultListInteger handler
    this.delegate.methodWithHandlerAsyncResultListInteger(handler);
  end
    
  def methodWithHandlerAsyncResultSetString handler
    this.delegate.methodWithHandlerAsyncResultSetString(handler);
  end
    
  def methodWithHandlerAsyncResultSetInteger handler
    this.delegate.methodWithHandlerAsyncResultSetInteger(handler);
  end
    
  def methodWithHandlerListVertxGen listHandler
    this.delegate.methodWithHandlerListVertxGen(new Handler<List<io.vertx.codegen.testmodel.RefedInterface1>>() {
      public void handle(List<io.vertx.codegen.testmodel.RefedInterface1> event) {
        listHandler.handle(event.collect({
          RefedInterface1.FACTORY.call(it)
        }) as List)
      }
    });
  end
    
  def methodWithHandlerSetVertxGen listHandler
    this.delegate.methodWithHandlerSetVertxGen(new Handler<Set<io.vertx.codegen.testmodel.RefedInterface1>>() {
      public void handle(Set<io.vertx.codegen.testmodel.RefedInterface1> event) {
        listHandler.handle(event.collect({
          RefedInterface1.FACTORY.call(it)
        }) as Set)
      }
    });
  end
    
  def methodWithHandlerListAbstractVertxGen listHandler
    this.delegate.methodWithHandlerListAbstractVertxGen(new Handler<List<io.vertx.codegen.testmodel.RefedInterface2>>() {
      public void handle(List<io.vertx.codegen.testmodel.RefedInterface2> event) {
        listHandler.handle(event.collect({
          RefedInterface2.FACTORY.call(it)
        }) as List)
      }
    });
  end
    
  def methodWithHandlerSetAbstractVertxGen listHandler
    this.delegate.methodWithHandlerSetAbstractVertxGen(new Handler<Set<io.vertx.codegen.testmodel.RefedInterface2>>() {
      public void handle(Set<io.vertx.codegen.testmodel.RefedInterface2> event) {
        listHandler.handle(event.collect({
          RefedInterface2.FACTORY.call(it)
        }) as Set)
      }
    });
  end
    
  def methodWithHandlerListJsonObject listHandler
    this.delegate.methodWithHandlerListJsonObject(new Handler<List<JsonObject>>() {
      public void handle(List<JsonObject> event) {
        listHandler.handle(event.collect({
          it?.getMap()
        }) as List)
      }
    });
  end
    
  def methodWithHandlerListNullJsonObject listHandler
    this.delegate.methodWithHandlerListNullJsonObject(new Handler<List<JsonObject>>() {
      public void handle(List<JsonObject> event) {
        listHandler.handle(event.collect({
          it?.getMap()
        }) as List)
      }
    });
  end
    
  def methodWithHandlerSetJsonObject listHandler
    this.delegate.methodWithHandlerSetJsonObject(new Handler<Set<JsonObject>>() {
      public void handle(Set<JsonObject> event) {
        listHandler.handle(event.collect({
          it?.getMap()
        }) as Set)
      }
    });
  end
    
  def methodWithHandlerSetNullJsonObject listHandler
    this.delegate.methodWithHandlerSetNullJsonObject(new Handler<Set<JsonObject>>() {
      public void handle(Set<JsonObject> event) {
        listHandler.handle(event.collect({
          it?.getMap()
        }) as Set)
      }
    });
  end
    
  def methodWithHandlerListJsonArray listHandler
    this.delegate.methodWithHandlerListJsonArray(new Handler<List<JsonArray>>() {
      public void handle(List<JsonArray> event) {
        listHandler.handle(event.collect({
          it?.toList()
        }) as List)
      }
    });
  end
    
  def methodWithHandlerListNullJsonArray listHandler
    this.delegate.methodWithHandlerListNullJsonArray(new Handler<List<JsonArray>>() {
      public void handle(List<JsonArray> event) {
        listHandler.handle(event.collect({
          it?.toList()
        }) as List)
      }
    });
  end
    
  def methodWithHandlerSetJsonArray listHandler
    this.delegate.methodWithHandlerSetJsonArray(new Handler<Set<JsonArray>>() {
      public void handle(Set<JsonArray> event) {
        listHandler.handle(event.collect({
          it?.toList()
        }) as Set)
      }
    });
  end
    
  def methodWithHandlerSetNullJsonArray listHandler
    this.delegate.methodWithHandlerSetNullJsonArray(new Handler<Set<JsonArray>>() {
      public void handle(Set<JsonArray> event) {
        listHandler.handle(event.collect({
          it?.toList()
        }) as Set)
      }
    });
  end
    
  def methodWithHandlerAsyncResultListVertxGen listHandler
    this.delegate.methodWithHandlerAsyncResultListVertxGen(new Handler<AsyncResult<List<io.vertx.codegen.testmodel.RefedInterface1>>>() {
      public void handle(AsyncResult<List<io.vertx.codegen.testmodel.RefedInterface1>> event) {
        AsyncResult<List<RefedInterface1>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<RefedInterface1>>result(event.result().collect({
            io.vertx.codegen.testmodel.RefedInterface1 element ->
            RefedInterface1.FACTORY.call(element)
          }) as List)
        } else {
          f = InternalHelper.<List<RefedInterface1>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultSetVertxGen listHandler
    this.delegate.methodWithHandlerAsyncResultSetVertxGen(new Handler<AsyncResult<Set<io.vertx.codegen.testmodel.RefedInterface1>>>() {
      public void handle(AsyncResult<Set<io.vertx.codegen.testmodel.RefedInterface1>> event) {
        AsyncResult<Set<RefedInterface1>> f
        if (event.succeeded()) {
          f = InternalHelper.<Set<RefedInterface1>>result(event.result().collect({
            io.vertx.codegen.testmodel.RefedInterface1 element ->
            RefedInterface1.FACTORY.call(element)
          }) as Set)
        } else {
          f = InternalHelper.<Set<RefedInterface1>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultListAbstractVertxGen listHandler
    this.delegate.methodWithHandlerAsyncResultListAbstractVertxGen(new Handler<AsyncResult<List<io.vertx.codegen.testmodel.RefedInterface2>>>() {
      public void handle(AsyncResult<List<io.vertx.codegen.testmodel.RefedInterface2>> event) {
        AsyncResult<List<RefedInterface2>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<RefedInterface2>>result(event.result().collect({
            io.vertx.codegen.testmodel.RefedInterface2 element ->
            RefedInterface2.FACTORY.call(element)
          }) as List)
        } else {
          f = InternalHelper.<List<RefedInterface2>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultSetAbstractVertxGen listHandler
    this.delegate.methodWithHandlerAsyncResultSetAbstractVertxGen(new Handler<AsyncResult<Set<io.vertx.codegen.testmodel.RefedInterface2>>>() {
      public void handle(AsyncResult<Set<io.vertx.codegen.testmodel.RefedInterface2>> event) {
        AsyncResult<Set<RefedInterface2>> f
        if (event.succeeded()) {
          f = InternalHelper.<Set<RefedInterface2>>result(event.result().collect({
            io.vertx.codegen.testmodel.RefedInterface2 element ->
            RefedInterface2.FACTORY.call(element)
          }) as Set)
        } else {
          f = InternalHelper.<Set<RefedInterface2>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultListJsonObject listHandler
    this.delegate.methodWithHandlerAsyncResultListJsonObject(new Handler<AsyncResult<List<JsonObject>>>() {
      public void handle(AsyncResult<List<JsonObject>> event) {
        AsyncResult<List<Map<String, Object>>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<Map<String, Object>>>result(event.result().collect({
            io.vertx.core.json.JsonObject element ->
            element?.getMap()
          }) as List)
        } else {
          f = InternalHelper.<List<Map<String, Object>>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultListNullJsonObject listHandler
    this.delegate.methodWithHandlerAsyncResultListNullJsonObject(new Handler<AsyncResult<List<JsonObject>>>() {
      public void handle(AsyncResult<List<JsonObject>> event) {
        AsyncResult<List<Map<String, Object>>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<Map<String, Object>>>result(event.result().collect({
            io.vertx.core.json.JsonObject element ->
            element?.getMap()
          }) as List)
        } else {
          f = InternalHelper.<List<Map<String, Object>>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultSetJsonObject listHandler
    this.delegate.methodWithHandlerAsyncResultSetJsonObject(new Handler<AsyncResult<Set<JsonObject>>>() {
      public void handle(AsyncResult<Set<JsonObject>> event) {
        AsyncResult<Set<Map<String, Object>>> f
        if (event.succeeded()) {
          f = InternalHelper.<Set<Map<String, Object>>>result(event.result().collect({
            io.vertx.core.json.JsonObject element ->
            element?.getMap()
          }) as Set)
        } else {
          f = InternalHelper.<Set<Map<String, Object>>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultSetNullJsonObject listHandler
    this.delegate.methodWithHandlerAsyncResultSetNullJsonObject(new Handler<AsyncResult<Set<JsonObject>>>() {
      public void handle(AsyncResult<Set<JsonObject>> event) {
        AsyncResult<Set<Map<String, Object>>> f
        if (event.succeeded()) {
          f = InternalHelper.<Set<Map<String, Object>>>result(event.result().collect({
            io.vertx.core.json.JsonObject element ->
            element?.getMap()
          }) as Set)
        } else {
          f = InternalHelper.<Set<Map<String, Object>>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultListJsonArray listHandler
    this.delegate.methodWithHandlerAsyncResultListJsonArray(new Handler<AsyncResult<List<JsonArray>>>() {
      public void handle(AsyncResult<List<JsonArray>> event) {
        AsyncResult<List<List<Object>>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<List<Object>>>result(event.result().collect({
            io.vertx.core.json.JsonArray element ->
            element?.toList()
          }) as List)
        } else {
          f = InternalHelper.<List<List<Object>>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultListNullJsonArray listHandler
    this.delegate.methodWithHandlerAsyncResultListNullJsonArray(new Handler<AsyncResult<List<JsonArray>>>() {
      public void handle(AsyncResult<List<JsonArray>> event) {
        AsyncResult<List<List<Object>>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<List<Object>>>result(event.result().collect({
            io.vertx.core.json.JsonArray element ->
            element?.toList()
          }) as List)
        } else {
          f = InternalHelper.<List<List<Object>>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultSetJsonArray listHandler
    this.delegate.methodWithHandlerAsyncResultSetJsonArray(new Handler<AsyncResult<Set<JsonArray>>>() {
      public void handle(AsyncResult<Set<JsonArray>> event) {
        AsyncResult<Set<List<Object>>> f
        if (event.succeeded()) {
          f = InternalHelper.<Set<List<Object>>>result(event.result().collect({
            io.vertx.core.json.JsonArray element ->
            element?.toList()
          }) as Set)
        } else {
          f = InternalHelper.<Set<List<Object>>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultSetNullJsonArray listHandler
    this.delegate.methodWithHandlerAsyncResultSetNullJsonArray(new Handler<AsyncResult<Set<JsonArray>>>() {
      public void handle(AsyncResult<Set<JsonArray>> event) {
        AsyncResult<Set<List<Object>>> f
        if (event.succeeded()) {
          f = InternalHelper.<Set<List<Object>>>result(event.result().collect({
            io.vertx.core.json.JsonArray element ->
            element?.toList()
          }) as Set)
        } else {
          f = InternalHelper.<Set<List<Object>>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
    
  def methodWithHandlerUserTypes handler
    this.delegate.methodWithHandlerUserTypes(new Handler<io.vertx.codegen.testmodel.RefedInterface1>() {
      public void handle(io.vertx.codegen.testmodel.RefedInterface1 event) {
        handler.handle(RefedInterface1.FACTORY.call(event));
      }
    });
  end
    
  def methodWithHandlerAsyncResultUserTypes handler
    this.delegate.methodWithHandlerAsyncResultUserTypes(new Handler<AsyncResult<io.vertx.codegen.testmodel.RefedInterface1>>() {
      public void handle(AsyncResult<io.vertx.codegen.testmodel.RefedInterface1> event) {
        AsyncResult<RefedInterface1> f
        if (event.succeeded()) {
          f = InternalHelper.<RefedInterface1>result(new RefedInterface1(event.result()))
        } else {
          f = InternalHelper.<RefedInterface1>failure(event.cause())
        }
        handler.handle(f)
      }
    });
  end
    
  def methodWithHandlerVoid handler
    this.delegate.methodWithHandlerVoid(handler);
  end
    
  def methodWithHandlerAsyncResultVoid stoFailure, handler
    this.delegate.methodWithHandlerAsyncResultVoid(stoFailure, handler);
  end
    
  def methodWithHandlerThrowable handler
    this.delegate.methodWithHandlerThrowable(handler);
  end
    
  def methodWithHandlerOptions handler
    this.delegate.methodWithHandlerOptions(handler);
  end
    
  def methodWithHandlerGenericUserType value, handler
    this.delegate.methodWithHandlerGenericUserType(InternalHelper.unwrapObject(value), new Handler<io.vertx.codegen.testmodel.GenericRefedInterface<java.lang.Object>>() {
      public void handle(io.vertx.codegen.testmodel.GenericRefedInterface<java.lang.Object> event) {
        handler.handle(GenericRefedInterface.FACTORY.call(event));
      }
    });
  end
    
  def methodWithHandlerAsyncResultGenericUserType value, handler
    this.delegate.methodWithHandlerAsyncResultGenericUserType(InternalHelper.unwrapObject(value), new Handler<AsyncResult<io.vertx.codegen.testmodel.GenericRefedInterface<java.lang.Object>>>() {
      public void handle(AsyncResult<io.vertx.codegen.testmodel.GenericRefedInterface<java.lang.Object>> event) {
        AsyncResult<GenericRefedInterface<Object>> f
        if (event.succeeded()) {
          f = InternalHelper.<GenericRefedInterface<Object>>result(new GenericRefedInterface<Object>(event.result()))
        } else {
          f = InternalHelper.<GenericRefedInterface<Object>>failure(event.cause())
        }
        handler.handle(f)
      }
    });
  end
    
  def methodWithByteReturn 
    ret = this.delegate.methodWithByteReturn();
    ret
  end
    
  def methodWithShortReturn 
    ret = this.delegate.methodWithShortReturn();
    ret
  end
    
  def methodWithIntReturn 
    ret = this.delegate.methodWithIntReturn();
    ret
  end
    
  def methodWithLongReturn 
    ret = this.delegate.methodWithLongReturn();
    ret
  end
    
  def methodWithFloatReturn 
    ret = this.delegate.methodWithFloatReturn();
    ret
  end
    
  def methodWithDoubleReturn 
    ret = this.delegate.methodWithDoubleReturn();
    ret
  end
    
  def methodWithBooleanReturn 
    ret = this.delegate.methodWithBooleanReturn();
    ret
  end
    
  def methodWithCharReturn 
    ret = this.delegate.methodWithCharReturn();
    ret
  end
    
  def methodWithStringReturn 
    ret = this.delegate.methodWithStringReturn();
    ret
  end
    
  def methodWithVertxGenReturn 
    ret= RefedInterface1.FACTORY.apply(this.delegate.methodWithVertxGenReturn());
    ret
  end
    
  def methodWithAbstractVertxGenReturn 
    ret= RefedInterface2.FACTORY.apply(this.delegate.methodWithAbstractVertxGenReturn());
    ret
  end
    
  def overloadedMethod str, handler
    ret = this.delegate.overloadedMethod(str, handler);
    ret
  end
    
  def overloadedMethod str, refed
    ret = this.delegate.overloadedMethod(str, (io.vertx.codegen.testmodel.RefedInterface1)refed.getDelegate());
    ret
  end
    
  def overloadedMethod str, refed, handler
    ret = this.delegate.overloadedMethod(str, (io.vertx.codegen.testmodel.RefedInterface1)refed.getDelegate(), handler);
    ret
  end
    
  def overloadedMethod str, refed, period, handler
    ret = this.delegate.overloadedMethod(str, (io.vertx.codegen.testmodel.RefedInterface1)refed.getDelegate(), period, handler);
    ret
  end
    
  def methodWithGenericReturn type
    #This cast is cleary flawed
    ret = (U) InternalHelper.wrapObject(this.delegate.methodWithGenericReturn(type));
    ret
  end
    
  def methodWithGenericParam type, u
    this.delegate.methodWithGenericParam(type, InternalHelper.unwrapObject(u));
  end
    
  def methodWithGenericHandler type, handler
    this.delegate.methodWithGenericHandler(type, new Handler<Object>() {
      public void handle(Object event) {
        handler.handle(InternalHelper.wrapObject(event))
      }
    });
  end
    
  def methodWithGenericHandlerAsyncResult type, asyncResultHandler
    this.delegate.methodWithGenericHandlerAsyncResult(type, new Handler<AsyncResult<Object>>() {
      public void handle(AsyncResult<Object> event) {
        AsyncResult<Object> f
        if (event.succeeded()) {
          f = InternalHelper.<Object>result(InternalHelper.wrapObject(event.result()))
        } else {
          f = InternalHelper.<Object>failure(event.cause())
        }
        asyncResultHandler.handle(f)
      }
    });
  end
    
  def fluentMethod str
    this.delegate.fluentMethod(str);
    return self
  end
    
  def self.staticFactoryMethod foo
    ret= RefedInterface1.FACTORY.apply(io.vertx.codegen.testmodel.TestInterface.staticFactoryMethod(foo));
    ret
  end
    
  def methodWithCachedReturn foo
    if (cached_0 != null) {
      return cached_0;
    }
    ret= RefedInterface1.FACTORY.apply(this.delegate.methodWithCachedReturn(foo));
    cached_0 = ret
    ret
  end
    
  def methodWithJsonObjectReturn 
    ret = this.delegate.methodWithJsonObjectReturn()?.getMap();
    ret
  end
    
  def methodWithNullJsonObjectReturn 
    ret = this.delegate.methodWithNullJsonObjectReturn()?.getMap();
    ret
  end
    
  def methodWithJsonArrayReturn 
    ret = this.delegate.methodWithJsonArrayReturn()?.getList();
    ret
  end
    
  def methodWithNullJsonArrayReturn 
    ret = this.delegate.methodWithNullJsonArrayReturn()?.getList();
    ret
  end
    
  def methodWithJsonParams jsonObject, jsonArray
    this.delegate.methodWithJsonParams(jsonObject != null ? new io.vertx.core.json.JsonObject(jsonObject) : null, jsonArray != null ? new io.vertx.core.json.JsonArray(jsonArray) : null);
  end
    
  def methodWithNullJsonParams jsonObject, jsonArray
    this.delegate.methodWithNullJsonParams(jsonObject != null ? new io.vertx.core.json.JsonObject(jsonObject) : null, jsonArray != null ? new io.vertx.core.json.JsonArray(jsonArray) : null);
  end
    
  def methodWithHandlerJson jsonObjectHandler, jsonArrayHandler
    this.delegate.methodWithHandlerJson(new Handler<JsonObject>() {
      public void handle(JsonObject event) {
        jsonObjectHandler.handle(event?.getMap());
      }
    }, new Handler<JsonArray>() {
      public void handle(JsonArray event) {
        jsonArrayHandler.handle(event?.toList());
      }
    });
  end
    
  def methodWithHandlerNullJson jsonObjectHandler, jsonArrayHandler
    this.delegate.methodWithHandlerNullJson(new Handler<JsonObject>() {
      public void handle(JsonObject event) {
        jsonObjectHandler.handle(event?.getMap());
      }
    }, new Handler<JsonArray>() {
      public void handle(JsonArray event) {
        jsonArrayHandler.handle(event?.toList());
      }
    });
  end
    
  def methodWithHandlerAsyncResultJsonObject handler
    this.delegate.methodWithHandlerAsyncResultJsonObject(new Handler<AsyncResult<io.vertx.core.json.JsonObject>>() {
      public void handle(AsyncResult<io.vertx.core.json.JsonObject> event) {
        AsyncResult<Map<String, Object>> f
        if (event.succeeded()) {
          f = InternalHelper.<Map<String, Object>>result(event.result()?.getMap())
        } else {
          f = InternalHelper.<Map<String, Object>>failure(event.cause())
        }
        handler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultNullJsonObject handler
    this.delegate.methodWithHandlerAsyncResultNullJsonObject(new Handler<AsyncResult<io.vertx.core.json.JsonObject>>() {
      public void handle(AsyncResult<io.vertx.core.json.JsonObject> event) {
        AsyncResult<Map<String, Object>> f
        if (event.succeeded()) {
          f = InternalHelper.<Map<String, Object>>result(event.result()?.getMap())
        } else {
          f = InternalHelper.<Map<String, Object>>failure(event.cause())
        }
        handler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultJsonArray handler
    this.delegate.methodWithHandlerAsyncResultJsonArray(new Handler<AsyncResult<io.vertx.core.json.JsonArray>>() {
      public void handle(AsyncResult<io.vertx.core.json.JsonArray> event) {
        AsyncResult<List<Object>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<Object>>result(event.result()?.toList())
        } else {
          f = InternalHelper.<List<Object>>failure(event.cause())
        }
        handler.handle(f)
      }
    });
  end
    
  def methodWithHandlerAsyncResultNullJsonArray handler
    this.delegate.methodWithHandlerAsyncResultNullJsonArray(new Handler<AsyncResult<io.vertx.core.json.JsonArray>>() {
      public void handle(AsyncResult<io.vertx.core.json.JsonArray> event) {
        AsyncResult<List<Object>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<Object>>result(event.result()?.toList())
        } else {
          f = InternalHelper.<List<Object>>failure(event.cause())
        }
        handler.handle(f)
      }
    });
  end
    
  def methodWithMapReturn handler
    ret = this.delegate.methodWithMapReturn(handler);
    ret
  end
    
  def methodWithMapStringReturn handler
    ret = this.delegate.methodWithMapStringReturn(handler);
    ret
  end
    
  def methodWithMapLongReturn handler
    ret = this.delegate.methodWithMapLongReturn(handler);
    ret
  end
    
  def methodWithMapJsonObjectReturn handler
    ret = this.delegate.methodWithMapJsonObjectReturn(handler)?.collectEntries({k, v -> [k, v.getMap()]});
    ret
  end
    
  def methodWithMapJsonArrayReturn handler
    ret = this.delegate.methodWithMapJsonArrayReturn(handler)?.collectEntries({k, v -> [k, v.getList()]});
    ret
  end
    
  def methodWithNullMapReturn 
    ret = this.delegate.methodWithNullMapReturn();
    ret
  end
    
  def methodWithListStringReturn 
    ret = this.delegate.methodWithListStringReturn();
    ret
  end
    
  def methodWithListLongReturn 
    ret = this.delegate.methodWithListLongReturn();
    ret
  end
    
  def methodWithListVertxGenReturn 
    ret = this.delegate.methodWithListVertxGenReturn()?.collect({underpants -> RefedInterface1.FACTORY.apply(underpants)});
      ret
  end
    
  def methodWithListJsonObjectReturn 
    ret = this.delegate.methodWithListJsonObjectReturn()?.collect({underpants -> underpants.getMap()});
    ret
  end
    
  def methodWithListJsonArrayReturn 
    ret = this.delegate.methodWithListJsonArrayReturn()?.collect({underpants -> underpants.getList()});
    ret
  end
    
  def methodWithNullListReturn 
    ret = this.delegate.methodWithNullListReturn();
    ret
  end
    
  def methodWithSetStringReturn 
    ret = this.delegate.methodWithSetStringReturn();
    ret
  end
    
  def methodWithSetLongReturn 
    ret = this.delegate.methodWithSetLongReturn();
    ret
  end
    
  def methodWithSetVertxGenReturn 
    ret = this.delegate.methodWithSetVertxGenReturn()?.collect({underpants -> RefedInterface1.FACTORY.apply(underpants)}) as Set;
    ret
  end
    
  def methodWithSetJsonObjectReturn 
    ret = this.delegate.methodWithSetJsonObjectReturn()?.collect({underpants -> underpants.getMap()}) as Set;
    ret
  end
    
  def methodWithSetJsonArrayReturn 
    ret = this.delegate.methodWithSetJsonArrayReturn()?.collect({underpants -> underpants.getList()}) as Set;
    ret
  end
    
  def methodWithNullSetReturn 
    ret = this.delegate.methodWithNullSetReturn();
    ret
  end
    
  def methodWithEnumParam strVal, weirdo
    ret = this.delegate.methodWithEnumParam(strVal, weirdo);
    ret
  end
    
  def methodWithEnumReturn strVal
    ret = this.delegate.methodWithEnumReturn(strVal);
    ret
  end
    
  def methodWithThrowableReturn strVal
    ret = this.delegate.methodWithThrowableReturn(strVal);
    ret
  end
  private RefedInterface1 cached_0;

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    TestInterface.new(arg)
  end
end
