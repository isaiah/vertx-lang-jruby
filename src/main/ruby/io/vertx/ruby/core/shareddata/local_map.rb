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
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class LocalMap<K,V>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def get key
    #This cast is cleary flawed
    ret = (V) InternalHelper.wrapObject(((io.vertx.core.shareddata.LocalMap) this.delegate).get(InternalHelper.unwrapObject(key)));
    ret
  end
    
  def put key, value
    #This cast is cleary flawed
    ret = (V) InternalHelper.wrapObject(((io.vertx.core.shareddata.LocalMap) this.delegate).put(InternalHelper.unwrapObject(key), InternalHelper.unwrapObject(value)));
    ret
  end
    
  def remove key
    #This cast is cleary flawed
    ret = (V) InternalHelper.wrapObject(((io.vertx.core.shareddata.LocalMap) this.delegate).remove(InternalHelper.unwrapObject(key)));
    ret
  end
    
  def clear 
    ((io.vertx.core.shareddata.LocalMap) this.delegate).clear();
  end
    
  def size 
    ret = ((io.vertx.core.shareddata.LocalMap) this.delegate).size();
    ret
  end
    
  def isEmpty 
    ret = ((io.vertx.core.shareddata.LocalMap) this.delegate).isEmpty();
    ret
  end
    
  def putIfAbsent key, value
    #This cast is cleary flawed
    ret = (V) InternalHelper.wrapObject(((io.vertx.core.shareddata.LocalMap) this.delegate).putIfAbsent(InternalHelper.unwrapObject(key), InternalHelper.unwrapObject(value)));
    ret
  end
    
  def removeIfPresent key, value
    ret = ((io.vertx.core.shareddata.LocalMap) this.delegate).removeIfPresent(InternalHelper.unwrapObject(key), InternalHelper.unwrapObject(value));
    ret
  end
    
  def replaceIfPresent key, oldValue, newValue
    ret = ((io.vertx.core.shareddata.LocalMap) this.delegate).replaceIfPresent(InternalHelper.unwrapObject(key), InternalHelper.unwrapObject(oldValue), InternalHelper.unwrapObject(newValue));
    ret
  end
    
  def replace key, value
    #This cast is cleary flawed
    ret = (V) InternalHelper.wrapObject(((io.vertx.core.shareddata.LocalMap) this.delegate).replace(InternalHelper.unwrapObject(key), InternalHelper.unwrapObject(value)));
    ret
  end
    
  def close 
    ((io.vertx.core.shareddata.LocalMap) this.delegate).close();
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    LocalMap.new(arg)
  end
end
