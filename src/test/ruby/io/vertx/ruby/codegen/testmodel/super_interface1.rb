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
class SuperInterface1
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def superMethodWithBasicParams b, s, i, l, f, d, bool, ch, str
    this.delegate.superMethodWithBasicParams(b, s, i, l, f, d, bool, ch, str);
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    SuperInterface1.new(arg)
  end
end
