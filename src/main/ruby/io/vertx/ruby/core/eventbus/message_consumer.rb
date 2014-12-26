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
java_import io.vertx.jruby.core.streams.ReadStream
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
#
# An event bus consumer object representing a stream of message to an {@link EventBus} address that can
# be read from.<p>
#
# The {@link EventBus#consumer(String)} or {@link EventBus#localConsumer(String)}
# create a new consumer, the returned consumer is not yet registered against the event bus. Registration
# is effective after the {@link #handler(io.vertx.core.Handler)} method is invoked.<p>
#
# The consumer is unregistered from the event bus using the {@link #unregister()} method or by calling the
# {@link #handler(io.vertx.core.Handler)} with a null value..
#
# @author <a href="mailto:nscavell@redhat.com">Nick Scavelli</a>
#
class MessageConsumer<T> 
include ReadStream<Message<T>>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def exceptionHandler handler
    ((io.vertx.core.eventbus.MessageConsumer) this.delegate).exceptionHandler(handler);
    return self
  end
    
  def handler handler
    ((io.vertx.core.eventbus.MessageConsumer) this.delegate).handler(new Handler<io.vertx.core.eventbus.Message<java.lang.Object>>() {
      public void handle(io.vertx.core.eventbus.Message<java.lang.Object> event) {
        handler.handle(Message.FACTORY.call(event));
      }
    });
    return self
  end
    
  def pause 
    ((io.vertx.core.eventbus.MessageConsumer) this.delegate).pause();
    return self
  end
    
  def resume 
    ((io.vertx.core.eventbus.MessageConsumer) this.delegate).resume();
    return self
  end
    
  def endHandler toHandler
    ((io.vertx.core.eventbus.MessageConsumer) this.delegate).endHandler(endHandler);
    return self
  end
    
  # @return a read stream for the body of the message stream.
  def bodyStream 
    ret= ReadStream.FACTORY.apply(((io.vertx.core.eventbus.MessageConsumer) this.delegate).bodyStream());
    ret
  end
    
  # @return true if the current consumer is registered
  def isRegistered 
    ret = ((io.vertx.core.eventbus.MessageConsumer) this.delegate).isRegistered();
    ret
  end
    
  # @return The address the handler was registered with.
  def address 
    ret = ((io.vertx.core.eventbus.MessageConsumer) this.delegate).address();
    ret
  end
    
  # Set the number of messages this registration will buffer when this stream is paused. The default
  # value is <code>0</code>. When a new value is set, buffered messages may be discarded to reach
  # the new value.
  #
  # @param maxBufferedMessages the maximum number of messages that can be buffered
  # @return this registration
  def setMaxBufferedMessages maxBufferedMessages
    ret= MessageConsumer.FACTORY.apply(((io.vertx.core.eventbus.MessageConsumer) this.delegate).setMaxBufferedMessages(maxBufferedMessages));
    ret
  end
    
  # @return the maximum number of messages that can be buffered when this stream is paused
  def getMaxBufferedMessages 
    ret = ((io.vertx.core.eventbus.MessageConsumer) this.delegate).getMaxBufferedMessages();
    ret
  end
    
  # Optional method which can be called to indicate when the registration has been propagated across the cluster.
  #
  # @param completionHandler the completion handler
  def completionHandler completionHandler
    ((io.vertx.core.eventbus.MessageConsumer) this.delegate).completionHandler(completionHandler);
  end
    
  # Unregisters the handler which created this registration
  def unregister 
    ((io.vertx.core.eventbus.MessageConsumer) this.delegate).unregister();
  end
    
  # Unregisters the handler which created this registration
  #
  # @param completionHandler the handler called when the unregister is done. For example in a cluster when all nodes of the
  # event bus have been unregistered.
  def unregister completionHandler
    ((io.vertx.core.eventbus.MessageConsumer) this.delegate).unregister(completionHandler);
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    MessageConsumer.new(arg)
  end
end
