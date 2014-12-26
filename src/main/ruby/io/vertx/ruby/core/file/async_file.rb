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
java_import io.vertx.jruby.core.buffer.Buffer
java_import io.vertx.jruby.core.streams.WriteStream
java_import io.vertx.jruby.core.streams.ReadStream
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
#
# Represents a file on the file-system which can be read from, or written to asynchronously.<p>
# This class also implements {@link io.vertx.core.streams.ReadStream} and
# {@link io.vertx.core.streams.WriteStream}. This allows the data to be pumped to and from
# other streams, e.g. an {@link io.vertx.core.http.HttpClientRequest} instance,
# using the {@link io.vertx.core.streams.Pump} class<p>
# Instances of AsyncFile are not thread-safe<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class AsyncFile 
include ReadStream<Buffer>,  WriteStream<Buffer>
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
    
  def handler handler
    this.delegate.handler(new Handler<io.vertx.core.buffer.Buffer>() {
      public void handle(io.vertx.core.buffer.Buffer event) {
        handler.handle(Buffer.FACTORY.call(event));
      }
    });
    return self
  end
    
  def pause 
    this.delegate.pause();
    return self
  end
    
  def resume 
    this.delegate.resume();
    return self
  end
    
  def endHandler toHandler
    this.delegate.endHandler(endHandler);
    return self
  end
    
  def write data
    this.delegate.write((io.vertx.core.buffer.Buffer)data.getDelegate());
    return self
  end
    
  def setWriteQueueMaxSize maxSize
    this.delegate.setWriteQueueMaxSize(maxSize);
    return self
  end
    
  def drainHandler handler
    this.delegate.drainHandler(handler);
    return self
  end
    
  def exceptionHandler handler
    this.delegate.exceptionHandler(handler);
    return self
  end
    
  # Close the file. The actual close happens asynchronously.
  def close 
    this.delegate.close();
  end
    
  # Close the file. The actual close happens asynchronously.
  # The handler will be called when the close is complete, or an error occurs.
  def close handler
    this.delegate.close(handler);
  end
    
  # Write a {@link io.vertx.core.buffer.Buffer} to the file at position {@code position} in the file, asynchronously.
  # If {@code position} lies outside of the current size
  # of the file, the file will be enlarged to encompass it.<p>
  # When multiple writes are invoked on the same file
  # there are no guarantees as to order in which those writes actually occur.<p>
  # The handler will be called when the write is complete, or if an error occurs.
  def write buffer, position, handler
    this.delegate.write((io.vertx.core.buffer.Buffer)buffer.getDelegate(), position, handler);
    return self
  end
    
  # Reads {@code length} bytes of data from the file at position {@code position} in the file, asynchronously.
  # The read data will be written into the specified {@code Buffer buffer} at position {@code offset}.<p>
  # If data is read past the end of the file then zero bytes will be read.<p>
  # When multiple reads are invoked on the same file there are no guarantees as to order in which those reads actually occur.<p>
  # The handler will be called when the close is complete, or if an error occurs.
  def read buffer, offset, position, length, handler
    this.delegate.read((io.vertx.core.buffer.Buffer)buffer.getDelegate(), offset, position, length, new Handler<AsyncResult<io.vertx.core.buffer.Buffer>>() {
      public void handle(AsyncResult<io.vertx.core.buffer.Buffer> event) {
        AsyncResult<Buffer> f
        if (event.succeeded()) {
          f = InternalHelper.<Buffer>result(new Buffer(event.result()))
        } else {
          f = InternalHelper.<Buffer>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Flush any writes made to this file to underlying persistent storage.<p>
  # If the file was opened with {@code flush} set to {@code true} then calling this method will have no effect.<p>
  # The actual flush will happen asynchronously.
  def flush 
    this.delegate.flush();
    return self
  end
    
  # Same as {@link #flush} but the handler will be called when the flush is complete or if an error occurs
  def flush handler
    this.delegate.flush(handler);
    return self
  end
    
  def setReadPos readPos
    this.delegate.setReadPos(readPos);
    return self
  end
    
  def setWritePos readPos
    this.delegate.setWritePos(readPos);
    return self
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    AsyncFile.new(arg)
  end
end
