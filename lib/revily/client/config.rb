require 'faraday'
require 'revily/client/version'

module Revily::Client::Config
  
  attr_accessor :api_endpoint, :auto_paginate, :connection_options, :default_content_type,
                :middleware, :per_page, :user_agent
  attr_writer :auth_token

  class << self
    def keys
      @keys ||= [
        :api_endpoint,
        :auth_token,
        :connection_options,
        :default_content_type,
        :middleware,
        :per_page,
        :user_agent
      ]
    end
  end

  def configure
    yield self
  end

  def reset!
    Revily::Client::Config.keys.each do |key|
      instance_variable_set(:"@#{key}", Revily::Client::Default.options[key])
    end
    self
  end
  alias_method :setup, :reset!

  def api_endpoint
    File.join(@api_endpoint, '')
  end

  private

  def options
    Hash[Revily::Client::Config.keys.map{|key|[key, instance_variable_get(:"@#{key}")]}]
    # Revily::Client::Config.inject({}) { |o,k| o.merge!(k => instance_variable_get(:"@#{key}")) }
  end
end
