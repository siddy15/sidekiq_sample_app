# health_server.rb
require 'sinatra'

set :bind, '0.0.0.0'
set :port, 8080

get '/up' do
  'ok'
end

get '/debug' do
  ENV.sort.map { |k, v| "#{k}=#{v}" }.join("\n")
end
