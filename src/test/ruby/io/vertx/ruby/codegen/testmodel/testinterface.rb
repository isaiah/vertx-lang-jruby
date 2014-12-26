/*
 * Copyright 2014 Red Hat, Inc.
 *
 * Red Hat licenses this file to you under the Apache License, version 2.0
 * (the "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

package io.vertx.groovy.codegen.testmodel;
import groovy.transform.CompileStatic
import io.vertx.lang.groovy.InternalHelper
import io.vertx.codegen.testmodel.TestEnum
import io.vertx.codegen.testmodel.TestOptions
import java.util.Map
import io.vertx.core.json.JsonObject
import io.vertx.core.AsyncResult
import java.util.Set
import io.vertx.core.json.JsonArray
import java.util.List
import io.vertx.core.Handler
/**
 * @author <a href="http://tfox.org">Tim Fox</a>
 */
class class TestInterface < SuperInterface1 implements SuperInterface2
  final def io.vertx.codegen.testmodel.TestInterface delegate;
  public TestInterface(io.vertx.codegen.testmodel.TestInterface delegate) {
    super(delegate);
    this.delegate = delegate;
  }
  public Object getDelegate() {
    return delegate;
  }
  def otherSuperMethodWithBasicParams(byte b, short s, int i, long l, float f, double d, boolean bool, char ch, String str)
    ((io.vertx.codegen.testmodel.SuperInterface2) this.delegate).otherSuperMethodWithBasicParams(b, s, i, l, f, d, bool, ch, str);
  end
  def methodWithBasicParams(byte b, short s, int i, long l, float f, double d, boolean bool, char ch, String str)
    this.delegate.methodWithBasicParams(b, s, i, l, f, d, bool, ch, str);
  end
  def methodWithBasicBoxedParams(Byte b, Short s, Integer i, Long l, Float f, Double d, Boolean bool, Character ch)
    this.delegate.methodWithBasicBoxedParams(b, s, i, l, f, d, bool, ch);
  end
  def methodWithHandlerBasicTypes(Handler<Byte> byteHandler, Handler<Short> shortHandler, Handler<Integer> intHandler, Handler<Long> longHandler, Handler<Float> floatHandler, Handler<Double> doubleHandler, Handler<Boolean> booleanHandler, Handler<Character> charHandler, Handler<String> stringHandler)
    this.delegate.methodWithHandlerBasicTypes(byteHandler, shortHandler, intHandler, longHandler, floatHandler, doubleHandler, booleanHandler, charHandler, stringHandler);
  end
  def methodWithHandlerAsyncResultByte(boolean sendFailure, Handler<AsyncResult<Byte>> handler)
    this.delegate.methodWithHandlerAsyncResultByte(sendFailure, handler);
  end
  def methodWithHandlerAsyncResultShort(boolean sendFailure, Handler<AsyncResult<Short>> handler)
    this.delegate.methodWithHandlerAsyncResultShort(sendFailure, handler);
  end
  def methodWithHandlerAsyncResultInteger(boolean sendFailure, Handler<AsyncResult<Integer>> handler)
    this.delegate.methodWithHandlerAsyncResultInteger(sendFailure, handler);
  end
  def methodWithHandlerAsyncResultLong(boolean sendFailure, Handler<AsyncResult<Long>> handler)
    this.delegate.methodWithHandlerAsyncResultLong(sendFailure, handler);
  end
  def methodWithHandlerAsyncResultFloat(boolean sendFailure, Handler<AsyncResult<Float>> handler)
    this.delegate.methodWithHandlerAsyncResultFloat(sendFailure, handler);
  end
  def methodWithHandlerAsyncResultDouble(boolean sendFailure, Handler<AsyncResult<Double>> handler)
    this.delegate.methodWithHandlerAsyncResultDouble(sendFailure, handler);
  end
  def methodWithHandlerAsyncResultBoolean(boolean sendFailure, Handler<AsyncResult<Boolean>> handler)
    this.delegate.methodWithHandlerAsyncResultBoolean(sendFailure, handler);
  end
  def methodWithHandlerAsyncResultCharacter(boolean sendFailure, Handler<AsyncResult<Character>> handler)
    this.delegate.methodWithHandlerAsyncResultCharacter(sendFailure, handler);
  end
  def methodWithHandlerAsyncResultString(boolean sendFailure, Handler<AsyncResult<String>> handler)
    this.delegate.methodWithHandlerAsyncResultString(sendFailure, handler);
  end
  def methodWithHandlerAsyncResultOptions(boolean sendFailure, Handler<AsyncResult<TestOptions>> handler)
    this.delegate.methodWithHandlerAsyncResultOptions(sendFailure, handler);
  end
  def methodWithUserTypes(RefedInterface1 refed)
    this.delegate.methodWithUserTypes((io.vertx.codegen.testmodel.RefedInterface1)refed.getDelegate());
  end
  def methodWithObjectParam(String str, Object obj)
    this.delegate.methodWithObjectParam(str, InternalHelper.unwrapObject(obj));
  end
  def methodWithOptionsParam(Map<String, Object> options = [:])
    this.delegate.methodWithOptionsParam(options != null ? new io.vertx.codegen.testmodel.TestOptions(new io.vertx.core.json.JsonObject(options)) : null);
  end
  def methodWithNullOptionsParam(Map<String, Object> options = [:])
    this.delegate.methodWithNullOptionsParam(options != null ? new io.vertx.codegen.testmodel.TestOptions(new io.vertx.core.json.JsonObject(options)) : null);
  end
  def methodWithListParams(List<String> listString, List<Byte> listByte, List<Short> listShort, List<Integer> listInt, List<Long> listLong, List<Map<String, Object>> listJsonObject, List<List<Object>> listJsonArray, List<RefedInterface1> listVertxGen)
    this.delegate.methodWithListParams(listString, listByte, listShort, listInt, listLong, listJsonObject.collect({underpants -> new JsonObject(underpants)}), listJsonArray.collect({underpants -> new JsonArray(underpants)}), (List<io.vertx.codegen.testmodel.RefedInterface1>)(listVertxGen.collect({underpants -> underpants.getDelegate()})));
  end
  def methodWithSetParams(Set<String> setString, Set<Byte> setByte, Set<Short> setShort, Set<Integer> setInt, Set<Long> setLong, Set<Map<String, Object>> setJsonObject, Set<List<Object>> setJsonArray, Set<RefedInterface1> setVertxGen)
    this.delegate.methodWithSetParams(setString, setByte, setShort, setInt, setLong, setJsonObject.collect({underpants -> new JsonObject(underpants)}) as Set, setJsonArray.collect({underpants -> new JsonArray(underpants)}) as Set, (Set<io.vertx.codegen.testmodel.RefedInterface1>)(setVertxGen.collect({underpants -> underpants.getDelegate()}) as Set));
  end
  def methodWithMapParams(Map<String,String> mapString, Map<String,Byte> mapByte, Map<String,Short> mapShort, Map<String,Integer> mapInt, Map<String,Long> mapLong, Map<String, Map<String, Object>> mapJsonObject, Map<String, List<Object>> mapJsonArray, Map<String,RefedInterface1> mapVertxGen)
    this.delegate.methodWithMapParams(mapString, mapByte, mapShort, mapInt, mapLong, (Map<String, io.vertx.core.json.JsonObject>)(mapJsonObject.collectEntries({k, v -> [k, new JsonObject(v)]})), (Map<String, io.vertx.core.json.JsonArray>)(mapJsonArray.collectEntries({k, v -> [k, new JsonArray(v)]})), (Map<String, io.vertx.codegen.testmodel.RefedInterface1>)(mapVertxGen.collectEntries({k, v -> [k, v.getDelegate()]})));
  end
  def methodWithHandlerListAndSet(Handler<List<String>> listStringHandler, Handler<List<Integer>> listIntHandler, Handler<Set<String>> setStringHandler, Handler<Set<Integer>> setIntHandler)
    this.delegate.methodWithHandlerListAndSet(listStringHandler, listIntHandler, setStringHandler, setIntHandler);
  end
  def methodWithHandlerAsyncResultListString(Handler<AsyncResult<List<String>>> handler)
    this.delegate.methodWithHandlerAsyncResultListString(handler);
  end
  def methodWithHandlerAsyncResultListInteger(Handler<AsyncResult<List<Integer>>> handler)
    this.delegate.methodWithHandlerAsyncResultListInteger(handler);
  end
  def methodWithHandlerAsyncResultSetString(Handler<AsyncResult<Set<String>>> handler)
    this.delegate.methodWithHandlerAsyncResultSetString(handler);
  end
  def methodWithHandlerAsyncResultSetInteger(Handler<AsyncResult<Set<Integer>>> handler)
    this.delegate.methodWithHandlerAsyncResultSetInteger(handler);
  end
  def methodWithHandlerListVertxGen(Handler<List<RefedInterface1>> listHandler)
    this.delegate.methodWithHandlerListVertxGen(new Handler<List<io.vertx.codegen.testmodel.RefedInterface1>>() {
      public void handle(List<io.vertx.codegen.testmodel.RefedInterface1> event) {
        listHandler.handle(event.collect({
          RefedInterface1.FACTORY.apply(it)
        }) as List)
      }
    });
  end
  def methodWithHandlerSetVertxGen(Handler<Set<RefedInterface1>> listHandler)
    this.delegate.methodWithHandlerSetVertxGen(new Handler<Set<io.vertx.codegen.testmodel.RefedInterface1>>() {
      public void handle(Set<io.vertx.codegen.testmodel.RefedInterface1> event) {
        listHandler.handle(event.collect({
          RefedInterface1.FACTORY.apply(it)
        }) as Set)
      }
    });
  end
  def methodWithHandlerListAbstractVertxGen(Handler<List<RefedInterface2>> listHandler)
    this.delegate.methodWithHandlerListAbstractVertxGen(new Handler<List<io.vertx.codegen.testmodel.RefedInterface2>>() {
      public void handle(List<io.vertx.codegen.testmodel.RefedInterface2> event) {
        listHandler.handle(event.collect({
          RefedInterface2.FACTORY.apply(it)
        }) as List)
      }
    });
  end
  def methodWithHandlerSetAbstractVertxGen(Handler<Set<RefedInterface2>> listHandler)
    this.delegate.methodWithHandlerSetAbstractVertxGen(new Handler<Set<io.vertx.codegen.testmodel.RefedInterface2>>() {
      public void handle(Set<io.vertx.codegen.testmodel.RefedInterface2> event) {
        listHandler.handle(event.collect({
          RefedInterface2.FACTORY.apply(it)
        }) as Set)
      }
    });
  end
  def methodWithHandlerListJsonObject(Handler<List<Map<String, Object>>> listHandler)
    this.delegate.methodWithHandlerListJsonObject(new Handler<List<JsonObject>>() {
      public void handle(List<JsonObject> event) {
        listHandler.handle(event.collect({
          it?.getMap()
        }) as List)
      }
    });
  end
  def methodWithHandlerListNullJsonObject(Handler<List<Map<String, Object>>> listHandler)
    this.delegate.methodWithHandlerListNullJsonObject(new Handler<List<JsonObject>>() {
      public void handle(List<JsonObject> event) {
        listHandler.handle(event.collect({
          it?.getMap()
        }) as List)
      }
    });
  end
  def methodWithHandlerSetJsonObject(Handler<Set<Map<String, Object>>> listHandler)
    this.delegate.methodWithHandlerSetJsonObject(new Handler<Set<JsonObject>>() {
      public void handle(Set<JsonObject> event) {
        listHandler.handle(event.collect({
          it?.getMap()
        }) as Set)
      }
    });
  end
  def methodWithHandlerSetNullJsonObject(Handler<Set<Map<String, Object>>> listHandler)
    this.delegate.methodWithHandlerSetNullJsonObject(new Handler<Set<JsonObject>>() {
      public void handle(Set<JsonObject> event) {
        listHandler.handle(event.collect({
          it?.getMap()
        }) as Set)
      }
    });
  end
  def methodWithHandlerListJsonArray(Handler<List<List<Object>>> listHandler)
    this.delegate.methodWithHandlerListJsonArray(new Handler<List<JsonArray>>() {
      public void handle(List<JsonArray> event) {
        listHandler.handle(event.collect({
          it?.toList()
        }) as List)
      }
    });
  end
  def methodWithHandlerListNullJsonArray(Handler<List<List<Object>>> listHandler)
    this.delegate.methodWithHandlerListNullJsonArray(new Handler<List<JsonArray>>() {
      public void handle(List<JsonArray> event) {
        listHandler.handle(event.collect({
          it?.toList()
        }) as List)
      }
    });
  end
  def methodWithHandlerSetJsonArray(Handler<Set<List<Object>>> listHandler)
    this.delegate.methodWithHandlerSetJsonArray(new Handler<Set<JsonArray>>() {
      public void handle(Set<JsonArray> event) {
        listHandler.handle(event.collect({
          it?.toList()
        }) as Set)
      }
    });
  end
  def methodWithHandlerSetNullJsonArray(Handler<Set<List<Object>>> listHandler)
    this.delegate.methodWithHandlerSetNullJsonArray(new Handler<Set<JsonArray>>() {
      public void handle(Set<JsonArray> event) {
        listHandler.handle(event.collect({
          it?.toList()
        }) as Set)
      }
    });
  end
  def methodWithHandlerAsyncResultListVertxGen(Handler<AsyncResult<List<RefedInterface1>>> listHandler)
    this.delegate.methodWithHandlerAsyncResultListVertxGen(new Handler<AsyncResult<List<io.vertx.codegen.testmodel.RefedInterface1>>>() {
      public void handle(AsyncResult<List<io.vertx.codegen.testmodel.RefedInterface1>> event) {
        AsyncResult<List<RefedInterface1>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<RefedInterface1>>result(event.result().collect({
            io.vertx.codegen.testmodel.RefedInterface1 element ->
            RefedInterface1.FACTORY.apply(element)
          }) as List)
        } else {
          f = InternalHelper.<List<RefedInterface1>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
  def methodWithHandlerAsyncResultSetVertxGen(Handler<AsyncResult<Set<RefedInterface1>>> listHandler)
    this.delegate.methodWithHandlerAsyncResultSetVertxGen(new Handler<AsyncResult<Set<io.vertx.codegen.testmodel.RefedInterface1>>>() {
      public void handle(AsyncResult<Set<io.vertx.codegen.testmodel.RefedInterface1>> event) {
        AsyncResult<Set<RefedInterface1>> f
        if (event.succeeded()) {
          f = InternalHelper.<Set<RefedInterface1>>result(event.result().collect({
            io.vertx.codegen.testmodel.RefedInterface1 element ->
            RefedInterface1.FACTORY.apply(element)
          }) as Set)
        } else {
          f = InternalHelper.<Set<RefedInterface1>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
  def methodWithHandlerAsyncResultListAbstractVertxGen(Handler<AsyncResult<List<RefedInterface2>>> listHandler)
    this.delegate.methodWithHandlerAsyncResultListAbstractVertxGen(new Handler<AsyncResult<List<io.vertx.codegen.testmodel.RefedInterface2>>>() {
      public void handle(AsyncResult<List<io.vertx.codegen.testmodel.RefedInterface2>> event) {
        AsyncResult<List<RefedInterface2>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<RefedInterface2>>result(event.result().collect({
            io.vertx.codegen.testmodel.RefedInterface2 element ->
            RefedInterface2.FACTORY.apply(element)
          }) as List)
        } else {
          f = InternalHelper.<List<RefedInterface2>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
  def methodWithHandlerAsyncResultSetAbstractVertxGen(Handler<AsyncResult<Set<RefedInterface2>>> listHandler)
    this.delegate.methodWithHandlerAsyncResultSetAbstractVertxGen(new Handler<AsyncResult<Set<io.vertx.codegen.testmodel.RefedInterface2>>>() {
      public void handle(AsyncResult<Set<io.vertx.codegen.testmodel.RefedInterface2>> event) {
        AsyncResult<Set<RefedInterface2>> f
        if (event.succeeded()) {
          f = InternalHelper.<Set<RefedInterface2>>result(event.result().collect({
            io.vertx.codegen.testmodel.RefedInterface2 element ->
            RefedInterface2.FACTORY.apply(element)
          }) as Set)
        } else {
          f = InternalHelper.<Set<RefedInterface2>>failure(event.cause())
        }
        listHandler.handle(f)
      }
    });
  end
  def methodWithHandlerAsyncResultListJsonObject(Handler<AsyncResult<List<Map<String, Object>>>> listHandler)
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
  def methodWithHandlerAsyncResultListNullJsonObject(Handler<AsyncResult<List<Map<String, Object>>>> listHandler)
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
  def methodWithHandlerAsyncResultSetJsonObject(Handler<AsyncResult<Set<Map<String, Object>>>> listHandler)
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
  def methodWithHandlerAsyncResultSetNullJsonObject(Handler<AsyncResult<Set<Map<String, Object>>>> listHandler)
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
  def methodWithHandlerAsyncResultListJsonArray(Handler<AsyncResult<List<List<Object>>>> listHandler)
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
  def methodWithHandlerAsyncResultListNullJsonArray(Handler<AsyncResult<List<List<Object>>>> listHandler)
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
  def methodWithHandlerAsyncResultSetJsonArray(Handler<AsyncResult<Set<List<Object>>>> listHandler)
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
  def methodWithHandlerAsyncResultSetNullJsonArray(Handler<AsyncResult<Set<List<Object>>>> listHandler)
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
  def methodWithHandlerUserTypes(Handler<RefedInterface1> handler)
    this.delegate.methodWithHandlerUserTypes(new Handler<io.vertx.codegen.testmodel.RefedInterface1>() {
      public void handle(io.vertx.codegen.testmodel.RefedInterface1 event) {
        handler.handle(RefedInterface1.FACTORY.apply(event));
      }
    });
  end
  def methodWithHandlerAsyncResultUserTypes(Handler<AsyncResult<RefedInterface1>> handler)
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
  def methodWithHandlerVoid(Handler<Void> handler)
    this.delegate.methodWithHandlerVoid(handler);
  end
  def methodWithHandlerAsyncResultVoid(boolean sendFailure, Handler<AsyncResult<Void>> handler)
    this.delegate.methodWithHandlerAsyncResultVoid(sendFailure, handler);
  end
  def methodWithHandlerThrowable(Handler<Throwable> handler)
    this.delegate.methodWithHandlerThrowable(handler);
  end
  def methodWithHandlerOptions(Handler<TestOptions> handler)
    this.delegate.methodWithHandlerOptions(handler);
  end
  def methodWithHandlerGenericUserType(U value, Handler<GenericRefedInterface<U>> handler)
    this.delegate.methodWithHandlerGenericUserType(InternalHelper.unwrapObject(value), new Handler<io.vertx.codegen.testmodel.GenericRefedInterface<java.lang.Object>>() {
      public void handle(io.vertx.codegen.testmodel.GenericRefedInterface<java.lang.Object> event) {
        handler.handle(GenericRefedInterface.FACTORY.apply(event));
      }
    });
  end
  def methodWithHandlerAsyncResultGenericUserType(U value, Handler<AsyncResult<GenericRefedInterface<U>>> handler)
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
  def methodWithByteReturn()
    def ret = this.delegate.methodWithByteReturn();
    ret
  end
  def methodWithShortReturn()
    def ret = this.delegate.methodWithShortReturn();
    ret
  end
  def methodWithIntReturn()
    def ret = this.delegate.methodWithIntReturn();
    ret
  end
  def methodWithLongReturn()
    def ret = this.delegate.methodWithLongReturn();
    ret
  end
  def methodWithFloatReturn()
    def ret = this.delegate.methodWithFloatReturn();
    ret
  end
  def methodWithDoubleReturn()
    def ret = this.delegate.methodWithDoubleReturn();
    ret
  end
  def methodWithBooleanReturn()
    def ret = this.delegate.methodWithBooleanReturn();
    ret
  end
  def methodWithCharReturn()
    def ret = this.delegate.methodWithCharReturn();
    ret
  end
  def methodWithStringReturn()
    def ret = this.delegate.methodWithStringReturn();
    ret
  end
  def methodWithVertxGenReturn()
    def ret= RefedInterface1.FACTORY.apply(this.delegate.methodWithVertxGenReturn());
    ret
  end
  def methodWithAbstractVertxGenReturn()
    def ret= RefedInterface2.FACTORY.apply(this.delegate.methodWithAbstractVertxGenReturn());
    ret
  end
  def overloadedMethod(String str, Handler<String> handler)
    def ret = this.delegate.overloadedMethod(str, handler);
    ret
  end
  def overloadedMethod(String str, RefedInterface1 refed)
    def ret = this.delegate.overloadedMethod(str, (io.vertx.codegen.testmodel.RefedInterface1)refed.getDelegate());
    ret
  end
  def overloadedMethod(String str, RefedInterface1 refed, Handler<String> handler)
    def ret = this.delegate.overloadedMethod(str, (io.vertx.codegen.testmodel.RefedInterface1)refed.getDelegate(), handler);
    ret
  end
  def overloadedMethod(String str, RefedInterface1 refed, long period, Handler<String> handler)
    def ret = this.delegate.overloadedMethod(str, (io.vertx.codegen.testmodel.RefedInterface1)refed.getDelegate(), period, handler);
    ret
  end
  def methodWithGenericReturn(String type)
    // This cast is cleary flawed
    def ret = (U) InternalHelper.wrapObject(this.delegate.methodWithGenericReturn(type));
    ret
  end
  def methodWithGenericParam(String type, U u)
    this.delegate.methodWithGenericParam(type, InternalHelper.unwrapObject(u));
  end
  def methodWithGenericHandler(String type, Handler<U> handler)
    this.delegate.methodWithGenericHandler(type, new Handler<Object>() {
      public void handle(Object event) {
        handler.handle(InternalHelper.wrapObject(event))
      }
    });
  end
  def methodWithGenericHandlerAsyncResult(String type, Handler<AsyncResult<U>> asyncResultHandler)
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
  def fluentMethod(String str)
    this.delegate.fluentMethod(str);
    return self
  end
  def self.staticFactoryMethod(String foo)
    def ret= RefedInterface1.FACTORY.apply(io.vertx.codegen.testmodel.TestInterface.staticFactoryMethod(foo));
    ret
  end
  def methodWithCachedReturn(String foo)
    if (cached_0 != null) {
      return cached_0;
    }
    def ret= RefedInterface1.FACTORY.apply(this.delegate.methodWithCachedReturn(foo));
    cached_0 = ret
    ret
  end
  def methodWithJsonObjectReturn()
    def ret = this.delegate.methodWithJsonObjectReturn()?.getMap();
    ret
  end
  def methodWithNullJsonObjectReturn()
    def ret = this.delegate.methodWithNullJsonObjectReturn()?.getMap();
    ret
  end
  def methodWithJsonArrayReturn()
    def ret = this.delegate.methodWithJsonArrayReturn()?.getList();
    ret
  end
  def methodWithNullJsonArrayReturn()
    def ret = this.delegate.methodWithNullJsonArrayReturn()?.getList();
    ret
  end
  def methodWithJsonParams(Map<String, Object> jsonObject, List<Object> jsonArray)
    this.delegate.methodWithJsonParams(jsonObject != null ? new io.vertx.core.json.JsonObject(jsonObject) : null, jsonArray != null ? new io.vertx.core.json.JsonArray(jsonArray) : null);
  end
  def methodWithNullJsonParams(Map<String, Object> jsonObject, List<Object> jsonArray)
    this.delegate.methodWithNullJsonParams(jsonObject != null ? new io.vertx.core.json.JsonObject(jsonObject) : null, jsonArray != null ? new io.vertx.core.json.JsonArray(jsonArray) : null);
  end
  def methodWithHandlerJson(Handler<Map<String, Object>> jsonObjectHandler, Handler<List<Object>> jsonArrayHandler)
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
  def methodWithHandlerNullJson(Handler<Map<String, Object>> jsonObjectHandler, Handler<List<Object>> jsonArrayHandler)
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
  def methodWithHandlerAsyncResultJsonObject(Handler<AsyncResult<Map<String, Object>>> handler)
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
  def methodWithHandlerAsyncResultNullJsonObject(Handler<AsyncResult<Map<String, Object>>> handler)
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
  def methodWithHandlerAsyncResultJsonArray(Handler<AsyncResult<List<Object>>> handler)
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
  def methodWithHandlerAsyncResultNullJsonArray(Handler<AsyncResult<List<Object>>> handler)
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
  def methodWithMapReturn(Handler<String> handler)
    def ret = this.delegate.methodWithMapReturn(handler);
    ret
  end
  def methodWithMapStringReturn(Handler<String> handler)
    def ret = this.delegate.methodWithMapStringReturn(handler);
    ret
  end
  def methodWithMapLongReturn(Handler<String> handler)
    def ret = this.delegate.methodWithMapLongReturn(handler);
    ret
  end
  def methodWithMapJsonObjectReturn(Handler<String> handler)
    def ret = this.delegate.methodWithMapJsonObjectReturn(handler)?.collectEntries({k, v -> [k, v.getMap()]});
    ret
  end
  def methodWithMapJsonArrayReturn(Handler<String> handler)
    def ret = this.delegate.methodWithMapJsonArrayReturn(handler)?.collectEntries({k, v -> [k, v.getList()]});
    ret
  end
  def methodWithNullMapReturn()
    def ret = this.delegate.methodWithNullMapReturn();
    ret
  end
  def methodWithListStringReturn()
    def ret = this.delegate.methodWithListStringReturn();
    ret
  end
  def methodWithListLongReturn()
    def ret = this.delegate.methodWithListLongReturn();
    ret
  end
  def methodWithListVertxGenReturn()
    def ret = this.delegate.methodWithListVertxGenReturn()?.collect({underpants -> RefedInterface1.FACTORY.apply(underpants)});
      ret
  end
  def methodWithListJsonObjectReturn()
    def ret = this.delegate.methodWithListJsonObjectReturn()?.collect({underpants -> underpants.getMap()});
    ret
  end
  def methodWithListJsonArrayReturn()
    def ret = this.delegate.methodWithListJsonArrayReturn()?.collect({underpants -> underpants.getList()});
    ret
  end
  def methodWithNullListReturn()
    def ret = this.delegate.methodWithNullListReturn();
    ret
  end
  def methodWithSetStringReturn()
    def ret = this.delegate.methodWithSetStringReturn();
    ret
  end
  def methodWithSetLongReturn()
    def ret = this.delegate.methodWithSetLongReturn();
    ret
  end
  def methodWithSetVertxGenReturn()
    def ret = this.delegate.methodWithSetVertxGenReturn()?.collect({underpants -> RefedInterface1.FACTORY.apply(underpants)}) as Set;
    ret
  end
  def methodWithSetJsonObjectReturn()
    def ret = this.delegate.methodWithSetJsonObjectReturn()?.collect({underpants -> underpants.getMap()}) as Set;
    ret
  end
  def methodWithSetJsonArrayReturn()
    def ret = this.delegate.methodWithSetJsonArrayReturn()?.collect({underpants -> underpants.getList()}) as Set;
    ret
  end
  def methodWithNullSetReturn()
    def ret = this.delegate.methodWithNullSetReturn();
    ret
  end
  def methodWithEnumParam(String strVal, TestEnum weirdo)
    def ret = this.delegate.methodWithEnumParam(strVal, weirdo);
    ret
  end
  def methodWithEnumReturn(String strVal)
    def ret = this.delegate.methodWithEnumReturn(strVal);
    ret
  end
  def methodWithThrowableReturn(String strVal)
    def ret = this.delegate.methodWithThrowableReturn(strVal);
    ret
  end
  private RefedInterface1 cached_0;

  static final java.util.function.Function<io.vertx.codegen.testmodel.TestInterface, TestInterface> FACTORY = io.vertx.lang.groovy.Factories.createFactory() {
    io.vertx.codegen.testmodel.TestInterface arg -> new TestInterface(arg);
  };
end
