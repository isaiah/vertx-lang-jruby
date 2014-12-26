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
# Represents properties of a file on the file system<p>
# Instances of FileProps are thread-safe<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class FileProps
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # The date the file was created
  def creationTime 
    ret = this.delegate.creationTime();
    ret
  end
    
  # The date the file was last accessed
  def lastAccessTime 
    ret = this.delegate.lastAccessTime();
    ret
  end
    
  # The date the file was last modified
  def lastModifiedTime 
    ret = this.delegate.lastModifiedTime();
    ret
  end
    
  # Is the file a directory?
  def isDirectory 
    ret = this.delegate.isDirectory();
    ret
  end
    
  # Is the file some other type? (I.e. not a directory, regular file or symbolic link)
  def isOther 
    ret = this.delegate.isOther();
    ret
  end
    
  # Is the file a regular file?
  def isRegularFile 
    ret = this.delegate.isRegularFile();
    ret
  end
    
  # Is the file a symbolic link?
  def isSymbolicLink 
    ret = this.delegate.isSymbolicLink();
    ret
  end
    
  # The size of the file, in bytes
  def size 
    ret = this.delegate.size();
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    FileProps.new(arg)
  end
end
