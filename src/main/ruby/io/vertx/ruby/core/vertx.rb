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
java_import io.vertx.jruby.core.datagram.DatagramSocket
java_import io.vertx.jruby.core.http.HttpServer
java_import io.vertx.jruby.core.shareddata.SharedData
java_import io.vertx.jruby.core.eventbus.EventBus
java_import java.util.Map
java_import io.vertx.core.json.JsonObject
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.http.HttpClientOptions
java_import io.vertx.core.datagram.DatagramSocketOptions
java_import io.vertx.jruby.core.net.NetClient
java_import io.vertx.core.VertxOptions
java_import java.util.Set
java_import io.vertx.core.net.NetClientOptions
java_import io.vertx.jruby.core.dns.DnsClient
java_import io.vertx.core.net.NetServerOptions
java_import io.vertx.jruby.core.metrics.Measured
java_import io.vertx.jruby.core.net.NetServer
java_import io.vertx.core.DeploymentOptions
java_import io.vertx.jruby.core.file.FileSystem
java_import io.vertx.core.http.HttpServerOptions
java_import io.vertx.core.Handler
java_import io.vertx.jruby.core.http.HttpClient
#
# The control centre of the Vert.x Core API.<p>
# You should normally only use a single instance of this class throughout your application. If you are running in the
# Vert.x container an instance will be provided to you.<p>
# If you are using Vert.x embedded, you can create an instance using one of the static {@code VertxFactory.newVertx}
# methods.<p>
# This class acts as a factory for TCP/SSL and HTTP/HTTPS servers and clients, SockJS servers, and provides an
# instance of the event bus, file system and shared data classes, as well as methods for setting and cancelling
# timers.<p>
# Instances of this class are thread-safe.<p>
#
# @author <a href="http://tfox.org">Tim Fox</a>
#
class Vertx 
include Measured
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # The metric base name
  #
  # @return the metric base name
  def metricBaseName 
    ret = ((io.vertx.core.metrics.Measured) this.delegate).metricBaseName();
    ret
  end
    
  # Will return the metrics that correspond with this measured object.
  #
  # @return the map of metrics where the key is the name of the metric (excluding the base name) and the value is
  # the json data representing that metric
  def metrics 
    ret = ((io.vertx.core.metrics.Measured) this.delegate).metrics()?.collectEntries({k, v -> [k, v.getMap()]});
    ret
  end
    
  def self.vertx 
    ret= Vertx.FACTORY.apply(io.vertx.core.Vertx.vertx());
    ret
  end
    
  def self.vertx options
    ret= Vertx.FACTORY.apply(io.vertx.core.Vertx.vertx(options != null ? new io.vertx.core.VertxOptions(new io.vertx.core.json.JsonObject(options)) : null));
    ret
  end
    
  def self.clusteredVertx options = {}, resultHandler
    io.vertx.core.Vertx.clusteredVertx(options != null ? new io.vertx.core.VertxOptions(new io.vertx.core.json.JsonObject(options)) : null, new Handler<AsyncResult<io.vertx.core.Vertx>>() {
      public void handle(AsyncResult<io.vertx.core.Vertx> event) {
        AsyncResult<Vertx> f
        if (event.succeeded()) {
          f = InternalHelper.<Vertx>result(new Vertx(event.result()))
        } else {
          f = InternalHelper.<Vertx>failure(event.cause())
        }
        resultHandler.handle(f)
      }
    });
  end
    
  # Gets the current context
  # @return The current context or null if no current context
  def self.currentContext 
    ret= Context.FACTORY.apply(io.vertx.core.Vertx.currentContext());
    ret
  end
    
  # Gets the current context, or creates one if there isn't one
  # @return The current context (created if didn't exist)
  def getOrCreateContext 
    ret= Context.FACTORY.apply(this.delegate.getOrCreateContext());
    ret
  end
    
  # Create a TCP/SSL server
  def createNetServer options = {}
    ret= NetServer.FACTORY.apply(this.delegate.createNetServer(options != null ? new io.vertx.core.net.NetServerOptions(new io.vertx.core.json.JsonObject(options)) : null));
    ret
  end
    
  # Create a TCP/SSL client
  def createNetClient options = {}
    ret= NetClient.FACTORY.apply(this.delegate.createNetClient(options != null ? new io.vertx.core.net.NetClientOptions(new io.vertx.core.json.JsonObject(options)) : null));
    ret
  end
    
  # Create an HTTP/HTTPS server
  def createHttpServer options = {}
    ret= HttpServer.FACTORY.apply(this.delegate.createHttpServer(options != null ? new io.vertx.core.http.HttpServerOptions(new io.vertx.core.json.JsonObject(options)) : null));
    ret
  end
    
  # Create a HTTP/HTTPS client
  def createHttpClient options = {}
    ret= HttpClient.FACTORY.apply(this.delegate.createHttpClient(options != null ? new io.vertx.core.http.HttpClientOptions(new io.vertx.core.json.JsonObject(options)) : null));
    ret
  end
    
  def createDatagramSocket options = {}
    ret= DatagramSocket.FACTORY.apply(this.delegate.createDatagramSocket(options != null ? new io.vertx.core.datagram.DatagramSocketOptions(new io.vertx.core.json.JsonObject(options)) : null));
    ret
  end
    
  # The File system object
  def fileSystem 
    if (cached_0 != null) {
      return cached_0;
    }
    ret= FileSystem.FACTORY.apply(this.delegate.fileSystem());
    cached_0 = ret
    ret
  end
    
  # The event bus
  def eventBus 
    if (cached_1 != null) {
      return cached_1;
    }
    ret= EventBus.FACTORY.apply(this.delegate.eventBus());
    cached_1 = ret
    ret
  end
    
  # Return the {@link DnsClient}
  def createDnsClient port, host
    ret= DnsClient.FACTORY.apply(this.delegate.createDnsClient(port, host));
    ret
  end
    
  # The shared data object
  def sharedData 
    if (cached_2 != null) {
      return cached_2;
    }
    ret= SharedData.FACTORY.apply(this.delegate.sharedData());
    cached_2 = ret
    ret
  end
    
  # Set a one-shot timer to fire after {@code delay} milliseconds, at which point {@code handler} will be called with
  # the id of the timer.
  #
  # @return the unique ID of the timer
  def setTimer delay, handler
    ret = this.delegate.setTimer(delay, handler);
    ret
  end
    
  # Returns a one-shot timer as a read stream. The timer will be fired after {@code delay} milliseconds after
  # the {@link ReadStream#handler} has been called.
  #
  # @return the timer stream
  def timerStream delay
    ret= TimeoutStream.FACTORY.apply(this.delegate.timerStream(delay));
    ret
  end
    
  # Set a periodic timer to fire every {@code delay} milliseconds, at which point {@code handler} will be called with
  # the id of the timer.
  # @return the unique ID of the timer
  def setPeriodic delay, handler
    ret = this.delegate.setPeriodic(delay, handler);
    ret
  end
    
  # Returns a periodic timer as a read stream. The timer will be fired every {@code delay} milliseconds after
  # the {@link ReadStream#handler} has been called.
  #
  # @return the periodic stream
  def periodicStream delay
    ret= TimeoutStream.FACTORY.apply(this.delegate.periodicStream(delay));
    ret
  end
    
  # Cancel the timer with the specified {@code id}. Returns {@code} true if the timer was successfully cancelled, or
  # {@code false} if the timer does not exist.
  def cancelTimer id
    ret = this.delegate.cancelTimer(id);
    ret
  end
    
  # Put the handler on the event queue for the current loop (or worker context) so it will be run asynchronously ASAP after this event has
  # been processed
  def runOnContext action
    this.delegate.runOnContext(action);
  end
    
  # Stop the eventbus and any resource managed by the eventbus.
  def close 
    this.delegate.close();
  end
    
  # Stop the eventbus and any resource managed by the eventbus.
  def close completionHandler
    this.delegate.close(completionHandler);
  end
    
  def deployVerticle identifier
    this.delegate.deployVerticle(identifier);
  end
    
  def deployVerticle identifier, completionHandler
    this.delegate.deployVerticle(identifier, completionHandler);
  end
    
  def deployVerticle identifier, options
    this.delegate.deployVerticle(identifier, options != null ? new io.vertx.core.DeploymentOptions(new io.vertx.core.json.JsonObject(options)) : null);
  end
    
  def deployVerticle identifier, options, completionHandler
    this.delegate.deployVerticle(identifier, options != null ? new io.vertx.core.DeploymentOptions(new io.vertx.core.json.JsonObject(options)) : null, completionHandler);
  end
    
  def undeployVerticle deploymentID
    this.delegate.undeployVerticle(deploymentID);
  end
    
  def undeployVerticle deploymentID, completionHandler
    this.delegate.undeployVerticle(deploymentID, completionHandler);
  end
    
  def deployments 
    ret = this.delegate.deployments();
    ret
  end
    
  def executeBlocking blockingCodeHandler, resultHandler
    this.delegate.executeBlocking(new Handler<io.vertx.core.Future<java.lang.Object>>() {
      public void handle(io.vertx.core.Future<java.lang.Object> event) {
        blockingCodeHandler.handle(Future.FACTORY.call(event));
      }
    }, new Handler<AsyncResult<Object>>() {
      public void handle(AsyncResult<Object> event) {
        AsyncResult<Object> f
        if (event.succeeded()) {
          f = InternalHelper.<Object>result(InternalHelper.wrapObject(event.result()))
        } else {
          f = InternalHelper.<Object>failure(event.cause())
        }
        resultHandler.handle(f)
      }
    });
  end
  private FileSystem cached_0;
  private EventBus cached_1;
  private SharedData cached_2;

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    Vertx.new(arg)
  end
end
