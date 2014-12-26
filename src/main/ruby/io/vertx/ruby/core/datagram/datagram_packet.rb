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
java_import io.vertx.jruby.core.buffer.Buffer
java_import io.vertx.jruby.core.net.SocketAddress
#
# A received Datagram packet (UDP) which contains the data and information about the sender of the data itself.
#
# @author <a href="mailto:nmaurer@redhat.com">Norman Maurer</a>
#
class DatagramPacket
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # Returns the {@link io.vertx.core.net.SocketAddress} of the sender that send this {@link io.vertx.core.datagram.DatagramPacket}.
  def sender 
    ret= SocketAddress.FACTORY.apply(this.delegate.sender());
    ret
  end
    
  # Returns the data of the {@link io.vertx.core.datagram.DatagramPacket}
  def data 
    ret= Buffer.FACTORY.apply(this.delegate.data());
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    DatagramPacket.new(arg)
  end
end
