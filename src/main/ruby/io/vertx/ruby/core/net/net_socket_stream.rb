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
java_import io.vertx.jruby.core.streams.ReadStream
java_import io.vertx.core.Handler
#
# A {@link io.vertx.core.streams.ReadStream} of {@link io.vertx.core.net.NetSocket}, used for notifying
# socket connections to a {@link io.vertx.core.net.NetServer}.
#
# @author <a href="mailto:julien@julienviet.com">Julien Viet</a>
#
class NetSocketStream 
include ReadStream<NetSocket>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def exceptionHandler handler
    this.delegate.exceptionHandler(handler);
    return self
  end
    
  def handler handler
    this.delegate.handler(new Handler<io.vertx.core.net.NetSocket>() {
      public void handle(io.vertx.core.net.NetSocket event) {
        handler.handle(NetSocket.FACTORY.call(event));
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

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    NetSocketStream.new(arg)
  end
end
