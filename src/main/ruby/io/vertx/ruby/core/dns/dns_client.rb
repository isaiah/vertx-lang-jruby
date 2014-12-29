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
java_import io.vertx.core.AsyncResult
java_import io.vertx.core.Handler
#
# Provides a way to asynchronous lookup informations from DNS-Servers.
#
# @author <a href="mailto:nmaurer@redhat.com">Norman Maurer</a>
#
class DnsClient
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end
    
  # Try to lookup the A (ipv4) or AAAA (ipv6) record for the given name. The first found will be used.
  #
  # @param name      The name to resolve
  # @param handler   the {@link io.vertx.core.Handler} to notify with the {@link io.vertx.core.AsyncResult}. The {@link io.vertx.core.AsyncResult} will get
  #                  notified with the resolved address if a record was found. If non was found it will
  #                  get notifed with {@code null}.
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def lookup name, handler
    this.delegate.lookup(name, handler);
    return self
  end
    
  # Try to lookup the A (ipv4) record for the given name. The first found will be used.
  #
  # @param name      The name to resolve
  # @param handler   the {@link Handler} to notify with the {@link io.vertx.core.AsyncResult}. The {@link io.vertx.core.AsyncResult} will get
  #                  notified with the resolved {@link java.net.Inet4Address} if a record was found. If non was found it will
  #                  get notifed with {@code null}.
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def lookup4 name, handler
    this.delegate.lookup4(name, handler);
    return self
  end
    
  # Try to lookup the AAAA (ipv6) record for the given name. The first found will be used.
  #
  # @param name      The name to resolve
  # @param handler   the {@link Handler} to notify with the {@link AsyncResult}. The {@link AsyncResult} will get
  #                  notified with the resolved {@link java.net.Inet6Address} if a record was found. If non was found it will
  #                  get notifed with {@code null}.
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def lookup6 name, handler
    this.delegate.lookup6(name, handler);
    return self
  end
    
  # Try to resolve all A (ipv4) records for the given name.
  #
  #
  #
  # @param name      The name to resolve
  # @param handler   the {@link io.vertx.core.Handler} to notify with the {@link io.vertx.core.AsyncResult}. The {@link io.vertx.core.AsyncResult} will get
  #                  notified with a {@link java.util.List} that contains all the resolved {@link java.net.Inet4Address}es. If non was found
  #                  and empty {@link java.util.List} will be used.
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def resolveA name, handler
    this.delegate.resolveA(name, handler);
    return self
  end
    
  # Try to resolve all AAAA (ipv6) records for the given name.
  #
  #
  # @param name      The name to resolve
  # @param handler   the {@link io.vertx.core.Handler} to notify with the {@link io.vertx.core.AsyncResult}. The {@link io.vertx.core.AsyncResult} will get
  #                  notified with a {@link java.util.List} that contains all the resolved {@link java.net.Inet6Address}es. If non was found
  #                  and empty {@link java.util.List} will be used.
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def resolveAAAA name, handler
    this.delegate.resolveAAAA(name, handler);
    return self
  end
    
  # Try to resolve the CNAME record for the given name.
  #
  # @param name      The name to resolve the CNAME for
  # @param handler   the {@link Handler} to notify with the {@link AsyncResult}. The {@link AsyncResult} will get
  #                  notified with the resolved {@link String} if a record was found. If non was found it will
  #                  get notified with {@code null}.
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def resolveCNAME name, handler
    this.delegate.resolveCNAME(name, handler);
    return self
  end
    
  # Try to resolve the MX records for the given name.
  #
  #
  # @param name      The name for which the MX records should be resolved
  # @param handler   the {@link io.vertx.core.Handler} to notify with the {@link io.vertx.core.AsyncResult}. The {@link io.vertx.core.AsyncResult} will get
  #                  notified with a List that contains all resolved {@link MxRecord}s, sorted by their
  #                  {@link MxRecord#priority()}. If non was found it will get notified with an empty {@link java.util.List}
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def resolveMX name, handler
    this.delegate.resolveMX(name, new Handler<AsyncResult<List<io.vertx.core.dns.MxRecord>>>() {
      public void handle(AsyncResult<List<io.vertx.core.dns.MxRecord>> event) {
        AsyncResult<List<MxRecord>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<MxRecord>>result(event.result().collect({
            io.vertx.core.dns.MxRecord element ->
            MxRecord.FACTORY.call(element)
          }) as List)
        } else {
          f = InternalHelper.<List<MxRecord>>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Try to resolve the TXT records for the given name.
  #
  # @param name      The name for which the TXT records should be resolved
  # @param handler   the {@link Handler} to notify with the {@link AsyncResult}. The {@link AsyncResult} will get
  #                  notified with a List that contains all resolved {@link String}s. If non was found it will
  #                  get notified with an empty {@link java.util.List}
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def resolveTXT name, handler
    this.delegate.resolveTXT(name, handler);
    return self
  end
    
  # Try to resolve the PTR record for the given name.
  #
  # @param name      The name to resolve the PTR for
  # @param handler   the {@link Handler} to notify with the {@link AsyncResult}. The {@link AsyncResult} will get
  #                  notified with the resolved {@link String} if a record was found. If non was found it will
  #                  get notified with {@code null}.
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def resolvePTR name, handler
    this.delegate.resolvePTR(name, handler);
    return self
  end
    
  # Try to resolve the NS records for the given name.
  #
  # @param name      The name for which the NS records should be resolved
  # @param handler   the {@link Handler} to notify with the {@link AsyncResult}. The {@link AsyncResult} will get
  #                  notified with a List that contains all resolved {@link String}s. If non was found it will
  #                  get notified with an empty {@link java.util.List}
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def resolveNS name, handler
    this.delegate.resolveNS(name, handler);
    return self
  end
    
  # Try to resolve the SRV records for the given name.
  #
  # @param name      The name for which the SRV records should be resolved
  # @param handler   the {@link Handler} to notify with the {@link AsyncResult}. The {@link AsyncResult} will get
  #                  notified with a List that contains all resolved {@link SrvRecord}s. If non was found it will
  #                  get notified with an empty {@link java.util.List}
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def resolveSRV name, handler
    this.delegate.resolveSRV(name, new Handler<AsyncResult<List<io.vertx.core.dns.SrvRecord>>>() {
      public void handle(AsyncResult<List<io.vertx.core.dns.SrvRecord>> event) {
        AsyncResult<List<SrvRecord>> f
        if (event.succeeded()) {
          f = InternalHelper.<List<SrvRecord>>result(event.result().collect({
            io.vertx.core.dns.SrvRecord element ->
            SrvRecord.FACTORY.call(element)
          }) as List)
        } else {
          f = InternalHelper.<List<SrvRecord>>failure(event.cause())
        }
        handler.handle(f)
      }
    });
    return self
  end
    
  # Try to do a reverse lookup of an ipaddress. This is basically the same as doing trying to resolve a PTR record
  # but allows you to just pass in the ipaddress and not a valid ptr query string.
  #
  # @param ipaddress The ipaddress to resolve the PTR for
  # @param handler   the {@link Handler} to notify with the {@link AsyncResult}. The {@link AsyncResult} will get
  #                  notified with the resolved {@link String} if a record was found. If non was found it will
  #                  get notified with {@code null}.
  #                  If an error accours it will get failed.
  # @return          itself for method-chaining.
  def reverseLookup ipaddress, handler
    this.delegate.reverseLookup(ipaddress, handler);
    return self
  end

  FACTORY = io.vertx.lang.jruby.Factories.createFactory() do |arg|
    DnsClient.new(arg)
  end
end
