unless ENV['CI']
  require 'spork'
end

def configure
  $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
  $LOAD_PATH.unshift(File.dirname(__FILE__))
  require 'revily/client'

  require 'rspec'
  require 'webmock/rspec'

  RSpec.configure do |config|
    config.mock_with :rspec
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.order = 'random'
    config.run_all_when_everything_filtered = true
    config.filter_run focus: true
    config.filter_run_excluding external: true
  end
end

def run
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
end

if defined?(Spork)
  Spork.prefork { configure }
  Spork.each_run { run }
else
  configure
  run
end
