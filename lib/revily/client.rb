# require 'revily/client/authentication'
# require 'revily/client/config'
# require 'revily/client/default'
# require 'revily/client/resources'
# require 'revily/client/version'

require 'her'
require 'faraday'

module Revily
  module Client
    autoload :Authentication, 'revily/client/authentication'
    autoload :Config,         'revily/client/config'
    autoload :Default,        'revily/client/default'
    autoload :Model,          'revily/client/model'
    
    class << self
      include Revily::Client::Config
    end

    include Revily::Client::Authentication
    include Revily::Client::Config

    autoload :Hook,          'revily/client/models/hook'
    autoload :Incident,      'revily/client/models/incident'
    autoload :Integration,   'revily/client/models/integration'
    autoload :Policy,        'revily/client/models/policy'
    autoload :PolicyRule,    'revily/client/models/policy_rule'
    autoload :Schedule,      'revily/client/models/schedule'
    autoload :ScheduleLayer, 'revily/client/models/schedule_layer'
    autoload :Service,       'revily/client/models/service'
    autoload :User,          'revily/client/models/user'

    CONVENIENCE_HEADERS = Set.new [:accept]

    # def initialize(options={})
      # Revily::Client::Config.keys.each do |key|
        # instance_variable_set(:"@#{key}", options[key] || Revily::Client.instance_variable_get(:"@#{key}"))
      # end
    # end
  end
end

require 'revily/client/setup'
Revily::Client.setup
Her::API.setup Revily::Client.connection_options