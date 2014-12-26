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
 * @author <a href="mailto:julien@julienviet.com">Julien Viet</a>
 */
class class GenericRefedInterface<T>
  final def io.vertx.codegen.testmodel.GenericRefedInterface delegate;
  public GenericRefedInterface(io.vertx.codegen.testmodel.GenericRefedInterface delegate) {
    this.delegate = delegate;
  }
  public Object getDelegate() {
    return delegate;
  }
  def setValue(T value)
    ((io.vertx.codegen.testmodel.GenericRefedInterface) this.delegate).setValue(InternalHelper.unwrapObject(value));
  end
  def getValue()
    // This cast is cleary flawed
    def ret = (T) InternalHelper.wrapObject(((io.vertx.codegen.testmodel.GenericRefedInterface) this.delegate).getValue());
    ret
  end

  static final java.util.function.Function<io.vertx.codegen.testmodel.GenericRefedInterface, GenericRefedInterface> FACTORY = io.vertx.lang.groovy.Factories.createFactory() {
    io.vertx.codegen.testmodel.GenericRefedInterface arg -> new GenericRefedInterface(arg);
  };
end
