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
java_import io.vertx.core.shareddata.impl.ClusterSerializable
#
# A Buffer represents a sequence of zero or more bytes that can be written to or read from, and which expands as
# necessary to accommodate any bytes written to it.<p>
# There are two ways to write data to a Buffer: The first method involves methods that take the form {@code setXXX}.
# These methods write data into the buffer starting at the specified position. The position does not have to be inside data that
# has already been written to the buffer; the buffer will automatically expand to encompass the position plus any data that needs
# to be written. All positions are measured in bytes and start with zero.<p>
# The second method involves methods that take the form {@code appendXXX}; these methods append data
# at the end of the buffer.<p>
# Methods exist to both {@code set} and {@code append} all primitive types, {@link String}, {@link java.nio.ByteBuffer} and
# other instances of Buffer.<p>
# Data can be read from a buffer by invoking methods which take the form {@code getXXX}. These methods take a parameter
# representing the position in the Buffer from where to read data.<p>
# Once a buffer has been written to a socket or other write stream, the same buffer instance can't be written again to another WriteStream.<p>
# Instances of this class are not thread-safe.<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class Buffer
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  def self.buffer 
    ret= Buffer.FACTORY.apply(io.vertx.core.buffer.Buffer.buffer());
    ret
  end
    
  def self.buffer initialSizeHint
    ret= Buffer.FACTORY.apply(io.vertx.core.buffer.Buffer.buffer(initialSizeHint));
    ret
  end
    
  def self.buffer string
    ret= Buffer.FACTORY.apply(io.vertx.core.buffer.Buffer.buffer(string));
    ret
  end
    
  def self.buffer string, enc
    ret= Buffer.FACTORY.apply(io.vertx.core.buffer.Buffer.buffer(string, enc));
    ret
  end
    
  # Returns a {@code String} representation of the Buffer with the encoding specified by {@code enc}
  def toString enc
    ret = this.delegate.toString(enc);
    ret
  end
    
  # Returns the {@code byte} at position {@code pos} in the Buffer.
  #
  # @throws IndexOutOfBoundsException if the specified {@code pos} is less than {@code 0} or {@code pos + 1} is greater than the length of the Buffer.
  def getByte pos
    ret = this.delegate.getByte(pos);
    ret
  end
    
  # Returns the {@code int} at position {@code pos} in the Buffer.
  #
  # @throws IndexOutOfBoundsException if the specified {@code pos} is less than {@code 0} or {@code pos + 4} is greater than the length of the Buffer.
  def getInt pos
    ret = this.delegate.getInt(pos);
    ret
  end
    
  # Returns the {@code long} at position {@code pos} in the Buffer.
  #
  # @throws IndexOutOfBoundsException if the specified {@code pos} is less than {@code 0} or {@code pos + 8} is greater than the length of the Buffer.
  def getLong pos
    ret = this.delegate.getLong(pos);
    ret
  end
    
  # Returns the {@code double} at position {@code pos} in the Buffer.
  #
  # @throws IndexOutOfBoundsException if the specified {@code pos} is less than {@code 0} or {@code pos + 8} is greater than the length of the Buffer.
  def getDouble pos
    ret = this.delegate.getDouble(pos);
    ret
  end
    
  # Returns the {@code float} at position {@code pos} in the Buffer.
  #
  # @throws IndexOutOfBoundsException if the specified {@code pos} is less than {@code 0} or {@code pos + 4} is greater than the length of the Buffer.
  def getFloat pos
    ret = this.delegate.getFloat(pos);
    ret
  end
    
  # Returns the {@code short} at position {@code pos} in the Buffer.
  #
  # @throws IndexOutOfBoundsException if the specified {@code pos} is less than {@code 0} or {@code pos + 2} is greater than the length of the Buffer.
  def getShort pos
    ret = this.delegate.getShort(pos);
    ret
  end
    
  # Returns a copy of a sub-sequence the Buffer as a {@link io.vertx.core.buffer.Buffer} starting at position {@code start}
  # and ending at position {@code end - 1}
  def getBuffer from, to
    ret= Buffer.FACTORY.apply(this.delegate.getBuffer(from, to));
    ret
  end
    
  # Returns a copy of a sub-sequence the Buffer as a {@code String} starting at position {@code start}
  # and ending at position {@code end - 1} interpreted as a String in the specified encoding
  def getString from, to, enc
    ret = this.delegate.getString(from, to, enc);
    ret
  end
    
  # Returns a copy of a sub-sequence the Buffer as a {@code String} starting at position {@code start}
  # and ending at position {@code end - 1} interpreted as a String in UTF-8 encoding
  def getString from, to
    ret = this.delegate.getString(from, to);
    ret
  end
    
  # Appends the specified {@code Buffer} to the end of this Buffer. The buffer will expand as necessary to accommodate
  # any bytes written.<p>
  # Returns a reference to {@code this} so multiple operations can be appended together.
  def appendBuffer buff
    this.delegate.appendBuffer((io.vertx.core.buffer.Buffer)buff.getDelegate());
    return self
  end
    
  # Appends the specified {@code Buffer} starting at the {@code offset} using {@code len} to the end of this Buffer. The buffer will expand as necessary to accommodate
  # any bytes written.<p>
  # Returns a reference to {@code this} so multiple operations can be appended together.
  def appendBuffer buff, offset, len
    this.delegate.appendBuffer((io.vertx.core.buffer.Buffer)buff.getDelegate(), offset, len);
    return self
  end
    
  # Appends the specified {@code byte} to the end of the Buffer. The buffer will expand as necessary to accommodate any bytes written.<p>
  # Returns a reference to {@code this} so multiple operations can be appended together.
  def appendByte b
    this.delegate.appendByte(b);
    return self
  end
    
  # Appends the specified {@code int} to the end of the Buffer. The buffer will expand as necessary to accommodate any bytes written.<p>
  # Returns a reference to {@code this} so multiple operations can be appended together.
  def appendInt i
    this.delegate.appendInt(i);
    return self
  end
    
  # Appends the specified {@code long} to the end of the Buffer. The buffer will expand as necessary to accommodate any bytes written.<p>
  # Returns a reference to {@code this} so multiple operations can be appended together.
  def appendLong l
    this.delegate.appendLong(l);
    return self
  end
    
  # Appends the specified {@code short} to the end of the Buffer.The buffer will expand as necessary to accommodate any bytes written.<p>
  # Returns a reference to {@code this} so multiple operations can be appended together.
  def appendShort s
    this.delegate.appendShort(s);
    return self
  end
    
  # Appends the specified {@code float} to the end of the Buffer. The buffer will expand as necessary to accommodate any bytes written.<p>
  # Returns a reference to {@code this} so multiple operations can be appended together.
  def appendFloat f
    this.delegate.appendFloat(f);
    return self
  end
    
  # Appends the specified {@code double} to the end of the Buffer. The buffer will expand as necessary to accommodate any bytes written.<p>
  # Returns a reference to {@code this} so multiple operations can be appended together.
  def appendDouble d
    this.delegate.appendDouble(d);
    return self
  end
    
  # Appends the specified {@code String} to the end of the Buffer with the encoding as specified by {@code enc}.<p>
  # The buffer will expand as necessary to accommodate any bytes written.<p>
  # Returns a reference to {@code this} so multiple operations can be appended together.<p>
  def appendString str, enc
    this.delegate.appendString(str, enc);
    return self
  end
    
  # Appends the specified {@code String str} to the end of the Buffer with UTF-8 encoding.<p>
  # The buffer will expand as necessary to accommodate any bytes written.<p>
  # Returns a reference to {@code this} so multiple operations can be appended together<p>
  def appendString str
    this.delegate.appendString(str);
    return self
  end
    
  # Sets the {@code byte} at position {@code pos} in the Buffer to the value {@code b}.<p>
  # The buffer will expand as necessary to accommodate any value written.
  def setByte pos, b
    this.delegate.setByte(pos, b);
    return self
  end
    
  # Sets the {@code int} at position {@code pos} in the Buffer to the value {@code i}.<p>
  # The buffer will expand as necessary to accommodate any value written.
  def setInt pos, i
    this.delegate.setInt(pos, i);
    return self
  end
    
  # Sets the {@code long} at position {@code pos} in the Buffer to the value {@code l}.<p>
  # The buffer will expand as necessary to accommodate any value written.
  def setLong pos, l
    this.delegate.setLong(pos, l);
    return self
  end
    
  # Sets the {@code double} at position {@code pos} in the Buffer to the value {@code d}.<p>
  # The buffer will expand as necessary to accommodate any value written.
  def setDouble pos, d
    this.delegate.setDouble(pos, d);
    return self
  end
    
  # Sets the {@code float} at position {@code pos} in the Buffer to the value {@code f}.<p>
  # The buffer will expand as necessary to accommodate any value written.
  def setFloat pos, f
    this.delegate.setFloat(pos, f);
    return self
  end
    
  # Sets the {@code short} at position {@code pos} in the Buffer to the value {@code s}.<p>
  # The buffer will expand as necessary to accommodate any value written.
  def setShort pos, s
    this.delegate.setShort(pos, s);
    return self
  end
    
  # Sets the bytes at position {@code pos} in the Buffer to the bytes represented by the {@code Buffer b}.<p>
  # The buffer will expand as necessary to accommodate any value written.
  def setBuffer pos, b
    this.delegate.setBuffer(pos, (io.vertx.core.buffer.Buffer)b.getDelegate());
    return self
  end
    
  # Sets the bytes at position {@code pos} in the Buffer to the bytes represented by the {@code Buffer b} on the given {@code offset} and {@code len}.<p>
  # The buffer will expand as necessary to accommodate any value written.
  def setBuffer pos, b, offset, len
    this.delegate.setBuffer(pos, (io.vertx.core.buffer.Buffer)b.getDelegate(), offset, len);
    return self
  end
    
  # Sets the bytes at position {@code pos} in the Buffer to the value of {@code str} encoded in UTF-8.<p>
  # The buffer will expand as necessary to accommodate any value written.
  def setString pos, str
    this.delegate.setString(pos, str);
    return self
  end
    
  # Sets the bytes at position {@code pos} in the Buffer to the value of {@code str} encoded in encoding {@code enc}.<p>
  # The buffer will expand as necessary to accommodate any value written.
  def setString pos, str, enc
    this.delegate.setString(pos, str, enc);
    return self
  end
    
  # Returns the length of the buffer, measured in bytes.
  # All positions are indexed from zero.
  def length 
    ret = this.delegate.length();
    ret
  end
    
  # Returns a copy of the entire Buffer.
  def copy 
    ret= Buffer.FACTORY.apply(this.delegate.copy());
    ret
  end
    
  # Returns a slice of this buffer. Modifying the content
  # of the returned buffer or this buffer affects each other's content
  # while they maintain separate indexes and marks.
  def slice 
    ret= Buffer.FACTORY.apply(this.delegate.slice());
    ret
  end
    
  # Returns a slice of this buffer. Modifying the content
  # of the returned buffer or this buffer affects each other's content
  # while they maintain separate indexes and marks.
  def slice from, to
    ret= Buffer.FACTORY.apply(this.delegate.slice(from, to));
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    Buffer.new(arg)
  end
end
