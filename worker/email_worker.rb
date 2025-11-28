class EmailWorker
    include Sidekiq::Worker
    # sidekiq_options queue: :default
  
    def perform(email)
      tracer = OpenTelemetry.tracer_provider.tracer("email_worker")
      tracer.in_span("email_worker.perform", kind: :internal) do |span|
      puts "Sending welcome email to #{email}"
      span.set_attribute("worker.name", email)
      end
      # Simulate delay
      sleep(2)
      puts "Email sent!"
    end
  end
  