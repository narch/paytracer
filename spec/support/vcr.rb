require "vcr"

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :faraday
  config.filter_sensitive_data('<INTEGRATOR_ID>') { ENV['PT_TEST_INTEGRATOR_ID'] }
end
