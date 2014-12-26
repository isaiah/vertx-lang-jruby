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
java_import io.vertx.jruby.core.MultiMap
java_import io.vertx.core.http.WebsocketVersion
java_import io.vertx.jruby.core.metrics.Measured
java_import io.vertx.core.http.HttpMethod
java_import java.util.Map
java_import io.vertx.core.json.JsonObject
java_import io.vertx.core.Handler
#
# An HTTP client that maintains a pool of connections to a specific host, at a specific port. The client supports
# pipelining of requests.<p>
# As well as HTTP requests, the client can act as a factory for {@code WebSocket websockets}.<p>
# If an instance is instantiated from an event loop then the handlers
# of the instance will always be called on that same event loop.
# If an instance is instantiated from some other arbitrary Java thread (i.e. when running embedded) then
# and event loop will be assigned to the instance and used when any of its handlers
# are called.<p>
# Instances of HttpClient are thread-safe.<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class HttpClient 
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
    
  def request method, absoluteURI
    ret= HttpClientRequest.FACTORY.apply(this.delegate.request(method, absoluteURI));
    ret
  end
    
  # Create a new http client request.
  #
  # The returned request does not have yet a response handler and one should be set before sending
  # any data to the remote server.
  #
  # @param method the http method
  # @param port the remote server port
  # @param host the remote server host
  # @param requestURI the request uri
  # @return the http client request
  def request method, port, host, requestURI
    ret= HttpClientRequest.FACTORY.apply(this.delegate.request(method, port, host, requestURI));
    ret
  end
    
  def request method, absoluteURI, responseHandler
    ret= HttpClientRequest.FACTORY.apply(this.delegate.request(method, absoluteURI, new Handler<io.vertx.core.http.HttpClientResponse>() {
      public void handle(io.vertx.core.http.HttpClientResponse event) {
        responseHandler.handle(HttpClientResponse.FACTORY.call(event));
      }
    }));
    ret
  end
    
  def request method, port, host, requestURI, responseHandler
    ret= HttpClientRequest.FACTORY.apply(this.delegate.request(method, port, host, requestURI, new Handler<io.vertx.core.http.HttpClientResponse>() {
      public void handle(io.vertx.core.http.HttpClientResponse event) {
        responseHandler.handle(HttpClientResponse.FACTORY.call(event));
      }
    }));
    ret
  end
    
  def websocket port, host, requestURI
    ret= WebSocketStream.FACTORY.apply(this.delegate.websocket(port, host, requestURI));
    ret
  end
    
  def websocket port, host, requestURI, headers
    ret= WebSocketStream.FACTORY.apply(this.delegate.websocket(port, host, requestURI, (io.vertx.core.MultiMap)headers.getDelegate()));
    ret
  end
    
  def websocket port, host, requestURI, headers, version
    ret= WebSocketStream.FACTORY.apply(this.delegate.websocket(port, host, requestURI, (io.vertx.core.MultiMap)headers.getDelegate(), version));
    ret
  end
    
  # @return a {@link io.vertx.core.http.WebSocketStream} configured with the specified arguments
  def websocket port, host, requestURI, headers, version, subProtocols
    ret= WebSocketStream.FACTORY.apply(this.delegate.websocket(port, host, requestURI, (io.vertx.core.MultiMap)headers.getDelegate(), version, subProtocols));
    ret
  end
    
  def connectWebsocket port, host, requestURI, wsConnect
    ret= HttpClient.FACTORY.apply(this.delegate.connectWebsocket(port, host, requestURI, new Handler<io.vertx.core.http.WebSocket>() {
      public void handle(io.vertx.core.http.WebSocket event) {
        wsConnect.handle(WebSocket.FACTORY.call(event));
      }
    }));
    ret
  end
    
  def connectWebsocket port, host, requestURI, headers, wsConnect
    ret= HttpClient.FACTORY.apply(this.delegate.connectWebsocket(port, host, requestURI, (io.vertx.core.MultiMap)headers.getDelegate(), new Handler<io.vertx.core.http.WebSocket>() {
      public void handle(io.vertx.core.http.WebSocket event) {
        wsConnect.handle(WebSocket.FACTORY.call(event));
      }
    }));
    ret
  end
    
  def connectWebsocket port, host, requestURI, headers, version, wsConnect
    ret= HttpClient.FACTORY.apply(this.delegate.connectWebsocket(port, host, requestURI, (io.vertx.core.MultiMap)headers.getDelegate(), version, new Handler<io.vertx.core.http.WebSocket>() {
      public void handle(io.vertx.core.http.WebSocket event) {
        wsConnect.handle(WebSocket.FACTORY.call(event));
      }
    }));
    ret
  end
    
  def connectWebsocket port, host, requestURI, headers, version, subProtocols, wsConnect
    ret= HttpClient.FACTORY.apply(this.delegate.connectWebsocket(port, host, requestURI, (io.vertx.core.MultiMap)headers.getDelegate(), version, subProtocols, new Handler<io.vertx.core.http.WebSocket>() {
      public void handle(io.vertx.core.http.WebSocket event) {
        wsConnect.handle(WebSocket.FACTORY.call(event));
      }
    }));
    ret
  end
    
  # Close the HTTP client. This will cause any pooled HTTP connections to be closed.
  def close 
    this.delegate.close();
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    HttpClient.new(arg)
  end
end
