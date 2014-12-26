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
class Future<T>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def self.future 
    ret= Future.FACTORY.apply(io.vertx.core.Future.future());
    ret
  end
    
  def self.succeededFuture 
    ret= Future.FACTORY.apply(io.vertx.core.Future.succeededFuture());
    ret
  end
    
  def self.succeededFuture result
    ret= Future.FACTORY.apply(io.vertx.core.Future.succeededFuture(InternalHelper.unwrapObject(result)));
    ret
  end
    
  def self.failedFuture failureMessage
    ret= Future.FACTORY.apply(io.vertx.core.Future.failedFuture(failureMessage));
    ret
  end
    
  # Has it completed?
  def isComplete 
    ret = ((io.vertx.core.Future) this.delegate).isComplete();
    ret
  end
    
  # Set a handler for the result. It will get called when it's complete
  def setHandler handler
    ((io.vertx.core.Future) this.delegate).setHandler(new Handler<AsyncResult<Object>>() {
      public void handle(AsyncResult<Object> event) {
        AsyncResult<Object> f
        if (event.succeeded()) {
          f = InternalHelper.<Object>result(InternalHelper.wrapObject(event.result()))
        } else {
          f = InternalHelper.<Object>failure(event.cause())
        }
        handler.handle(f)
      }
    });
  end
    
  # Set the result. Any handler will be called, if there is one
  #
  # @throws IllegalStateException when the future is already completed
  def complete result
    ((io.vertx.core.Future) this.delegate).complete(InternalHelper.unwrapObject(result));
  end
    
  def complete 
    ((io.vertx.core.Future) this.delegate).complete();
  end
    
  def fail failureMessage
    ((io.vertx.core.Future) this.delegate).fail(failureMessage);
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    Future.new(arg)
  end
end
