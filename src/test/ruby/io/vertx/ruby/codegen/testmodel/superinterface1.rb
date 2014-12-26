/*
 * Copyright 2014 Red Hat, Inc.
 *
 * Red Hat licenses this file to you under the Apache License, version 2.0
 * (the "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

package io.vertx.groovy.codegen.testmodel;
import groovy.transform.CompileStatic
import io.vertx.lang.groovy.InternalHelper
/**
 * @author <a href="http://tfox.org">Tim Fox</a>
 */
class class SuperInterface1
  final def io.vertx.codegen.testmodel.SuperInterface1 delegate;
  public SuperInterface1(io.vertx.codegen.testmodel.SuperInterface1 delegate) {
    this.delegate = delegate;
  }
  public Object getDelegate() {
    return delegate;
  }
  def superMethodWithBasicParams(byte b, short s, int i, long l, float f, double d, boolean bool, char ch, String str)
    this.delegate.superMethodWithBasicParams(b, s, i, l, f, d, bool, ch, str);
  end

  static final java.util.function.Function<io.vertx.codegen.testmodel.SuperInterface1, SuperInterface1> FACTORY = io.vertx.lang.groovy.Factories.createFactory() {
    io.vertx.codegen.testmodel.SuperInterface1 arg -> new SuperInterface1(arg);
  };
end
