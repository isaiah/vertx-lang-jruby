require 'json'
$:.unshift(File.dirname(__FILE__))

Dir.glob(File.join(File.dirname(__FILE__), "./jars/*.jar")) {|jar| require jar}
require 'org/jruby/vertx'

module Vertx
  # Delegate everything to Vertx class
  # This is VERY ugly, the problem is that everything resides in the
  # Vertx module, while there is also a Vertx class
  def self.method_missing(*args)
    Vertx.send(*args)
  end
end
