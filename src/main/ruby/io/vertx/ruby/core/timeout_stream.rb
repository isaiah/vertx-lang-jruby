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
# A timeout stream triggered by a timer, the {@link io.vertx.core.Handler} will be call when the timer is fired,
# it can be once or several times depending on the nature of the timer related to this stream. The
# {@link ReadStream#endHandler(Handler)} will be called after the timer handler has been called.<p>
#
# Pausing the timer inhibits the timer shots until the stream is resumed. Setting a null handler callback cancels
# the timer.
#
# @author <a href="mailto:julien@julienviet.com">Julien Viet</a>
#
class TimeoutStream 
include ReadStream<Long>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def exceptionHandler handler
    this.delegate.exceptionHandler(handler);
    return self
  end
    
  def handler handler
    this.delegate.handler(handler);
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
    
  # Cancels the timeout. Note this has the same effect as calling {@link #handler(Handler)} with a null
  # argument.
  def cancel 
    this.delegate.cancel();
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    TimeoutStream.new(arg)
  end
end
