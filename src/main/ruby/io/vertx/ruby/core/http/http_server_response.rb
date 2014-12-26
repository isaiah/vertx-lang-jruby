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
java_import io.vertx.jruby.core.streams.WriteStream
java_import io.vertx.jruby.core.MultiMap
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
#
# Represents a server-side HTTP response.<p>
# Instances of this class are created and associated to every instance of
# {@link HttpServerRequest} that is created.<p>
# It allows the developer to control the HTTP response that is sent back to the
# client for a particular HTTP request. It contains methods that allow HTTP
# headers and trailers to be set, and for a body to be written out to the response.<p>
# It also allows files to be streamed by the kernel directly from disk to the
# outgoing HTTP connection, bypassing user space altogether (where supported by
# the underlying operating system). This is a very efficient way of
# serving files from the server since buffers do not have to be read one by one
# from the file and written to the outgoing socket.<p>
# It implements {@link io.vertx.core.streams.WriteStream} so it can be used with
# {@link io.vertx.core.streams.Pump} to pump data with flow control.<p>
# Instances of this class are not thread-safe<p>
# @author <a href="http://tfox.org">Tim Fox</a>
#
class HttpServerResponse 
include WriteStream<Buffer>
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # This will return {@code true} if there are more bytes in the write queue than the value set using {@link
  # #setWriteQueueMaxSize}
  def writeQueueFull 
    ret = ((io.vertx.core.streams.WriteStream) this.delegate).writeQueueFull();
    ret
  end
    
  def exceptionHandler handler
    this.delegate.exceptionHandler(handler);
    return self
  end
    
  def write data
    this.delegate.write((io.vertx.core.buffer.Buffer)data.getDelegate());
    return self
  end
    
  def setWriteQueueMaxSize maxSize
    this.delegate.setWriteQueueMaxSize(maxSize);
    return self
  end
    
  def drainHandler handler
    this.delegate.drainHandler(handler);
    return self
  end
    
  # The HTTP status code of the response. The default is {@code 200} representing {@code OK}.
  def getStatusCode 
    ret = this.delegate.getStatusCode();
    ret
  end
    
  # Set the status code
  # @return A reference to this, so multiple method calls can be chained.
  def setStatusCode statusCode
    this.delegate.setStatusCode(statusCode);
    return self
  end
    
  # The HTTP status message of the response. If this is not specified a default value will be used depending on what
  # {@link #setStatusCode} has been set to.
  def getStatusMessage 
    ret = this.delegate.getStatusMessage();
    ret
  end
    
  # Set the status message
  # @return A reference to this, so multiple method calls can be chained.
  def setStatusMessage statusMessage
    this.delegate.setStatusMessage(statusMessage);
    return self
  end
    
  # If {@code chunked} is {@code true}, this response will use HTTP chunked encoding, and each call to write to the body
  # will correspond to a new HTTP chunk sent on the wire.<p>
  # If chunked encoding is used the HTTP header {@code Transfer-Encoding} with a value of {@code Chunked} will be
  # automatically inserted in the response.<p>
  # If {@code chunked} is {@code false}, this response will not use HTTP chunked encoding, and therefore if any data is written the
  # body of the response, the total size of that data must be set in the {@code Content-Length} header <b>before</b> any
  # data is written to the response body.<p>
  # An HTTP chunked response is typically used when you do not know the total size of the request body up front.
  #
  # @return A reference to this, so multiple method calls can be chained.
  def setChunked chunked
    this.delegate.setChunked(chunked);
    return self
  end
    
  # Is the response chunked?
  def isChunked 
    ret = this.delegate.isChunked();
    ret
  end
    
  # @return The HTTP headers
  def headers 
    if (cached_0 != null) {
      return cached_0;
    }
    ret= MultiMap.FACTORY.apply(this.delegate.headers());
    cached_0 = ret
    ret
  end
    
  # Put an HTTP header - fluent API
  # @param name The header name
  # @param value The header value.
  # @return A reference to this, so multiple method calls can be chained.
  def putHeader name, value
    this.delegate.putHeader(name, value);
    return self
  end
    
  # @return The HTTP trailers
  def trailers 
    if (cached_1 != null) {
      return cached_1;
    }
    ret= MultiMap.FACTORY.apply(this.delegate.trailers());
    cached_1 = ret
    ret
  end
    
  # Put an HTTP trailer - fluent API
  # @param name The trailer name
  # @param value The trailer value
  # @return A reference to this, so multiple method calls can be chained.
  def putTrailer name, value
    this.delegate.putTrailer(name, value);
    return self
  end
    
  # Set a close handler for the response. This will be called if the underlying connection closes before the response
  # is complete.
  # @param handler
  def closeHandler handler
    this.delegate.closeHandler(handler);
    return self
  end
    
  # Write a {@link String} to the response body, encoded using the encoding {@code enc}.
  #
  # @return A reference to this, so multiple method calls can be chained.
  def write chunk, enc
    this.delegate.write(chunk, enc);
    return self
  end
    
  # Write a {@link String} to the response body, encoded in UTF-8.
  #
  # @return A reference to this, so multiple method calls can be chained.
  def write chunk
    this.delegate.write(chunk);
    return self
  end
    
  # Same as {@link #end(Buffer)} but writes a String with the default encoding before ending the response.
  def end chunk
    this.delegate.end(chunk);
  end
    
  # Same as {@link #end(Buffer)} but writes a String with the specified encoding before ending the response.
  def end chunk, enc
    this.delegate.end(chunk, enc);
  end
    
  # Same as {@link #end()} but writes some data to the response body before ending. If the response is not chunked and
  # no other data has been written then the Content-Length header will be automatically set
  def end chunk
    this.delegate.end((io.vertx.core.buffer.Buffer)chunk.getDelegate());
  end
    
  # Ends the response. If no data has been written to the response body,
  # the actual response won't get written until this method gets called.<p>
  # Once the response has ended, it cannot be used any more.
  def end 
    this.delegate.end();
  end
    
  # Tell the kernel to stream a file as specified by {@code filename} directly
  # from disk to the outgoing connection, bypassing userspace altogether
  # (where supported by the underlying operating system.
  # This is a very efficient way to serve files.<p>
  def sendFile filename
    this.delegate.sendFile(filename);
    return self
  end
    
  def sendFile filename, resultHandler
    this.delegate.sendFile(filename, resultHandler);
    return self
  end
    
  # Close the underlying TCP connection
  def close 
    this.delegate.close();
  end
    
  def ended 
    ret = this.delegate.ended();
    ret
  end
    
  def headWritten 
    ret = this.delegate.headWritten();
    ret
  end
    
  def headersEndHandler handler
    this.delegate.headersEndHandler(handler);
    return self
  end
    
  def bodyEndHandler handler
    this.delegate.bodyEndHandler(handler);
    return self
  end
  private MultiMap cached_0;
  private MultiMap cached_1;

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    HttpServerResponse.new(arg)
  end
end
