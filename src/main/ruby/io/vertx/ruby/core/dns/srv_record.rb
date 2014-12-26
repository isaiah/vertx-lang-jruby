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
# Represent a Service-Record (SRV) which was resolved for a domain.
#
# @author <a href="mailto:nmaurer@redhat.com">Norman Maurer</a>
#
class SrvRecord
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # Returns the priority for this service record.
  def priority 
    ret = this.delegate.priority();
    ret
  end
    
  # Returns the weight of this service record.
  def weight 
    ret = this.delegate.weight();
    ret
  end
    
  # Returns the port the service is running on.
  def port 
    ret = this.delegate.port();
    ret
  end
    
  # Returns the name for the server being queried.
  def name 
    ret = this.delegate.name();
    ret
  end
    
  # Returns the protocol for the service being queried (i.e. "_tcp").
  def protocol 
    ret = this.delegate.protocol();
    ret
  end
    
  # Returns the service's name (i.e. "_http").
  def service 
    ret = this.delegate.service();
    ret
  end
    
  # Returns the name of the host for the service.
  def target 
    ret = this.delegate.target();
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    SrvRecord.new(arg)
  end
end
