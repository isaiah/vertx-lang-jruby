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
java_import io.vertx.jruby.core.streams.ReadStream
java_import io.vertx.core.Handler
#
# Represents an upload from an HTML form.<p>
#
# @author <a href="mailto:nmaurer@redhat.com">Norman Maurer</a>
#
class HttpServerFileUpload 
include ReadStream<Buffer>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def exceptionHandler handler
    this.delegate.exceptionHandler(handler);
    return self
  end
    
  def handler handler
    this.delegate.handler(new Handler<io.vertx.core.buffer.Buffer>() {
      public void handle(io.vertx.core.buffer.Buffer event) {
        handler.handle(Buffer.FACTORY.call(event));
      }
    });
    return self
  end
    
  def endHandler toHandler
    this.delegate.endHandler(endHandler);
    return self
  end
    
  def pause 
    this.delegate.pause();
    return self
  end
    
  def resume 
    this.delegate.resume();
    return self
  end
    
  # Stream the content of this upload to the given filename.
  def streamToFileSystem filename
    this.delegate.streamToFileSystem(filename);
    return self
  end
    
  # Returns the filename which was used when upload the file.
  def filename 
    ret = this.delegate.filename();
    ret
  end
    
  # Returns the name of the attribute
  def name 
    ret = this.delegate.name();
    ret
  end
    
  # Returns the contentType for the upload
  def contentType 
    ret = this.delegate.contentType();
    ret
  end
    
  # Returns the contentTransferEncoding for the upload
  def contentTransferEncoding 
    ret = this.delegate.contentTransferEncoding();
    ret
  end
    
  # Returns the charset for the upload
  def charset 
    ret = this.delegate.charset();
    ret
  end
    
  # Returns the size of the upload (in bytes)
  def size 
    ret = this.delegate.size();
    ret
  end
    
  # Returns {@code true} if the size of the upload can be retrieved via {@link #size()}.
  def isSizeAvailable 
    ret = this.delegate.isSizeAvailable();
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    HttpServerFileUpload.new(arg)
  end
end
