require 'json'
$:.unshift(File.dirname(__FILE__))

Dir.glob(File.join(File.dirname(__FILE__), "./jars/*.jar")) {|jar| require jar}
require 'org/jruby/vertx'

module Vertx
end
