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
# Represents properties of the file system.<p>
# Instances of FileSystemProps are thread-safe.<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class FileSystemProps
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # The total space on the file system, in bytes
  def totalSpace 
    ret = this.delegate.totalSpace();
    ret
  end
    
  # The total un-allocated space on the file system, in bytes
  def unallocatedSpace 
    ret = this.delegate.unallocatedSpace();
    ret
  end
    
  # The total usable space on the file system, in bytes
  def usableSpace 
    ret = this.delegate.usableSpace();
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    FileSystemProps.new(arg)
  end
end
