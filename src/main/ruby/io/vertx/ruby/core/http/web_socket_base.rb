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
java_import io.vertx.core.Handler
java_import io.vertx.jruby.core.net.SocketAddress
#
# Represents an HTML 5 Websocket<p>
# Instances of this class are created and provided to the handler of an
# {@link HttpClient} when a successful websocket connect attempt occurs.<p>
# On the server side, the subclass {@link ServerWebSocket} is used instead.<p>
# It implements both {@link ReadStream} and {@link WriteStream} so it can be used with
# {@link io.vertx.core.streams.Pump} to pump data with flow control.<p>
# Instances of this class are not thread-safe<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
module WebSocketBase extends ReadStream<Buffer>,  WriteStream<Buffer>
  public Object getDelegate();
  def writeQueueFull();end
  def exceptionHandler(handler);end
  def handler(handler);end
  def pause();end
  def resume();end
  def endHandler(toHandler);end
  def write(data);end
  def setWriteQueueMaxSize(maxSize);end
  def drainHandler(handler);end
  def binaryHandlerID();end
  def textHandlerID();end
  def writeFrame(frame);end
  def writeMessage(data);end
  def closeHandler(handler);end
  def frameHandler(handler);end
  def close();end
  def remoteAddress();end
  def localAddress();end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    WebSocketBaseImpl.new(arg)
  end
end

class WebSocketBaseImpl implements WebSocketBase
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
    ((io.vertx.core.http.WebSocketBase) this.delegate).exceptionHandler(handler);
    return self
  end
    
  def handler handler
    ((io.vertx.core.http.WebSocketBase) this.delegate).handler(new Handler<io.vertx.core.buffer.Buffer>() {
      public void handle(io.vertx.core.buffer.Buffer event) {
        handler.handle(Buffer.FACTORY.call(event));
      }
    });
    return self
  end
    
  def pause 
    ((io.vertx.core.http.WebSocketBase) this.delegate).pause();
    return self
  end
    
  def resume 
    ((io.vertx.core.http.WebSocketBase) this.delegate).resume();
    return self
  end
    
  def endHandler toHandler
    ((io.vertx.core.http.WebSocketBase) this.delegate).endHandler(endHandler);
    return self
  end
    
  def write data
    ((io.vertx.core.http.WebSocketBase) this.delegate).write((io.vertx.core.buffer.Buffer)data.getDelegate());
    return self
  end
    
  def setWriteQueueMaxSize maxSize
    ((io.vertx.core.http.WebSocketBase) this.delegate).setWriteQueueMaxSize(maxSize);
    return self
  end
    
  def drainHandler handler
    ((io.vertx.core.http.WebSocketBase) this.delegate).drainHandler(handler);
    return self
  end
    
  # When a {@code Websocket} is created it automatically registers an event handler with the eventbus, the ID of that
  # handler is given by {@code binaryHandlerID}.<p>
  # Given this ID, a different event loop can send a binary frame to that event handler using the event bus and
  # that buffer will be received by this instance in its own event loop and written to the underlying connection. This
  # allows you to write data to other websockets which are owned by different event loops.
  def binaryHandlerID 
    ret = ((io.vertx.core.http.WebSocketBase) this.delegate).binaryHandlerID();
    ret
  end
    
  # When a {@code Websocket} is created it automatically registers an event handler with the eventbus, the ID of that
  # handler is given by {@code textHandlerID}.<p>
  # Given this ID, a different event loop can send a text frame to that event handler using the event bus and
  # that buffer will be received by this instance in its own event loop and written to the underlying connection. This
  # allows you to write data to other websockets which are owned by different event loops.
  def textHandlerID 
    ret = ((io.vertx.core.http.WebSocketBase) this.delegate).textHandlerID();
    ret
  end
    
  def writeFrame frame
    ((io.vertx.core.http.WebSocketBase) this.delegate).writeFrame((io.vertx.core.http.WebSocketFrame)frame.getDelegate());
    return self
  end
    
  # Writes a (potentially large) piece of data as a websocket message - this may be split into multiple frames
  # if it is large.
  def writeMessage data
    ((io.vertx.core.http.WebSocketBase) this.delegate).writeMessage((io.vertx.core.buffer.Buffer)data.getDelegate());
    return self
  end
    
  # Set a closed handler on the connection
  def closeHandler handler
    ((io.vertx.core.http.WebSocketBase) this.delegate).closeHandler(handler);
    return self
  end
    
  # Set a frame handler on the connection
  def frameHandler handler
    ((io.vertx.core.http.WebSocketBase) this.delegate).frameHandler(new Handler<io.vertx.core.http.WebSocketFrame>() {
      public void handle(io.vertx.core.http.WebSocketFrame event) {
        handler.handle(WebSocketFrame.FACTORY.call(event));
      }
    });
    return self
  end
    
  # Close the websocket
  def close 
    ((io.vertx.core.http.WebSocketBase) this.delegate).close();
  end
    
  # Return the remote address for this socket
  def remoteAddress 
    if (cached_0 != null) {
      return cached_0;
    }
    ret= SocketAddress.FACTORY.apply(((io.vertx.core.http.WebSocketBase) this.delegate).remoteAddress());
    cached_0 = ret
    ret
  end
    
  # Return the local address for this socket
  def localAddress 
    if (cached_1 != null) {
      return cached_1;
    }
    ret= SocketAddress.FACTORY.apply(((io.vertx.core.http.WebSocketBase) this.delegate).localAddress());
    cached_1 = ret
    ret
  end
  private SocketAddress cached_0;
  private SocketAddress cached_1;
end
