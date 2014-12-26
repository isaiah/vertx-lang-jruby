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
java_import java.util.List
java_import io.vertx.jruby.core.buffer.Buffer
java_import io.vertx.jruby.core.streams.ReadStream
java_import io.vertx.jruby.core.MultiMap
java_import io.vertx.core.Handler
java_import io.vertx.jruby.core.net.NetSocket
#
# Represents a client-side HTTP response.<p>
# An instance is provided to the user via a {@link io.vertx.core.Handler}
# instance that was specified when one of the HTTP method operations, or the
# generic {@link HttpClient#request(String, String, io.vertx.core.Handler)}
# method was called on an instance of {@link HttpClient}.<p>
# It implements {@link io.vertx.core.streams.ReadStream} so it can be used with
# {@link io.vertx.core.streams.Pump} to pump data with flow control.<p>
# Instances of this class are not thread-safe.<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class HttpClientResponse 
include ReadStream<Buffer>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def resume 
    this.delegate.resume();
    return self
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
    
  def endHandler toHandler
    this.delegate.endHandler(endHandler);
    return self
  end
    
  # The HTTP status code of the response
  def statusCode 
    ret = this.delegate.statusCode();
    ret
  end
    
  # The HTTP status message of the response
  def statusMessage 
    ret = this.delegate.statusMessage();
    ret
  end
    
  # @return The HTTP headers
  def headers 
    if (cached_0 != null) {
      return cached_0;
    }
    ret= MultiMap.FACTORY.apply(this.delegate.headers());
    cached_0 = ret
    ret
  end
    
  # @return The HTTP trailers
  def trailers 
    if (cached_1 != null) {
      return cached_1;
    }
    ret= MultiMap.FACTORY.apply(this.delegate.trailers());
    cached_1 = ret
    ret
  end
    
  # @return The Set-Cookie headers (including trailers)
  def cookies 
    if (cached_2 != null) {
      return cached_2;
    }
    ret = this.delegate.cookies();
    cached_2 = ret
    ret
  end
    
  # Convenience method for receiving the entire request body in one piece. This saves the user having to manually
  # set a data and end handler and append the chunks of the body until the whole body received.
  # Don't use this if your request body is large - you could potentially run out of RAM.
  #
  # @param bodyHandler This handler will be called after all the body has been received
  def bodyHandler bodyHandler
    this.delegate.bodyHandler(new Handler<io.vertx.core.buffer.Buffer>() {
      public void handle(io.vertx.core.buffer.Buffer event) {
        bodyHandler.handle(Buffer.FACTORY.call(event));
      }
    });
    return self
  end
    
  # Get a net socket for the underlying connection of this request. USE THIS WITH CAUTION!
  # Writing to the socket directly if you don't know what you're doing can easily break the HTTP protocol
  #
  # One valid use-case for calling this is to receive the {@link io.vertx.core.net.NetSocket} after a HTTP CONNECT was issued to the
  # remote peer and it responded with a status code of 200.
  #
  # @return the net socket
  def netSocket 
    if (cached_3 != null) {
      return cached_3;
    }
    ret= NetSocket.FACTORY.apply(this.delegate.netSocket());
    cached_3 = ret
    ret
  end
  private MultiMap cached_0;
  private MultiMap cached_1;
  private java.util.List<java.lang.String> cached_2;
  private NetSocket cached_3;

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    HttpClientResponse.new(arg)
  end
end
