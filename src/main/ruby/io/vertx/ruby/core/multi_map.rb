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
java_import java.util.Map.Entry
java_import java.util.Set
#
# @author <a href="mailto:nmaurer@redhat.com">Norman Maurer</a>
# @author <a href="http://tfox.org">Tim Fox</a>
#
class MultiMap
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # Returns the value of with the specified name.  If there are
  # more than one values for the specified name, the first value is returned.
  #
  # @param name The name of the header to search
  # @return The first header value or {@code null} if there is no such entry
  def get name
    ret = this.delegate.get(name);
    ret
  end
    
  # Returns the values with the specified name
  #
  # @param name The name to search
  # @return A immutable {@link java.util.List} of values which will be empty if no values
  #         are found
  def getAll name
    ret = this.delegate.getAll(name);
    ret
  end
    
  # Checks to see if there is a value with the specified name
  #
  # @param name The name to search for
  # @return True if at least one entry is found
  def contains name
    ret = this.delegate.contains(name);
    ret
  end
    
  # Return true if empty
  def isEmpty 
    ret = this.delegate.isEmpty();
    ret
  end
    
  # Gets a immutable {@link java.util.Set} of all names
  #
  # @return A {@link java.util.Set} of all names
  def names 
    ret = this.delegate.names();
    ret
  end
    
  # Adds a new value with the specified name and value.
  #
  #
  # @param name The name
  # @param value The value being added
  #
  # @return {@code this}
  def add name, value
    this.delegate.add(name, value);
    return self
  end
    
  # Adds all the entries from another MultiMap to this one
  #
  # @return {@code this}
  def addAll map
    this.delegate.addAll((io.vertx.core.MultiMap)map.getDelegate());
    return self
  end
    
  # Sets a value under the specified name.
  #
  # If there is an existing header with the same name, it is removed.
  #
  # @param name The name
  # @param value The value
  # @return {@code this}
  def set name, value
    this.delegate.set(name, value);
    return self
  end
    
  # Cleans this instance.
  #
  # @return {@code this}
  def setAll map
    this.delegate.setAll((io.vertx.core.MultiMap)map.getDelegate());
    return self
  end
    
  # Removes the value with the given name
  #
  # @param name The name  of the value to remove
  # @return {@code this}
  def remove name
    this.delegate.remove(name);
    return self
  end
    
  # Removes all
  #
  # @return {@code this}
  def clear 
    this.delegate.clear();
    return self
  end
    
  # Return the number of names.
  def size 
    ret = this.delegate.size();
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    MultiMap.new(arg)
  end
end
