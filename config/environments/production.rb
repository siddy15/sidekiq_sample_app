Rails.logger = OpenTelemetry::Logger::Logger.new(
  exporter: OpenTelemetry::Exporter::OTLP::Exporter.new(endpoint: 'http://localhost:4318/v1/logs'),
  fallback: Logger.new(STDOUT)
)
