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
# Represent a Mail-Exchange-Record (MX) which was resolved for a domain.
#
# @author <a href="mailto:nmaurer@redhat.com">Norman Maurer</a>
#
class MxRecord
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # The priority of the MX record.
  def priority 
    ret = this.delegate.priority();
    ret
  end
    
  # The name of the MX record
  def name 
    ret = this.delegate.name();
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    MxRecord.new(arg)
  end
end
