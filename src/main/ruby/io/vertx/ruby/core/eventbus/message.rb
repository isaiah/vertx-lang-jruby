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
java_import io.vertx.core.eventbus.DeliveryOptions
java_import io.vertx.jruby.core.MultiMap
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class Message<T>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # The address the message was sent to
  def address 
    ret = ((io.vertx.core.eventbus.Message) this.delegate).address();
    ret
  end
    
  def headers 
    ret= MultiMap.FACTORY.apply(((io.vertx.core.eventbus.Message) this.delegate).headers());
    ret
  end
    
  # The body of the message
  def body 
    if (cached_0 != null) {
      return cached_0;
    }
    #This cast is cleary flawed
    ret = (T) InternalHelper.wrapObject(((io.vertx.core.eventbus.Message) this.delegate).body());
    cached_0 = ret
    ret
  end
    
  # The reply address (if any)
  def replyAddress 
    ret = ((io.vertx.core.eventbus.Message) this.delegate).replyAddress();
    ret
  end
    
  # Reply to this message. If the message was sent specifying a reply handler, that handler will be
  # called when it has received a reply. If the message wasn't sent specifying a receipt handler
  # this method does nothing.
  def reply message
    ((io.vertx.core.eventbus.Message) this.delegate).reply(InternalHelper.unwrapObject(message));
  end
    
  # The same as {@code reply(R message)} but you can specify handler for the reply - i.e.
  # to receive the reply to the reply.
  def reply message, replyHandler
    ((io.vertx.core.eventbus.Message) this.delegate).reply(InternalHelper.unwrapObject(message), new Handler<AsyncResult<io.vertx.core.eventbus.Message<java.lang.Object>>>() {
      public void handle(AsyncResult<io.vertx.core.eventbus.Message<java.lang.Object>> event) {
        AsyncResult<Message<Object>> f
        if (event.succeeded()) {
          f = InternalHelper.<Message<Object>>result(new Message<Object>(event.result()))
        } else {
          f = InternalHelper.<Message<Object>>failure(event.cause())
        }
        replyHandler.handle(f)
      }
    });
  end
    
  def reply message, options
    ((io.vertx.core.eventbus.Message) this.delegate).reply(InternalHelper.unwrapObject(message), options != null ? new io.vertx.core.eventbus.DeliveryOptions(new io.vertx.core.json.JsonObject(options)) : null);
  end
    
  # The same as {@code reply(R message)} but you can specify handler for the reply - i.e.
  # to receive the reply to the reply.
  def reply message, options, replyHandler
    ((io.vertx.core.eventbus.Message) this.delegate).reply(InternalHelper.unwrapObject(message), options != null ? new io.vertx.core.eventbus.DeliveryOptions(new io.vertx.core.json.JsonObject(options)) : null, new Handler<AsyncResult<io.vertx.core.eventbus.Message<java.lang.Object>>>() {
      public void handle(AsyncResult<io.vertx.core.eventbus.Message<java.lang.Object>> event) {
        AsyncResult<Message<Object>> f
        if (event.succeeded()) {
          f = InternalHelper.<Message<Object>>result(new Message<Object>(event.result()))
        } else {
          f = InternalHelper.<Message<Object>>failure(event.cause())
        }
        replyHandler.handle(f)
      }
    });
  end
    
  # Signal that processing of this message failed. If the message was sent specifying a result handler
  # the handler will be called with a failure corresponding to the failure code and message specified here
  # @param failureCode A failure code to pass back to the sender
  # @param message A message to pass back to the sender
  def fail failureCode, message
    ((io.vertx.core.eventbus.Message) this.delegate).fail(failureCode, message);
  end
  private T cached_0;

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    Message.new(arg)
  end
end
