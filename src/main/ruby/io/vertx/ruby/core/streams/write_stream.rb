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
#
# Represents a stream of data that can be written to<p>
# Any class that implements this interface can be used by a {@link Pump} to pump data from a {@code ReadStream}
# to it.<p>
# This interface exposes a fluent api and the type T represents the type of the object that implements
# the interface to allow method chaining
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
module WriteStream<T> extends StreamBase
  public Object getDelegate();
  def exceptionHandler(handler);end
  def write(data);end
  def setWriteQueueMaxSize(maxSize);end
  def writeQueueFull();end
  def drainHandler(handler);end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    WriteStreamImpl.new(arg)
  end
end

class WriteStreamImpl<T> implements WriteStream<T>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def exceptionHandler handler
    ((io.vertx.core.streams.WriteStream) this.delegate).exceptionHandler(handler);
    return self
  end
    
  # Write some data to the stream. The data is put on an internal write queue, and the write actually happens
  # asynchronously. To avoid running out of memory by putting too much on the write queue,
  # check the {@link #writeQueueFull} method before writing. This is done automatically if using a {@link Pump}.
  def write data
    ((io.vertx.core.streams.WriteStream) this.delegate).write(InternalHelper.unwrapObject(data));
    return self
  end
    
  # Set the maximum size of the write queue to {@code maxSize}. You will still be able to write to the stream even
  # if there is more than {@code maxSize} bytes in the write queue. This is used as an indicator by classes such as
  # {@code Pump} to provide flow control.
  def setWriteQueueMaxSize maxSize
    ((io.vertx.core.streams.WriteStream) this.delegate).setWriteQueueMaxSize(maxSize);
    return self
  end
    
  # This will return {@code true} if there are more bytes in the write queue than the value set using {@link
  # #setWriteQueueMaxSize}
  def writeQueueFull 
    ret = ((io.vertx.core.streams.WriteStream) this.delegate).writeQueueFull();
    ret
  end
    
  # Set a drain handler on the stream. If the write queue is full, then the handler will be called when the write
  # queue has been reduced to maxSize / 2. See {@link Pump} for an example of this being used.
  def drainHandler handler
    ((io.vertx.core.streams.WriteStream) this.delegate).drainHandler(handler);
    return self
  end
end
