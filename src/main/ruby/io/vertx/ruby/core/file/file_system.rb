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
java_import java.util.List
java_import io.vertx.jruby.core.buffer.Buffer
java_import io.vertx.core.file.OpenOptions
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
#
# Contains a broad set of operations for manipulating files.<p>
# A blocking and non blocking version of each operation is provided.<p>
# The non blocking versions take a handler which is called when the operation completes or an error occurs.<p>
# The blocking versions return the results, or throw exceptions directly.<p>
# It is highly recommended the non blocking versions are used unless you are sure the operation
# will not block for a significant period of time.<p>
# Instances of FileSystem are thread-safe.<p>
# @author <a href="http://tfox.org">Tim Fox</a>
#
class FileSystem
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # Copy a file from the path {@code from} to path {@code to}, asynchronously.<p>
  # The copy will fail if the destination already exists.<p>
  def copy from, to, handler
    this.delegate.copy(from, to, handler);
    return self
  end
    
  # Blocking version of {@link #copy(String, String, Handler)}
  def copyBlocking from, to
    this.delegate.copyBlocking(from, to);
    return self
  end
    
  # Copy a file from the path {@code from} to path {@code to}, asynchronously.<p>
  # If {@code recursive} is {@code true} and {@code from} represents a directory, then the directory and its contents
  # will be copied recursively to the destination {@code to}.<p>
  # The copy will fail if the destination if the destination already exists.<p>
  def copyRecursive from, to, recursive, handler
    this.delegate.copyRecursive(from, to, recursive, handler);
    return self
  end
    
  # Blocking version of {@link #copyRecursive(String, String, boolean, Handler)}
  def copyRecursiveBlocking from, to, recursive
    this.delegate.copyRecursiveBlocking(from, to, recursive);
    return self
  end
    
  # Move a file from the path {@code from} to path {@code to}, asynchronously.<p>
  # The move will fail if the destination already exists.<p>
  def move from, to, handler
    this.delegate.move(from, to, handler);
    return self
  end
    
  # Blocking version of {@link #move(String, String, Handler)}
  def moveBlocking from, to
    this.delegate.moveBlocking(from, to);
    return self
  end
    
  # Truncate the file represented by {@code path} to length {@code len} in bytes, asynchronously.<p>
  # The operation will fail if the file does not exist or {@code len} is less than {@code zero}.
  def truncate path, len, handler
    this.delegate.truncate(path, len, handler);
    return self
  end
    
  # Blocking version of {@link #truncate(String, long, Handler)}
  def truncateBlocking path, len
    this.delegate.truncateBlocking(path, len);
    return self
  end
    
  # Change the permissions on the file represented by {@code path} to {@code perms}, asynchronously.
  # The permission String takes the form rwxr-x--- as
  # specified <a href="http://download.oracle.com/javase/7/docs/api/java/nio/file/attribute/PosixFilePermissions.html">here</a>.<p>
  def chmod path, perms, handler
    this.delegate.chmod(path, perms, handler);
    return self
  end
    
  # Blocking version of {@link #chmod(String, String, Handler) }
  def chmodBlocking path, perms
    this.delegate.chmodBlocking(path, perms);
    return self
  end
    
  # Change the permissions on the file represented by {@code path} to {@code perms}, asynchronously.
  # The permission String takes the form rwxr-x--- as
  # specified in {<a href="http://download.oracle.com/javase/7/docs/api/java/nio/file/attribute/PosixFilePermissions.html">here</a>}.<p>
  # If the file is directory then all contents will also have their permissions changed recursively. Any directory permissions will
  # be set to {@code dirPerms}, whilst any normal file permissions will be set to {@code perms}.<p>
  def chmodRecursive path, perms, dirPerms, handler
    this.delegate.chmodRecursive(path, perms, dirPerms, handler);
    return self
  end
    
  # Blocking version of {@link #chmodRecursive(String, String, String, Handler)}
  def chmodRecursiveBlocking path, perms, dirPerms
    this.delegate.chmodRecursiveBlocking(path, perms, dirPerms);
    return self
  end
    
  # Change the ownership on the file represented by {@code path} to {@code user} and {code group}, asynchronously.

  def chown path, user, group, handler
    this.delegate.chown(path, user, group, handler);
    return self
  end
    
  # Blocking version of {@link #chown(String, String, String, Handler)}

  def chownBlocking path, user, group
    this.delegate.chownBlocking(path, user, group);
    return self
  end
    
  # Obtain properties for the file represented by {@code path}, asynchronously.
  # If the file is a link, the link will be followed.
  def props path, handler
    this.delegate.props(path, new Handler<AsyncResult<io.vertx.core.file.FileProps>>() {
      public void handle(AsyncResult<io.vertx.core.file.FileProps> event) {
        AsyncResult<FileProps> f
        if (event.succeeded()) {
          f = InternalHelper.<FileProps>result(new FileProps(event.result()))
        } else {
          f = InternalHelper.<FileProps>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Blocking version of {@link #props(String, Handler)}
  def propsBlocking path
    ret= FileProps.FACTORY.apply(this.delegate.propsBlocking(path));
    ret
  end
    
  # Obtain properties for the link represented by {@code path}, asynchronously.
  # The link will not be followed.
  def lprops path, handler
    this.delegate.lprops(path, new Handler<AsyncResult<io.vertx.core.file.FileProps>>() {
      public void handle(AsyncResult<io.vertx.core.file.FileProps> event) {
        AsyncResult<FileProps> f
        if (event.succeeded()) {
          f = InternalHelper.<FileProps>result(new FileProps(event.result()))
        } else {
          f = InternalHelper.<FileProps>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Blocking version of {@link #lprops(String, Handler)}
  def lpropsBlocking path
    ret= FileProps.FACTORY.apply(this.delegate.lpropsBlocking(path));
    ret
  end
    
  # Create a hard link on the file system from {@code link} to {@code existing}, asynchronously.
  def link link, existing, handler
    this.delegate.link(link, existing, handler);
    return self
  end
    
  # Blocking version of {@link #link(String, String, Handler)}
  def linkBlocking link, existing
    this.delegate.linkBlocking(link, existing);
    return self
  end
    
  # Create a symbolic link on the file system from {@code link} to {@code existing}, asynchronously.
  def symlink link, existing, handler
    this.delegate.symlink(link, existing, handler);
    return self
  end
    
  # Blocking version of {@link #link(String, String, Handler)}
  def symlinkBlocking link, existing
    this.delegate.symlinkBlocking(link, existing);
    return self
  end
    
  # Unlinks the link on the file system represented by the path {@code link}, asynchronously.
  def unlink link, handler
    this.delegate.unlink(link, handler);
    return self
  end
    
  # Blocking version of {@link #unlink(String, Handler)}
  def unlinkBlocking link
    this.delegate.unlinkBlocking(link);
    return self
  end
    
  # Returns the path representing the file that the symbolic link specified by {@code link} points to, asynchronously.
  def readSymlink link, handler
    this.delegate.readSymlink(link, handler);
    return self
  end
    
  # Blocking version of {@link #readSymlink(String, Handler)}
  def readSymlinkBlocking link
    ret = this.delegate.readSymlinkBlocking(link);
    ret
  end
    
  # Deletes the file represented by the specified {@code path}, asynchronously.
  def delete path, handler
    this.delegate.delete(path, handler);
    return self
  end
    
  # Blocking version of {@link #delete(String, Handler)}
  def deleteBlocking path
    this.delegate.deleteBlocking(path);
    return self
  end
    
  # Deletes the file represented by the specified {@code path}, asynchronously.<p>
  # If the path represents a directory and {@code recursive = true} then the directory and its contents will be
  # deleted recursively.
  def deleteRecursive path, recursive, handler
    this.delegate.deleteRecursive(path, recursive, handler);
    return self
  end
    
  # Blocking version of {@link #deleteRecursive(String, boolean, Handler)}
  def deleteRecursiveBlocking path, recursive
    this.delegate.deleteRecursiveBlocking(path, recursive);
    return self
  end
    
  # Create the directory represented by {@code path}, asynchronously.<p>
  # The operation will fail if the directory already exists.
  def mkdir path, handler
    this.delegate.mkdir(path, handler);
    return self
  end
    
  # Blocking version of {@link #mkdir(String, Handler)}
  def mkdirBlocking path
    this.delegate.mkdirBlocking(path);
    return self
  end
    
  # Create the directory represented by {@code path}, asynchronously.<p>
  # The new directory will be created with permissions as specified by {@code perms}.
  # The permission String takes the form rwxr-x--- as specified
  # in <a href="http://download.oracle.com/javase/7/docs/api/java/nio/file/attribute/PosixFilePermissions.html">here</a>.<p>
  # The operation will fail if the directory already exists.
  def mkdir path, perms, handler
    this.delegate.mkdir(path, perms, handler);
    return self
  end
    
  # Blocking version of {@link #mkdir(String, String, Handler)}
  def mkdirBlocking path, perms
    this.delegate.mkdirBlocking(path, perms);
    return self
  end
    
  # Create the directory represented by {@code path}, asynchronously.<p>
  # If {@code createParents} is set to {@code true} then any non-existent parent directories of the directory
  # will also be created.<p>
  # The operation will fail if the directory already exists.
  def mkdirs path, handler
    this.delegate.mkdirs(path, handler);
    return self
  end
    
  # Blocking version of {@link #mkdirs(String, Handler)}
  def mkdirsBlocking path
    this.delegate.mkdirsBlocking(path);
    return self
  end
    
  # Create the directory represented by {@code path}, asynchronously.<p>
  # The new directory will be created with permissions as specified by {@code perms}.
  # The permission String takes the form rwxr-x--- as specified
  # in <a href="http://download.oracle.com/javase/7/docs/api/java/nio/file/attribute/PosixFilePermissions.html">here</a>.<p>
  # If {@code createParents} is set to {@code true} then any non-existent parent directories of the directory
  # will also be created.<p>
  # The operation will fail if the directory already exists.<p>
  def mkdirs path, perms, handler
    this.delegate.mkdirs(path, perms, handler);
    return self
  end
    
  # Blocking version of {@link #mkdirs(String, String, Handler)}
  def mkdirsBlocking path, perms
    this.delegate.mkdirsBlocking(path, perms);
    return self
  end
    
  # Read the contents of the directory specified by {@code path}, asynchronously.<p>
  # The result is an array of String representing the paths of the files inside the directory.
  def readDir path, handler
    this.delegate.readDir(path, handler);
    return self
  end
    
  # Blocking version of {@link #readDir(String, Handler)}
  def readDirBlocking path
    ret = this.delegate.readDirBlocking(path);
    ret
  end
    
  # Read the contents of the directory specified by {@code path}, asynchronously.<p>
  # The parameter {@code filter} is a regular expression. If {@code filter} is specified then only the paths that
  # match  @{filter}will be returned.<p>
  # The result is an array of String representing the paths of the files inside the directory.
  def readDir path, filter, handler
    this.delegate.readDir(path, filter, handler);
    return self
  end
    
  # Blocking version of {@link #readDir(String, String, Handler)}
  def readDirBlocking path, filter
    ret = this.delegate.readDirBlocking(path, filter);
    ret
  end
    
  # Reads the entire file as represented by the path {@code path} as a {@link Buffer}, asynchronously.<p>
  # Do not user this method to read very large files or you risk running out of available RAM.
  def readFile path, handler
    this.delegate.readFile(path, new Handler<AsyncResult<io.vertx.core.buffer.Buffer>>() {
      public void handle(AsyncResult<io.vertx.core.buffer.Buffer> event) {
        AsyncResult<Buffer> f
        if (event.succeeded()) {
          f = InternalHelper.<Buffer>result(new Buffer(event.result()))
        } else {
          f = InternalHelper.<Buffer>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Blocking version of {@link #readFile(String, Handler)}
  def readFileBlocking path
    ret= Buffer.FACTORY.apply(this.delegate.readFileBlocking(path));
    ret
  end
    
  # Creates the file, and writes the specified {@code Buffer data} to the file represented by the path {@code path},
  # asynchronously.
  def writeFile path, data, handler
    this.delegate.writeFile(path, (io.vertx.core.buffer.Buffer)data.getDelegate(), handler);
    return self
  end
    
  # Blocking version of {@link #writeFile(String, Buffer, Handler)}
  def writeFileBlocking path, data
    this.delegate.writeFileBlocking(path, (io.vertx.core.buffer.Buffer)data.getDelegate());
    return self
  end
    
  # Open the file represented by {@code path}, asynchronously.<p>
  # The file is opened for both reading and writing. If the file does not already exist it will be created.
  # Write operations will not automatically flush to storage.
  def open path, options, handler
    this.delegate.open(path, options != null ? new io.vertx.core.file.OpenOptions(new io.vertx.core.json.JsonObject(options)) : null, new Handler<AsyncResult<io.vertx.core.file.AsyncFile>>() {
      public void handle(AsyncResult<io.vertx.core.file.AsyncFile> event) {
        AsyncResult<AsyncFile> f
        if (event.succeeded()) {
          f = InternalHelper.<AsyncFile>result(new AsyncFile(event.result()))
        } else {
          f = InternalHelper.<AsyncFile>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Blocking version of {@link #open(String, io.vertx.core.file.OpenOptions, Handler)}
  def openBlocking path, options
    ret= AsyncFile.FACTORY.apply(this.delegate.openBlocking(path, options != null ? new io.vertx.core.file.OpenOptions(new io.vertx.core.json.JsonObject(options)) : null));
    ret
  end
    
  # Creates an empty file with the specified {@code path}, asynchronously.
  def createFile path, handler
    this.delegate.createFile(path, handler);
    return self
  end
    
  # Blocking version of {@link #createFile(String, Handler)}
  def createFileBlocking path
    this.delegate.createFileBlocking(path);
    return self
  end
    
  # Creates an empty file with the specified {@code path} and permissions {@code perms}, asynchronously.
  def createFile path, perms, handler
    this.delegate.createFile(path, perms, handler);
    return self
  end
    
  # Blocking version of {@link #createFile(String, String, Handler)}
  def createFileBlocking path, perms
    this.delegate.createFileBlocking(path, perms);
    return self
  end
    
  # Determines whether the file as specified by the path {@code path} exists, asynchronously.
  def exists path, handler
    this.delegate.exists(path, handler);
    return self
  end
    
  # Blocking version of {@link #exists(String, Handler)}
  def existsBlocking path
    ret = this.delegate.existsBlocking(path);
    ret
  end
    
  # Returns properties of the file-system being used by the specified {@code path}, asynchronously.
  def fsProps path, handler
    this.delegate.fsProps(path, new Handler<AsyncResult<io.vertx.core.file.FileSystemProps>>() {
      public void handle(AsyncResult<io.vertx.core.file.FileSystemProps> event) {
        AsyncResult<FileSystemProps> f
        if (event.succeeded()) {
          f = InternalHelper.<FileSystemProps>result(new FileSystemProps(event.result()))
        } else {
          f = InternalHelper.<FileSystemProps>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Blocking version of {@link #fsProps(String, Handler)}
  def fsPropsBlocking path
    ret= FileSystemProps.FACTORY.apply(this.delegate.fsPropsBlocking(path));
    ret
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    FileSystem.new(arg)
  end
end
