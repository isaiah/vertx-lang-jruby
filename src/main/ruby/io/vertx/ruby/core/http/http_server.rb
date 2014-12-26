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
java_import io.vertx.jruby.core.metrics.Measured
java_import java.util.Map
java_import io.vertx.core.json.JsonObject
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
#
# An HTTP and WebSockets server<p>
# If an instance is instantiated from an event loop then the handlers
# of the instance will always be called on that same event loop.
# If an instance is instantiated from some other arbitrary Java thread then
# an event loop will be assigned to the instance and used when any of its handlers
# are called.<p>
# Instances of HttpServer are thread-safe.<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class HttpServer 
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
    
  # Return the request stream for the server. As HTTP requests are received by the server,
  # instances of {@link HttpServerRequest} will be created and passed to this stream {@link io.vertx.core.streams.ReadStream#handler(io.vertx.core.Handler)}.
  #
  # @return the request stream
  def requestStream 
    ret= HttpServerRequestStream.FACTORY.apply(this.delegate.requestStream());
    ret
  end
    
  # Set the request handler for the server to {@code requestHandler}. As HTTP requests are received by the server,
  # instances of {@link HttpServerRequest} will be created and passed to this handler.
  #
  # @return a reference to this, so methods can be chained.
  def requestHandler handler
    ret= HttpServer.FACTORY.apply(this.delegate.requestHandler(new Handler<io.vertx.core.http.HttpServerRequest>() {
      public void handle(io.vertx.core.http.HttpServerRequest event) {
        handler.handle(HttpServerRequest.FACTORY.call(event));
      }
    }));
    ret
  end
    
  # Return the websocket stream for the server. If a websocket connect handshake is successful a
  # new {@link ServerWebSocket} instance will be created and passed to this stream {@link io.vertx.core.streams.ReadStream#handler(io.vertx.core.Handler)}.
  #
  # @return the websocket stream
  def websocketStream 
    ret= ServerWebSocketStream.FACTORY.apply(this.delegate.websocketStream());
    ret
  end
    
  # Set the websocket handler for the server to {@code wsHandler}. If a websocket connect handshake is successful a
  # new {@link ServerWebSocket} instance will be created and passed to the handler.
  #
  # @return a reference to this, so methods can be chained.
  def websocketHandler handler
    ret= HttpServer.FACTORY.apply(this.delegate.websocketHandler(new Handler<io.vertx.core.http.ServerWebSocket>() {
      public void handle(io.vertx.core.http.ServerWebSocket event) {
        handler.handle(ServerWebSocket.FACTORY.call(event));
      }
    }));
    ret
  end
    
  def listen 
    this.delegate.listen();
    return self
  end
    
  def listen listenHandler
    this.delegate.listen(new Handler<AsyncResult<io.vertx.core.http.HttpServer>>() {
      public void handle(AsyncResult<io.vertx.core.http.HttpServer> event) {
        AsyncResult<HttpServer> f
        if (event.succeeded()) {
          f = InternalHelper.<HttpServer>result(new HttpServer(event.result()))
        } else {
          f = InternalHelper.<HttpServer>failure(event.cause())
        }
        listenHandler.handle(f)
      }
    });
    return self
  end
    
  # Close the server. Any open HTTP connections will be closed.
  def close 
    this.delegate.close();
  end
    
  # Close the server. Any open HTTP connections will be closed. The {@code completionHandler} will be called when the close
  # is complete.
  def close completionHandler
    this.delegate.close(completionHandler);
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    HttpServer.new(arg)
  end
end
