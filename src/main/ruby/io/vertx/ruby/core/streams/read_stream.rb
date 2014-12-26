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
java_import io.vertx.core.Handler
#
# Represents a stream of data that can be read from.<p>
# Any class that implements this interface can be used by a {@link Pump} to pump data from it
# to a {@link WriteStream}.<p>
# This interface exposes a fluent api and the type T represents the type of the object that implements
# the interface to allow method chaining
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
module ReadStream<T> extends StreamBase
  public Object getDelegate();
  def exceptionHandler(handler);end
  def handler(handler);end
  def pause();end
  def resume();end
  def endHandler(toHandler);end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    ReadStreamImpl.new(arg)
  end
end

class ReadStreamImpl<T> implements ReadStream<T>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def exceptionHandler handler
    ((io.vertx.core.streams.ReadStream) this.delegate).exceptionHandler(handler);
    return self
  end
    
  # Set a data handler. As data is read, the handler will be called with the data.
  def handler handler
    ((io.vertx.core.streams.ReadStream) this.delegate).handler(new Handler<Object>() {
      public void handle(Object event) {
        handler.handle(InternalHelper.wrapObject(event))
      }
    });
    return self
  end
    
  # Pause the {@code ReadSupport}. While it's paused, no data will be sent to the {@code dataHandler}
  def pause 
    ((io.vertx.core.streams.ReadStream) this.delegate).pause();
    return self
  end
    
  # Resume reading. If the {@code ReadSupport} has been paused, reading will recommence on it.
  def resume 
    ((io.vertx.core.streams.ReadStream) this.delegate).resume();
    return self
  end
    
  # Set an end handler. Once the stream has ended, and there is no more data to be read, this handler will be called.
  def endHandler toHandler
    ((io.vertx.core.streams.ReadStream) this.delegate).endHandler(endHandler);
    return self
  end
end
