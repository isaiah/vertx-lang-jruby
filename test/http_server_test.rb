require_relative './test_helper'
v = Vertx::Vertx.vertx
s = v.create_http_server({port: 8080})
s.request_handler do |r|
  r.end_handler do
    r.response.put_header("hello", "world").end('hello from vertx');
  end
end

s.listen do
  "Vertx Listenning on port 8080"
end
