require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'opentelemetry/logger'

OpenTelemetry::SDK.configure do |c|
  c.service_name = 'rails_app'
  c.use_all() # includes rails, action_view, action_pack, active_support, rack
  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
      OpenTelemetry::Exporter::OTLP::Exporter.new(
        endpoint: ENV.fetch('OTEL_EXPORTER_OTLP_ENDPOINT', 'http://localhost:4318/v1/traces')
      )
    )
  )

  OpenTelemetry.logger = Logger.new($stdout)
end
