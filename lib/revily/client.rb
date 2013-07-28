module Revily
  module Client

  end
end
# require 'revily/authentication'
# require 'revily/connection'
# require 'revily/request'

# require 'revily/clients/incidents'
# require 'revily/clients/policies'
# require 'revily/clients/policy_rules'
# require 'revily/clients/schedule_layers'
# require 'revily/clients/schedules'
# require 'revily/clients/services'
# require 'revily/clients/users'

# module Revily
#   class Client
#     attr_accessor(*Config::VALID_OPTIONS_KEYS)

#     def initialize(options={})
#       options = Revily.options.merge(options)
#       Config::VALID_OPTIONS_KEYS.each do |key|
#         send("#{key}=", options[key])
#       end
#     end

#     include Revily::Authentication
#     include Revily::Connection
#     include Revily::Request

#     include Revily::Client::Incidents
#     include Revily::Client::Integration
#     include Revily::Client::Policies
#     include Revily::Client::PolicyRules
#     include Revily::Client::ScheduleLayers
#     include Revily::Client::Schedules
#     include Revily::Client::Services
#     include Revily::Client::Users
#     include Revily::Client::Webhooks
#   end
# end

#   extend Config

#   class << self

#     def new(options={})
#       Revily::Client.new(options)
#     end
    
#     def method_missing(method, *args, &block)
#       return super unless new.respond_to?(method)
#       new.send(method, *args, &block)
#     end

#     def respond_to?(method, include_private=false)
#       new.respond_to?(method, include_private) || super(method, include_private)
#     end
#   end