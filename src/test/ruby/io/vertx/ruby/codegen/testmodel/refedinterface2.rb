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
class interface RefedInterface2
  public Object getDelegate();
  String getString();
  RefedInterface2 setString(String str);

  static final java.util.function.Function<io.vertx.codegen.testmodel.RefedInterface2, RefedInterface2> FACTORY = io.vertx.lang.groovy.Factories.createFactory() {
    io.vertx.codegen.testmodel.RefedInterface2 arg -> new RefedInterface2Impl(arg);
  };
end

class RefedInterface2Impl implements RefedInterface2
  final def io.vertx.codegen.testmodel.RefedInterface2 delegate;
  public RefedInterface2Impl(io.vertx.codegen.testmodel.RefedInterface2 delegate) {
    this.delegate = delegate;
  }
  public Object getDelegate() {
    return delegate;
  }
  def getString()
    def ret = ((io.vertx.codegen.testmodel.RefedInterface2) this.delegate).getString();
    ret
  end
  def setString(String str)
    ((io.vertx.codegen.testmodel.RefedInterface2) this.delegate).setString(str);
    return self
  end
end
