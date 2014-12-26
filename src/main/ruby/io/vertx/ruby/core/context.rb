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
java_import io.vertx.core.json.JsonObject
java_import io.vertx.core.Handler
#
# Represents the execution context of a Verticle.
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class Context
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def runOnContext action
    this.delegate.runOnContext(action);
  end
    
  def deploymentID 
    ret = this.delegate.deploymentID();
    ret
  end
    
  def config 
    ret = this.delegate.config()?.getMap();
    ret
  end
    
  def processArgs 
    ret = this.delegate.processArgs();
    ret
  end
    
  def isEventLoopContext 
    ret = this.delegate.isEventLoopContext();
    ret
  end
    
  def isWorker 
    ret = this.delegate.isWorker();
    ret
  end
    
  def isMultiThreaded 
    ret = this.delegate.isMultiThreaded();
    ret
  end
    
  def get key
    #This cast is cleary flawed
    ret = (T) InternalHelper.wrapObject(this.delegate.get(key));
    ret
  end
    
  def put key, value
    this.delegate.put(key, InternalHelper.unwrapObject(value));
  end
    
  def remove key
    ret = this.delegate.remove(key);
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    Context.new(arg)
  end
end
