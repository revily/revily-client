require 'vcr'
require 'addressable/uri'

VCR.configure do |config|
  config.configure_rspec_metadata!
  config.filter_sensitive_data("https://api.revi.ly") { ENV['REVILY_API_ENDPOINT'] }
  config.filter_sensitive_data("<Authentication Token>") { ENV['REVILY_AUTH_TOKEN'] }
  config.cassette_library_dir = 'spec/fixtures/cassettes'
  config.hook_into :webmock
  config.default_cassette_options = {
    # serialize_with:             :json,
    # preserve_exact_body_bytes:  true,
    decode_compressed_response: true,
    # record:                     ENV['CI'] ? :none : :once
    record:                     ENV['CI'] ? :none : :new_episodes
    # record:                     ENV['CI'] ? :none : :all
  }
  config.uri_parser = Addressable::URI
  config.ignore_request do |request|
    uri = Addressable::URI.parse(request.uri)
    uri.query_values && uri.query_values['ignore']
  end
  config.allow_http_connections_when_no_cassette = true
end
