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
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
#
#
# An asynchronous map.
#
# @author <a href="http://tfox.org">Tim Fox</a>

#
class AsyncMap<K,V>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # Get a value from the map, asynchronously.
  # @param k The key
  # @param resultHandler - this will be called some time later with the async result.
  def get k, resultHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).get(InternalHelper.unwrapObject(k), new Handler<AsyncResult<Object>>() {
      public void handle(AsyncResult<Object> event) {
        AsyncResult<Object> f
        if (event.succeeded()) {
          f = InternalHelper.<Object>result(InternalHelper.wrapObject(event.result()))
        } else {
          f = InternalHelper.<Object>failure(event.cause())
        }
        resultHandler.handle(f)
      }
    });
  end
    
  # Put a value in the map, asynchronously.
  # @param k The key
  # @param v The value
  # @param completionHandler - this will be called some time later to signify the value has been put
  def put k, v, completionHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).put(InternalHelper.unwrapObject(k), InternalHelper.unwrapObject(v), completionHandler);
  end
    
  def put k, v, timeout, completionHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).put(InternalHelper.unwrapObject(k), InternalHelper.unwrapObject(v), timeout, completionHandler);
  end
    
  def putIfAbsent k, v, completionHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).putIfAbsent(InternalHelper.unwrapObject(k), InternalHelper.unwrapObject(v), new Handler<AsyncResult<Object>>() {
      public void handle(AsyncResult<Object> event) {
        AsyncResult<Object> f
        if (event.succeeded()) {
          f = InternalHelper.<Object>result(InternalHelper.wrapObject(event.result()))
        } else {
          f = InternalHelper.<Object>failure(event.cause())
        }
        completionHandler.handle(f)
      }
    });
  end
    
  def putIfAbsent k, v, timeout, completionHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).putIfAbsent(InternalHelper.unwrapObject(k), InternalHelper.unwrapObject(v), timeout, new Handler<AsyncResult<Object>>() {
      public void handle(AsyncResult<Object> event) {
        AsyncResult<Object> f
        if (event.succeeded()) {
          f = InternalHelper.<Object>result(InternalHelper.wrapObject(event.result()))
        } else {
          f = InternalHelper.<Object>failure(event.cause())
        }
        completionHandler.handle(f)
      }
    });
  end
    
  # Remove a value from the map, asynchronously.
  # @param k The key
  # @param resultHandler - this will be called some time later to signify the value has been removed
  def remove k, resultHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).remove(InternalHelper.unwrapObject(k), new Handler<AsyncResult<Object>>() {
      public void handle(AsyncResult<Object> event) {
        AsyncResult<Object> f
        if (event.succeeded()) {
          f = InternalHelper.<Object>result(InternalHelper.wrapObject(event.result()))
        } else {
          f = InternalHelper.<Object>failure(event.cause())
        }
        resultHandler.handle(f)
      }
    });
  end
    
  def removeIfPresent k, v, resultHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).removeIfPresent(InternalHelper.unwrapObject(k), InternalHelper.unwrapObject(v), resultHandler);
  end
    
  def replace k, v, resultHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).replace(InternalHelper.unwrapObject(k), InternalHelper.unwrapObject(v), new Handler<AsyncResult<Object>>() {
      public void handle(AsyncResult<Object> event) {
        AsyncResult<Object> f
        if (event.succeeded()) {
          f = InternalHelper.<Object>result(InternalHelper.wrapObject(event.result()))
        } else {
          f = InternalHelper.<Object>failure(event.cause())
        }
        resultHandler.handle(f)
      }
    });
  end
    
  def replaceIfPresent k, oldValue, newValue, resultHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).replaceIfPresent(InternalHelper.unwrapObject(k), InternalHelper.unwrapObject(oldValue), InternalHelper.unwrapObject(newValue), resultHandler);
  end
    
  def clear resultHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).clear(resultHandler);
  end
    
  def size resultHandler
    ((io.vertx.core.shareddata.AsyncMap) this.delegate).size(resultHandler);
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    AsyncMap.new(arg)
  end
end
