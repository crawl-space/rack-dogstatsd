require 'datadog/statsd'

module Rack
  class DogStatsd

    def initialize(app, options = {})
      @app = app

      host = options[:host] || 'localhost'
      port = options[:port] || 8125
      @statsd = options[:statsd] || Datadog::Statsd.new(host, port, **options)
      @metric = options[:metric] || 'rack-dogstatsd.response.time'
    end

    def call(env)
      start = Time.now

      status, header, body = @app.call env

      path = env['PATH_INFO']

      routing_args = env['rack.routing_args'] || {}
      path = path.dup.tap do |path|
        routing_args.except(:format, :namespace, :catch).each do |param, arg|
          path.sub!(arg.to_s, ":#{param}")
        end
      end

      @statsd.timing(@metric, (Time.now - start) * 1000, tags: [
        "path:#{ path }",
        "method:#{ env["REQUEST_METHOD"].downcase }",
        "status:#{ status }"
      ])

      [status, header, body]
    end
  end
end
