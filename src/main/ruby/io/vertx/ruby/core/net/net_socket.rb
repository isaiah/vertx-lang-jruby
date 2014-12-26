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
# Represents a socket-like interface to a TCP/SSL connection on either the
# client or the server side.<p>
# Instances of this class are created on the client side by an {@link NetClient}
# when a connection to a server is made, or on the server side by a {@link NetServer}
# when a server accepts a connection.<p>
# It implements both {@link ReadStream} and {@link WriteStream} so it can be used with
# {@link io.vertx.core.streams.Pump} to pump data with flow control.<p>
# Instances of this class are not thread-safe.<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class NetSocket 
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
    
  def exceptionHandler handler
    this.delegate.exceptionHandler(handler);
    return self
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
    
  # When a {@code NetSocket} is created it automatically registers an event handler with the event bus, the ID of that
  # handler is given by {@code writeHandlerID}.<p>
  # Given this ID, a different event loop can send a buffer to that event handler using the event bus and
  # that buffer will be received by this instance in its own event loop and written to the underlying connection. This
  # allows you to write data to other connections which are owned by different event loops.
  def writeHandlerID 
    ret = this.delegate.writeHandlerID();
    ret
  end
    
  # Write a {@link String} to the connection, encoded in UTF-8.
  # @return A reference to this, so multiple method calls can be chained.
  def write str
    this.delegate.write(str);
    return self
  end
    
  # Write a {@link String} to the connection, encoded using the encoding {@code enc}.
  # @return A reference to this, so multiple method calls can be chained.
  def write str, enc
    this.delegate.write(str, enc);
    return self
  end
    
  # Tell the kernel to stream a file as specified by {@code filename} directly from disk to the outgoing connection,
  # bypassing userspace altogether (where supported by the underlying operating system. This is a very efficient way to stream files.
  def sendFile filename
    this.delegate.sendFile(filename);
    return self
  end
    
  # Same as {@link #sendFile(String)} but also takes a handler that will be called when the send has completed or
  # a failure has occurred
  def sendFile filename, resultHandler
    this.delegate.sendFile(filename, resultHandler);
    return self
  end
    
  # Return the remote address for this socket
  def remoteAddress 
    if (cached_0 != null) {
      return cached_0;
    }
    ret= SocketAddress.FACTORY.apply(this.delegate.remoteAddress());
    cached_0 = ret
    ret
  end
    
  # Return the local address for this socket
  def localAddress 
    if (cached_1 != null) {
      return cached_1;
    }
    ret= SocketAddress.FACTORY.apply(this.delegate.localAddress());
    cached_1 = ret
    ret
  end
    
  # Close the NetSocket
  def close 
    this.delegate.close();
  end
    
  # Set a handler that will be called when the NetSocket is closed
  def closeHandler handler
    this.delegate.closeHandler(handler);
    return self
  end
    
  # Upgrade channel to use SSL/TLS. Be aware that for this to work SSL must be configured.
  def upgradeToSsl handler
    this.delegate.upgradeToSsl(handler);
    return self
  end
    
  # Returns {@code true} if this {@link io.vertx.core.net.NetSocket} is encrypted via SSL/TLS.
  def isSsl 
    ret = this.delegate.isSsl();
    ret
  end
  private SocketAddress cached_0;
  private SocketAddress cached_1;

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    NetSocket.new(arg)
  end
end
