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
java_import io.vertx.jruby.core.MultiMap
java_import io.vertx.core.Handler
java_import io.vertx.jruby.core.net.SocketAddress
#
# Represents a server side WebSocket that is passed into a the websocketHandler of an {@link HttpServer}<p>
# Instances of this class are not thread-safe<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class ServerWebSocket 
include WebSocketBase
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
    
  def writeFrame frame
    this.delegate.writeFrame((io.vertx.core.http.WebSocketFrame)frame.getDelegate());
    return self
  end
    
  def writeMessage data
    this.delegate.writeMessage((io.vertx.core.buffer.Buffer)data.getDelegate());
    return self
  end
    
  def closeHandler handler
    this.delegate.closeHandler(handler);
    return self
  end
    
  def frameHandler handler
    this.delegate.frameHandler(new Handler<io.vertx.core.http.WebSocketFrame>() {
      public void handle(io.vertx.core.http.WebSocketFrame event) {
        handler.handle(WebSocketFrame.FACTORY.call(event));
      }
    });
    return self
  end
    
  def uri 
    ret = this.delegate.uri();
    ret
  end
    
  # The path the websocket is attempting to connect at
  def path 
    ret = this.delegate.path();
    ret
  end
    
  # The query string passed on the websocket uri
  def query 
    ret = this.delegate.query();
    ret
  end
    
  # A map of all headers in the request to upgrade to websocket
  def headers 
    if (cached_2 != null) {
      return cached_2;
    }
    ret= MultiMap.FACTORY.apply(this.delegate.headers());
    cached_2 = ret
    ret
  end
    
  # Reject the WebSocket<p>
  # Calling this method from the websocketHandler gives you the opportunity to reject
  # the websocket, which will cause the websocket handshake to fail by returning
  # a 404 response code.<p>
  # You might use this method, if for example you only want to accept websockets
  # with a particular path.
  def reject 
    this.delegate.reject();
    return self
  end
  private SocketAddress cached_0;
  private SocketAddress cached_1;
  private MultiMap cached_2;

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    ServerWebSocket.new(arg)
  end
end
