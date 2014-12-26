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
# Represents a TCP or SSL server<p>
# If an instance is instantiated from an event loop then the handlers
# of the instance will always be called on that same event loop.
# If an instance is instantiated from some other arbitrary Java thread (i.e. when running embedded) then
# and event loop will be assigned to the instance and used when any of its handlers
# are called.<p>
# Instances of this class are thread-safe.<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class NetServer 
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
    
  # Return the connect stream for this server. The server can only have at most one handler at any one time.
  # As the server accepts TCP or SSL connections it creates an instance of {@link NetSocket} and passes it to the
  # connect stream {@link ReadStream#handler(io.vertx.core.Handler)}.
  #
  # @return the connect stream
  def connectStream 
    ret= NetSocketStream.FACTORY.apply(this.delegate.connectStream());
    ret
  end
    
  # Supply a connect handler for this server. The server can only have at most one connect handler at any one time.
  # As the server accepts TCP or SSL connections it creates an instance of {@link NetSocket} and passes it to the
  # connect handler.
  # @return a reference to this so multiple method calls can be chained together
  def connectHandler handler
    ret= NetServer.FACTORY.apply(this.delegate.connectHandler(new Handler<io.vertx.core.net.NetSocket>() {
      public void handle(io.vertx.core.net.NetSocket event) {
        handler.handle(NetSocket.FACTORY.call(event));
      }
    }));
    ret
  end
    
  def listen 
    this.delegate.listen();
    return self
  end
    
  # Instruct the server to listen for incoming connections on the specified {@code port} and all available interfaces.
  def listen listenHandler
    this.delegate.listen(new Handler<AsyncResult<io.vertx.core.net.NetServer>>() {
      public void handle(AsyncResult<io.vertx.core.net.NetServer> event) {
        AsyncResult<NetServer> f
        if (event.succeeded()) {
          f = InternalHelper.<NetServer>result(new NetServer(event.result()))
        } else {
          f = InternalHelper.<NetServer>failure(event.cause())
        }
        listenHandler.handle(f)
      }
    });
    return self
  end
    
  # Close the server. This will close any currently open connections.
  def close 
    this.delegate.close();
  end
    
  # Close the server. This will close any currently open connections. The event handler {@code done} will be called
  # when the close is complete.
  def close completionHandler
    this.delegate.close(completionHandler);
  end
    
  # The actual port the server is listening on. This is useful if you bound the server specifying 0 as port number
  # signifying an ephemeral port
  def actualPort 
    ret = this.delegate.actualPort();
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    NetServer.new(arg)
  end
end
