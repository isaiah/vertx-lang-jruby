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
#
# A Web Socket frame that represents either text or binary data.
#
# @author <a href="http://www.jboss.org/netty/">The Netty Project</a>
# @author <a href="http://gleamynode.net/">Trustin Lee</a>
# @author <a href="http://tfox.org">Tim Fox</a>
# @version $Rev: 2080 $, $Date: 2010-01-26 18:04:19 +0900 (Tue, 26 Jan 2010) $
#
class WebSocketFrame
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def self.binaryFrame data, isFinal
    ret= WebSocketFrame.FACTORY.apply(io.vertx.core.http.WebSocketFrame.binaryFrame((io.vertx.core.buffer.Buffer)data.getDelegate(), isFinal));
    ret
  end
    
  def self.textFrame str, isFinal
    ret= WebSocketFrame.FACTORY.apply(io.vertx.core.http.WebSocketFrame.textFrame(str, isFinal));
    ret
  end
    
  def self.continuationFrame data, isFinal
    ret= WebSocketFrame.FACTORY.apply(io.vertx.core.http.WebSocketFrame.continuationFrame((io.vertx.core.buffer.Buffer)data.getDelegate(), isFinal));
    ret
  end
    
  # Returns {@code true} if and only if the content of this frame is a string
  # encoded in UTF-8.
  def isText 
    ret = this.delegate.isText();
    ret
  end
    
  # Returns {@code true} if and only if the content of this frame is an
  # arbitrary binary data.
  def isBinary 
    ret = this.delegate.isBinary();
    ret
  end
    
  def isContinuation 
    ret = this.delegate.isContinuation();
    ret
  end
    
  # Converts the content of this frame into a UTF-8 string and returns the
  # converted string.
  def textData 
    if (cached_0 != null) {
      return cached_0;
    }
    ret = this.delegate.textData();
    cached_0 = ret
    ret
  end
    
  def binaryData 
    if (cached_1 != null) {
      return cached_1;
    }
    ret= Buffer.FACTORY.apply(this.delegate.binaryData());
    cached_1 = ret
    ret
  end
    
  # Returns {@code true} if this is the final frame.  This should be {@code true} unless a number of 
  # coninuation frames are expected to follow this frame.
  def isFinal 
    ret = this.delegate.isFinal();
    ret
  end
  private java.lang.String cached_0;
  private Buffer cached_1;

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    WebSocketFrame.new(arg)
  end
end
