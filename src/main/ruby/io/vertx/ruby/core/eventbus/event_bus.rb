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
java_import io.vertx.jruby.core.metrics.Measured
java_import java.util.Map
java_import io.vertx.core.json.JsonObject
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
#
# A distributed lightweight event bus which can encompass multiple vert.x instances.
# The event bus implements publish / subscribe, point to point messaging and request-response messaging.<p>
# Messages sent over the event bus are represented by instances of the {@link io.vertx.core.eventbus.Message} class.<p>
# For publish / subscribe, messages can be published to an address using one of the {@link #publish} methods. An
# address is a simple {@code String} instance.<p>
# Handlers are registered against an address. There can be multiple handlers registered against each address, and a particular handler can
# be registered against multiple addresses. The event bus will route a sent message to all handlers which are
# registered against that address.<p>
# For point to point messaging, messages can be sent to an address using one of the {@link #send} methods.
# The messages will be delivered to a single handler, if one is registered on that address. If more than one
# handler is registered on the same address, Vert.x will choose one and deliver the message to that. Vert.x will
# aim to fairly distribute messages in a round-robin way, but does not guarantee strict round-robin under all
# circumstances.<p>
# All messages sent over the bus are transient. On event of failure of all or part of the event bus messages
# may be lost. Applications should be coded to cope with lost messages, e.g. by resending them, and making application
# services idempotent.<p>
# The order of messages received by any specific handler from a specific sender should match the order of messages
# sent from that sender.<p>
# When sending a message, a reply handler can be provided. If so, it will be called when the reply from the receiver
# has been received. Reply messages can also be replied to, etc, ad infinitum<p>
# Different event bus instances can be clustered together over a network, to give a single logical event bus.<p>
# Instances of EventBus are thread-safe.<p>
# If handlers are registered from an event loop, they will be executed using that same event loop. If they are
# registered from outside an event loop (i.e. when using Vert.x embedded) then Vert.x will assign an event loop
# to the handler and use it to deliver messages to that handler.
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class EventBus 
include Measured
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # The metric base name
  #
  # @return the metric base name
  def metricBaseName 
    ret = ((io.vertx.core.metrics.Measured) this.delegate).metricBaseName();
    ret
  end
    
  # Will return the metrics that correspond with this measured object.
  #
  # @return the map of metrics where the key is the name of the metric (excluding the base name) and the value is
  # the json data representing that metric
  def metrics 
    ret = ((io.vertx.core.metrics.Measured) this.delegate).metrics()?.collectEntries({k, v -> [k, v.getMap()]});
    ret
  end
    
  # Close the EventBus and release all resources. 
  #
  # @param completionHandler may be {@code null}
  def close completionHandler
    this.delegate.close(completionHandler);
  end
    
  # Send a message
  # @param address The address to send it to
  # @param message The message, may be {@code null}
  def send address, message
    this.delegate.send(address, InternalHelper.unwrapObject(message));
    return self
  end
    
  # Send a message
  # @param address The address to send it to
  # @param message The message, may be {@code null}
  # @param replyHandler Reply handler will be called when any reply from the recipient is received, may be {@code null}
  def send address, message, replyHandler
    this.delegate.send(address, InternalHelper.unwrapObject(message), new Handler<AsyncResult<io.vertx.core.eventbus.Message<java.lang.Object>>>() {
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
    return self
  end
    
  def send address, message, options
    this.delegate.send(address, InternalHelper.unwrapObject(message), options != null ? new io.vertx.core.eventbus.DeliveryOptions(new io.vertx.core.json.JsonObject(options)) : null);
    return self
  end
    
  def send address, message, options, replyHandler
    this.delegate.send(address, InternalHelper.unwrapObject(message), options != null ? new io.vertx.core.eventbus.DeliveryOptions(new io.vertx.core.json.JsonObject(options)) : null, new Handler<AsyncResult<io.vertx.core.eventbus.Message<java.lang.Object>>>() {
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
    return self
  end
    
  # Publish a message
  # @param address The address to publish it to
  # @param message The message, may be {@code null}
  def publish address, message
    this.delegate.publish(address, InternalHelper.unwrapObject(message));
    return self
  end
    
  def publish address, message, options
    this.delegate.publish(address, InternalHelper.unwrapObject(message), options != null ? new io.vertx.core.eventbus.DeliveryOptions(new io.vertx.core.json.JsonObject(options)) : null);
    return self
  end
    
  # Create a message consumer against the specified address. The returned consumer is not yet registered
  # at the address, registration will be effective when {@link MessageConsumer#handler(io.vertx.core.Handler)}
  # is called.
  #
  # @param address The address that will register it at
  # @return the event bus message consumer
  def consumer address
    ret= MessageConsumer.FACTORY.apply(this.delegate.consumer(address));
    ret
  end
    
  # Register a message consumer against the specified address.
  #
  # @param address The address that will register it at
  # @param handler The handler that will process the received messages
  # @return the event bus message consumer
  def consumer address, handler
    ret= MessageConsumer.FACTORY.apply(this.delegate.consumer(address, new Handler<io.vertx.core.eventbus.Message<java.lang.Object>>() {
      public void handle(io.vertx.core.eventbus.Message<java.lang.Object> event) {
        handler.handle(Message.FACTORY.call(event));
      }
    }));
    ret
  end
    
  # Create a local message consumer against the specified address. The handler info won't
  # be propagated across the cluster. The returned consumer is not yet registered at the
  # address, registration will be effective when {@link MessageConsumer#handler(io.vertx.core.Handler)}
  # is called.
  #
  # @param address The address to register it at
  # @return the event bus message consumer
  def localConsumer address
    ret= MessageConsumer.FACTORY.apply(this.delegate.localConsumer(address));
    ret
  end
    
  # Register a local message consumer against the specified address. The handler info won't be propagated
  # across the cluster.
  #
  # @param address The address that will register it at
  # @param handler The handler that will process the received messages
  # @return the event bus message consumer
  def localConsumer address, handler
    ret= MessageConsumer.FACTORY.apply(this.delegate.localConsumer(address, new Handler<io.vertx.core.eventbus.Message<java.lang.Object>>() {
      public void handle(io.vertx.core.eventbus.Message<java.lang.Object> event) {
        handler.handle(Message.FACTORY.call(event));
      }
    }));
    ret
  end
    
  # Create a message sender against the specified address. The returned sender will invoke the {@link #send(String, Object)}
  # method when the stream {@link io.vertx.core.streams.WriteStream#write(Object)} method is called with the sender
  # address and the provided data.
  #
  # @param address The address to send it to
  # @return The sender
  def sender address
    ret= MessageProducer.FACTORY.apply(this.delegate.sender(address));
    ret
  end
    
  # Create a message sender against the specified address. The returned sender will invoke the {@link #send(String, Object, DeliveryOptions)}
  # method when the stream {@link io.vertx.core.streams.WriteStream#write(Object)} method is called with the sender
  # address, the provided data and the sender delivery options.
  #
  # @param address The address to send it to
  # @return The sender
  def sender address, options
    ret= MessageProducer.FACTORY.apply(this.delegate.sender(address, options != null ? new io.vertx.core.eventbus.DeliveryOptions(new io.vertx.core.json.JsonObject(options)) : null));
    ret
  end
    
  # Create a message publisher against the specified address. The returned publisher will invoke the {@link #publish(String, Object)}
  # method when the stream {@link io.vertx.core.streams.WriteStream#write(Object)} method is called with the publisher
  # address and the provided data.
  #
  # @param address The address to publish it to
  # @return The publisher
  def publisher address
    ret= MessageProducer.FACTORY.apply(this.delegate.publisher(address));
    ret
  end
    
  # Create a message publisher against the specified address. The returned publisher will invoke the {@link #publish(String, Object, DeliveryOptions)}
  # method when the stream {@link io.vertx.core.streams.WriteStream#write(Object)} method is called with the publisher
  # address, the provided data and the publisher delivery options.
  #
  # @param address The address to publish it to
  # @return The publisher
  def publisher address, options
    ret= MessageProducer.FACTORY.apply(this.delegate.publisher(address, options != null ? new io.vertx.core.eventbus.DeliveryOptions(new io.vertx.core.json.JsonObject(options)) : null));
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    EventBus.new(arg)
  end
end
