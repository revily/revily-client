require 'vcr'

VCR.configure do |c|
  c.configure_rspec_metadata!
  c.filter_sensitive_data("https://api.revi.ly") do
    ENV['REVILY_API_ENDPOINT']
  end
  c.cassette_library_dir = 'spec/fixtures/casettes'
  c.hook_into :webmock
  c.default_cassette_options = {
    # serialize_with:             :json,
    # preserve_exact_body_bytes:  true,
    decode_compressed_response: true,
    record:                     ENV['CI'] ? :none : :once
    # record:                     ENV['CI'] ? :none : :all
  }
end
