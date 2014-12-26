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
java_import io.vertx.jruby.core.streams.WriteStream
java_import io.vertx.core.Handler
#
# Represents a stream of message that can be written to<p>
#
# @author <a href="mailto:julien@julienviet.com">Julien Viet</a>
#
class MessageProducer<T> 
include WriteStream<T>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # This will return {@code true} if there are more bytes in the write queue than the value set using {@link
  # #setWriteQueueMaxSize}
  def writeQueueFull 
    ret = ((io.vertx.core.streams.WriteStream) this.delegate).writeQueueFull();
    ret
  end
    
  def exceptionHandler handler
    ((io.vertx.core.eventbus.MessageProducer) this.delegate).exceptionHandler(handler);
    return self
  end
    
  def write data
    ((io.vertx.core.eventbus.MessageProducer) this.delegate).write(InternalHelper.unwrapObject(data));
    return self
  end
    
  def setWriteQueueMaxSize maxSize
    ((io.vertx.core.eventbus.MessageProducer) this.delegate).setWriteQueueMaxSize(maxSize);
    return self
  end
    
  def drainHandler handler
    ((io.vertx.core.eventbus.MessageProducer) this.delegate).drainHandler(handler);
    return self
  end
    
  # Update the delivery options of this producer.
  #
  # @param options the new options
  # @return this producer object
  def deliveryOptions options = {}
    ((io.vertx.core.eventbus.MessageProducer) this.delegate).deliveryOptions(options != null ? new io.vertx.core.eventbus.DeliveryOptions(new io.vertx.core.json.JsonObject(options)) : null);
    return self
  end
    
  # @return The address to which the producer produces messages.
  def address 
    ret = ((io.vertx.core.eventbus.MessageProducer) this.delegate).address();
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    MessageProducer.new(arg)
  end
end
