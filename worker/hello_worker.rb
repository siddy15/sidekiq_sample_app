require 'opentelemetry-api'
class HelloWorker
    include Sidekiq::Worker
    # sidekiq_options queue: :default
  
    def perform(name = "world")
      tracer = OpenTelemetry.tracer_provider.tracer("hello_worker")
      tracer.in_span("hello_worker.perform", kind: :internal) do |span|
        puts "Hello, #{name}!"
        span.set_attribute("worker.name", name)
      end
    end
  end
  