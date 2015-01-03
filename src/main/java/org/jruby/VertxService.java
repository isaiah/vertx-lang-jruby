package org.jruby;

import org.jruby.Ruby;
import org.jruby.runtime.load.BasicLibraryService;
import java.io.IOException;

import io.vertx.jruby.core.buffer.RubyBuffer;
import io.vertx.jruby.core.datagram.RubyDatagramPacket;
import io.vertx.jruby.core.datagram.RubyDatagramSocket;
import io.vertx.jruby.core.datagram.RubyPacketWritestream;
import io.vertx.jruby.core.dns.RubyDnsClient;
import io.vertx.jruby.core.dns.RubyMxRecord;
import io.vertx.jruby.core.dns.RubySrvRecord;
import io.vertx.jruby.core.eventbus.RubyEventBus;
import io.vertx.jruby.core.eventbus.RubyMessage;
import io.vertx.jruby.core.eventbus.RubyMessageConsumer;
import io.vertx.jruby.core.eventbus.RubyMessageProducer;
import io.vertx.jruby.core.file.RubyAsyncFile;
import io.vertx.jruby.core.file.RubyFileProps;
import io.vertx.jruby.core.file.RubyFileSystem;
import io.vertx.jruby.core.file.RubyFileSystemProps;

import io.vertx.jruby.core.http.RubyHttpClient;
import io.vertx.jruby.core.http.RubyHttpClientRequest;
import io.vertx.jruby.core.http.RubyHttpClientResponse;
import io.vertx.jruby.core.http.RubyHttpServer;
import io.vertx.jruby.core.http.RubyHttpServerFileUpload;
import io.vertx.jruby.core.http.RubyHttpServerRequest;
import io.vertx.jruby.core.http.RubyHttpServerRequestStream;
import io.vertx.jruby.core.http.RubyHttpServerResponse;
import io.vertx.jruby.core.http.RubyServerWebSocket;
import io.vertx.jruby.core.http.RubyServerWebSocketStream;
import io.vertx.jruby.core.http.RubyWebSocket;
import io.vertx.jruby.core.http.RubyWebSocketBase;
import io.vertx.jruby.core.http.RubyWebSocketFrame;
import io.vertx.jruby.core.http.RubyWebSocketStream;

import io.vertx.jruby.core.metrics.RubyMeasured;
import io.vertx.jruby.core.net.RubyNetClient;
import io.vertx.jruby.core.net.RubyNetServer;
import io.vertx.jruby.core.net.RubyNetSocket;
import io.vertx.jruby.core.net.RubyNetSocketStream;
import io.vertx.jruby.core.net.RubySocketAddress;
import io.vertx.jruby.core.shareddata.RubyAsyncMap;
import io.vertx.jruby.core.shareddata.RubyCounter;
import io.vertx.jruby.core.shareddata.RubyLocalMap;
import io.vertx.jruby.core.shareddata.RubyLock;
import io.vertx.jruby.core.shareddata.RubySharedData;
import io.vertx.jruby.core.streams.RubyPump;
import io.vertx.jruby.core.streams.RubyReadStream;
import io.vertx.jruby.core.streams.RubyStreamBase;
import io.vertx.jruby.core.streams.RubyWriteStream;
import io.vertx.jruby.core.RubyContext;
import io.vertx.jruby.core.RubyFuture;
import io.vertx.jruby.core.RubyMultiMap;
import io.vertx.jruby.core.RubyTimeoutStream;
import io.vertx.jruby.core.RubyVertx;

public class VertxService implements BasicLibraryService {
  @Override
  public boolean basicLoad(Ruby ruby) throws IOException {
    ruby.defineModule("Vertx");
    RubyBuffer.createRubyBuffer(ruby);
    RubyDatagramPacket.createRubyDatagramPacket(ruby);
    RubyDatagramSocket.createRubyDatagramSocket(ruby);
    RubyPacketWritestream.createRubyPacketWritestream(ruby);
    RubyDnsClient.createRubyDnsClient(ruby);
    RubyMxRecord.createRubyMxRecord(ruby);
    RubySrvRecord.createRubySrvRecord(ruby);
    RubyEventBus.createRubyEventBus(ruby);
    RubyMessage.createRubyMessage(ruby);
    RubyMessageConsumer.createRubyMessageConsumer(ruby);
    RubyMessageProducer.createRubyMessageProducer(ruby);
    RubyAsyncFile.createRubyAsyncFile(ruby);
    RubyFileProps.createRubyFileProps(ruby);
    RubyFileSystem.createRubyFileSystem(ruby);
    RubyFileSystemProps.createRubyFileSystemProps(ruby);

    RubyHttpClient.createRubyHttpClient(ruby);
    RubyHttpClientRequest.createRubyHttpClientRequest(ruby);
    RubyHttpClientResponse.createRubyHttpClientResponse(ruby);
    RubyHttpServer.createRubyHttpServer(ruby);
    RubyHttpServerFileUpload.createRubyHttpServerFileUpload(ruby);
    RubyHttpServerRequest.createRubyHttpServerRequest(ruby);
    RubyHttpServerRequestStream.createRubyHttpServerRequestStream(ruby);
    RubyHttpServerResponse.createRubyHttpServerResponse(ruby);
    RubyServerWebSocket.createRubyServerWebSocket(ruby);
    RubyServerWebSocketStream.createRubyServerWebSocketStream(ruby);
    RubyWebSocket.createRubyWebSocket(ruby);
    RubyWebSocketBase.createRubyWebSocketBase(ruby);
    RubyWebSocketFrame.createRubyWebSocketFrame(ruby);
    RubyWebSocketStream.createRubyWebSocketStream(ruby);

    RubyMeasured.createRubyMeasured(ruby);
    RubyNetClient.createRubyNetClient(ruby);
    RubyNetServer.createRubyNetServer(ruby);
    RubyNetSocket.createRubyNetSocket(ruby);
    RubyNetSocketStream.createRubyNetSocketStream(ruby);
    RubySocketAddress.createRubySocketAddress(ruby);
    RubyAsyncMap.createRubyAsyncMap(ruby);
    RubyCounter.createRubyCounter(ruby);
    RubyLocalMap.createRubyLocalMap(ruby);
    RubyLock.createRubyLock(ruby);
    RubySharedData.createRubySharedData(ruby);

    RubyPump.createRubyPump(ruby);
    RubyReadStream.createRubyReadStream(ruby);
    RubyStreamBase.createRubyStreamBase(ruby);
    RubyWriteStream.createRubyWriteStream(ruby);
    RubyContext.createRubyContext(ruby);
    RubyFuture.createRubyFuture(ruby);
    RubyMultiMap.createRubyMultiMap(ruby);
    RubyTimeoutStream.createRubyTimeoutStream(ruby);
    RubyVertx.createRubyVertx(ruby);

    return true;
  }
}
