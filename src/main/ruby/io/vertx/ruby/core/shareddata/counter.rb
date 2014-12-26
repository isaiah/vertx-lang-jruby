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
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class Counter
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def get resultHandler
    this.delegate.get(resultHandler);
  end
    
  def incrementAndGet resultHandler
    this.delegate.incrementAndGet(resultHandler);
  end
    
  def getAndIncrement resultHandler
    this.delegate.getAndIncrement(resultHandler);
  end
    
  def decrementAndGet resultHandler
    this.delegate.decrementAndGet(resultHandler);
  end
    
  def addAndGet value, resultHandler
    this.delegate.addAndGet(value, resultHandler);
  end
    
  def getAndAdd value, resultHandler
    this.delegate.getAndAdd(value, resultHandler);
  end
    
  def compareAndSet expected, value, resultHandler
    this.delegate.compareAndSet(expected, value, resultHandler);
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    Counter.new(arg)
  end
end
