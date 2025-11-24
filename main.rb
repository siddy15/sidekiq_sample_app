require_relative './otel_setup'
require 'sidekiq'
require 'sidekiq/api'
require_relative './worker/hello_worker'
require_relative './worker/email_worker'

# Enqueue jobs
HelloWorker.perform_async("Coralogix")
EmailWorker.perform_async("user@example.com")

puts "Jobs enqueued!"
