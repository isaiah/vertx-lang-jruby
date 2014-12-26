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
java_import io.vertx.core.Handler
#
# Represents a stream of data.<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
module StreamBase
  public Object getDelegate();
  def exceptionHandler(handler);end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    StreamBaseImpl.new(arg)
  end
end

class StreamBaseImpl implements StreamBase
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # Set an exception handler.
  def exceptionHandler handler
    ((io.vertx.core.streams.StreamBase) this.delegate).exceptionHandler(handler);
    return self
  end
end
