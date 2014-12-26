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
java_import io.vertx.jruby.core.metrics.Measured
java_import java.util.Map
java_import io.vertx.jruby.core.streams.ReadStream
java_import io.vertx.core.json.JsonObject
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
java_import io.vertx.jruby.core.net.SocketAddress
#
# A Datagram socket which can be used to send {@link DatagramPacket}'s to remote Datagram servers and receive {@link DatagramPacket}s .
#
# Usually you use a Datragram Client to send UDP over the wire. UDP is connection-less which means you are not connected
# to the remote peer in a persistent way. Because of this you have to supply the address and port of the remote peer
# when sending data.
#
# You can send data to ipv4 or ipv6 addresses, which also include multicast addresses.
#
#
# @author <a href="mailto:nmaurer@redhat.com">Norman Maurer</a>
#
class DatagramSocket 
include ReadStream<DatagramPacket>,  Measured
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
    
  # Write the given {@link io.vertx.core.buffer.Buffer} to the {@link io.vertx.core.net.SocketAddress}. The {@link io.vertx.core.Handler} will be notified once the
  # write completes.
  #
  #
  # @param packet    the {@link io.vertx.core.buffer.Buffer} to write
  # @param host      the host address of the remote peer
  # @param port      the host port of the remote peer
  # @param handler   the {@link io.vertx.core.Handler} to notify once the write completes.
  # @return self     itself for method chaining
  def send packet, port, host, handler
    this.delegate.send((io.vertx.core.buffer.Buffer)packet.getDelegate(), port, host, new Handler<AsyncResult<io.vertx.core.datagram.DatagramSocket>>() {
      public void handle(AsyncResult<io.vertx.core.datagram.DatagramSocket> event) {
        AsyncResult<DatagramSocket> f
        if (event.succeeded()) {
          f = InternalHelper.<DatagramSocket>result(new DatagramSocket(event.result()))
        } else {
          f = InternalHelper.<DatagramSocket>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Returns a {@link io.vertx.core.datagram.PacketWritestream} able to send {@link Buffer} to the {@link io.vertx.core.net.SocketAddress}.
  #
  # @param port the host port of the remote peer
  # @param host the host address of the remote peer
  # @return the write stream for sending packets
  def sender port, host
    ret= PacketWritestream.FACTORY.apply(this.delegate.sender(port, host));
    ret
  end
    
  # Write the given {@link String} to the {@link io.vertx.core.net.SocketAddress} using UTF8 encoding. The {@link Handler} will be notified once the
  # write completes.
  #
  #
  # @param str       the {@link String} to write
  # @param host      the host address of the remote peer
  # @param port      the host port of the remote peer
  # @param handler   the {@link io.vertx.core.Handler} to notify once the write completes.
  # @return self     itself for method chaining
  def send str, port, host, handler
    this.delegate.send(str, port, host, new Handler<AsyncResult<io.vertx.core.datagram.DatagramSocket>>() {
      public void handle(AsyncResult<io.vertx.core.datagram.DatagramSocket> event) {
        AsyncResult<DatagramSocket> f
        if (event.succeeded()) {
          f = InternalHelper.<DatagramSocket>result(new DatagramSocket(event.result()))
        } else {
          f = InternalHelper.<DatagramSocket>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Write the given {@link String} to the {@link io.vertx.core.net.SocketAddress} using the given encoding. The {@link Handler} will be notified once the
  # write completes.
  #
  #
  # @param str       the {@link String} to write
  # @param enc       the charset used for encoding
  # @param host      the host address of the remote peer
  # @param port      the host port of the remote peer
  # @param handler   the {@link io.vertx.core.Handler} to notify once the write completes.
  # @return self     itself for method chaining
  def send str, enc, port, host, handler
    this.delegate.send(str, enc, port, host, new Handler<AsyncResult<io.vertx.core.datagram.DatagramSocket>>() {
      public void handle(AsyncResult<io.vertx.core.datagram.DatagramSocket> event) {
        AsyncResult<DatagramSocket> f
        if (event.succeeded()) {
          f = InternalHelper.<DatagramSocket>result(new DatagramSocket(event.result()))
        } else {
          f = InternalHelper.<DatagramSocket>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Close the {@link io.vertx.core.datagram.DatagramSocket} implementation asynchronous and notifies the handler once done.
  def close handler
    this.delegate.close(handler);
  end
    
  # Close the {@link io.vertx.core.datagram.DatagramSocket} implementation asynchronous.
  def close 
    this.delegate.close();
  end
    
  # Return the {@link io.vertx.core.net.SocketAddress} to which this {@link io.vertx.core.datagram.DatagramSocket} is bound too.
  def localAddress 
    if (cached_0 != null) {
      return cached_0;
    }
    ret= SocketAddress.FACTORY.apply(this.delegate.localAddress());
    cached_0 = ret
    ret
  end
    
  # Joins a multicast group and so start listen for packets send to it. The {@link Handler} is notified once the operation completes.
  #
  #
  # @param   multicastAddress  the address of the multicast group to join
  # @param   handler           then handler to notify once the operation completes
  # @return  this              returns itself for method-chaining
  def listenMulticastGroup multicastAddress, handler
    this.delegate.listenMulticastGroup(multicastAddress, new Handler<AsyncResult<io.vertx.core.datagram.DatagramSocket>>() {
      public void handle(AsyncResult<io.vertx.core.datagram.DatagramSocket> event) {
        AsyncResult<DatagramSocket> f
        if (event.succeeded()) {
          f = InternalHelper.<DatagramSocket>result(new DatagramSocket(event.result()))
        } else {
          f = InternalHelper.<DatagramSocket>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Joins a multicast group and so start listen for packets send to it on the given network interface.
  # The {@link Handler} is notified once the operation completes.
  #
  #
  # @param   multicastAddress  the address of the multicast group to join
  # @param   networkInterface  the network interface on which to listen for packets.
  # @param   source            the address of the source for which we will listen for mulicast packets
  # @param   handler           then handler to notify once the operation completes
  # @return  this              returns itself for method-chaining
  def listenMulticastGroup multicastAddress, networkInterface, source, handler
    this.delegate.listenMulticastGroup(multicastAddress, networkInterface, source, new Handler<AsyncResult<io.vertx.core.datagram.DatagramSocket>>() {
      public void handle(AsyncResult<io.vertx.core.datagram.DatagramSocket> event) {
        AsyncResult<DatagramSocket> f
        if (event.succeeded()) {
          f = InternalHelper.<DatagramSocket>result(new DatagramSocket(event.result()))
        } else {
          f = InternalHelper.<DatagramSocket>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Leaves a multicast group and so stop listen for packets send to it.
  # The {@link Handler} is notified once the operation completes.
  #
  #
  # @param   multicastAddress  the address of the multicast group to leave
  # @param   handler           then handler to notify once the operation completes
  # @return  this              returns itself for method-chaining
  def unlistenMulticastGroup multicastAddress, handler
    this.delegate.unlistenMulticastGroup(multicastAddress, new Handler<AsyncResult<io.vertx.core.datagram.DatagramSocket>>() {
      public void handle(AsyncResult<io.vertx.core.datagram.DatagramSocket> event) {
        AsyncResult<DatagramSocket> f
        if (event.succeeded()) {
          f = InternalHelper.<DatagramSocket>result(new DatagramSocket(event.result()))
        } else {
          f = InternalHelper.<DatagramSocket>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Leaves a multicast group and so stop listen for packets send to it on the given network interface.
  # The {@link Handler} is notified once the operation completes.
  #
  #
  # @param   multicastAddress  the address of the multicast group to join
  # @param   networkInterface  the network interface on which to listen for packets.
  # @param   source            the address of the source for which we will listen for mulicast packets
  # @param   handler           then handler to notify once the operation completes
  # @return  this              returns itself for method-chaining
  def unlistenMulticastGroup multicastAddress, networkInterface, source, handler
    this.delegate.unlistenMulticastGroup(multicastAddress, networkInterface, source, new Handler<AsyncResult<io.vertx.core.datagram.DatagramSocket>>() {
      public void handle(AsyncResult<io.vertx.core.datagram.DatagramSocket> event) {
        AsyncResult<DatagramSocket> f
        if (event.succeeded()) {
          f = InternalHelper.<DatagramSocket>result(new DatagramSocket(event.result()))
        } else {
          f = InternalHelper.<DatagramSocket>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Block the given sourceToBlock address for the given multicastAddress and notifies the {@link Handler} once
  # the operation completes.
  #
  #
  # @param   multicastAddress  the address for which you want to block the sourceToBlock
  # @param   sourceToBlock     the source address which should be blocked. You will not receive an multicast packets
  #                            for it anymore.
  # @param   handler           then handler to notify once the operation completes
  # @return  this              returns itself for method-chaining
  def blockMulticastGroup multicastAddress, sourceToBlock, handler
    this.delegate.blockMulticastGroup(multicastAddress, sourceToBlock, new Handler<AsyncResult<io.vertx.core.datagram.DatagramSocket>>() {
      public void handle(AsyncResult<io.vertx.core.datagram.DatagramSocket> event) {
        AsyncResult<DatagramSocket> f
        if (event.succeeded()) {
          f = InternalHelper.<DatagramSocket>result(new DatagramSocket(event.result()))
        } else {
          f = InternalHelper.<DatagramSocket>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Block the given sourceToBlock address for the given multicastAddress on the given network interface and notifies
  # the {@link Handler} once the operation completes.
  #
  #
  # @param   multicastAddress  the address for which you want to block the sourceToBlock
  # @param   networkInterface  the network interface on which the blocking should accour.
  # @param   sourceToBlock     the source address which should be blocked. You will not receive an multicast packets
  #                            for it anymore.
  # @param   handler           then handler to notify once the operation completes
  # @return  this              returns itself for method-chaining
  def blockMulticastGroup multicastAddress, networkInterface, sourceToBlock, handler
    this.delegate.blockMulticastGroup(multicastAddress, networkInterface, sourceToBlock, new Handler<AsyncResult<io.vertx.core.datagram.DatagramSocket>>() {
      public void handle(AsyncResult<io.vertx.core.datagram.DatagramSocket> event) {
        AsyncResult<DatagramSocket> f
        if (event.succeeded()) {
          f = InternalHelper.<DatagramSocket>result(new DatagramSocket(event.result()))
        } else {
          f = InternalHelper.<DatagramSocket>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  def listen port, host, handler
    this.delegate.listen(port, host, new Handler<AsyncResult<io.vertx.core.datagram.DatagramSocket>>() {
      public void handle(AsyncResult<io.vertx.core.datagram.DatagramSocket> event) {
        AsyncResult<DatagramSocket> f
        if (event.succeeded()) {
          f = InternalHelper.<DatagramSocket>result(new DatagramSocket(event.result()))
        } else {
          f = InternalHelper.<DatagramSocket>failure(event.cause())
        }
        handler.handle(f)
      }
    });
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
    
  def endHandler toHandler
    this.delegate.endHandler(endHandler);
    return self
  end
    
  def handler handler
    this.delegate.handler(new Handler<io.vertx.core.datagram.DatagramPacket>() {
      public void handle(io.vertx.core.datagram.DatagramPacket event) {
        handler.handle(DatagramPacket.FACTORY.call(event));
      }
    });
    return self
  end
    
  def exceptionHandler handler
    this.delegate.exceptionHandler(handler);
    return self
  end
  private SocketAddress cached_0;

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    DatagramSocket.new(arg)
  end
end
