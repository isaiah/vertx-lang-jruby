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
java_import io.vertx.core.Handler
#
# A {@link io.vertx.core.streams.WriteStream} for sending packets to a {@link io.vertx.core.net.SocketAddress}.
# The stream {@link WriteStream#exceptionHandler} is called when the write fails.
#
# @author <a href="mailto:julien@julienviet.com">Julien Viet</a>
#
class PacketWritestream 
include WriteStream<Buffer>
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

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    PacketWritestream.new(arg)
  end
end
