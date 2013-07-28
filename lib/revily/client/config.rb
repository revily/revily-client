require 'faraday'
require 'revily/version'

module Revily
  module Config
    VALID_OPTION_KEYS = [
      :adapter,
      :api_version,
      :api_endpoint,
      :auth_token,
      :faraday_config_block,
      :user_agent
    ]

    DEFAULT_ADAPTER      = Faraday.default_adapter
    DEFAULT_API_VERSION  = 1
    DEFAULT_API_ENDPOINT = ENV['REVEILLE_API_ENDPOINT'] || 'https://api.revily.io/'
    DEFAULT_USER_AGENT   = "Revily Ruby Client v#{Revily::VERSION}"

    attr_accessor(*VALID_OPTION_KEYS)

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTION_KEYS.inject({}) { |opts, key| opts.merge!(key => send(key) }
    end

    def api_endpoint=(value)
      @api_endpoint = File.join(value, "")
    end

    def faraday_config(&block)
      @faraday_config_block = block
    end

    def reset
      self.adapter      = DEFAULT_ADAPTER
      self.api_version  = DEFAULT_API_VERSION
      self.api_endpoint = DEFAULT_API_ENDPOINT
      self.user_agent   = DEFAULT_USER_AGENT
      self.auth_token = nil
    end

    
  end
end