require 'faraday'
require 'faraday_middleware'

require 'revily/client/version'
require 'revily/client/response/raise_error'

module Revily::Client::Default

  API_ENDPOINT = 'https://api.revi.ly'.freeze
  USER_AGENT = "Revily API Client v#{Revily::Client::VERSION}"
  CONTENT_TYPE = "application/vnd.revily.v1+json"

  class << self

    # @return [Hash]
    def options
      Hash[Revily::Client::Config.keys.map{|key| [key, send(key)]}]
    end

    # @return [String]
    def auth_token
      ENV['REVILY_AUTH_TOKEN']
    end

    # @return [String]
    def api_endpoint
      ENV['REVILY_API_ENDPOINT'] || API_ENDPOINT
    end

    # @return [String]
    def auto_paginate
      ENV['REVILY_AUTO_PAGINATE']
    end

    # @return [Hash]
    def connection_options
      opts = {
        headers: {
          accept: default_content_type,
          user_agent: user_agent,
          content_type: 'application/json; charset=utf-8',
          authorization: "token #{auth_token}"
        },
        url: api_endpoint,
        builder: middleware
      }
    end

    def default_content_type
      ENV['REVILY_DEFAULT_CONTENT_TYPE'] || CONTENT_TYPE
    end

    def middleware
      Faraday::Builder.new do |builder|
        builder.request :json
        builder.request :authorization, 'token', auth_token

        builder.use Her::Middleware::DefaultParseJSON
        # builder.use Revily::Client::Response::RaiseError
        # builder.response :logger

        builder.adapter :net_http
      end
    end

    def per_page
      page_size = ENV['REVILY_PER_PAGE']
      page_size.to_i if page_size
    end

    def user_agent
      ENV['REVILY_USER_AGENT'] || USER_AGENT
    end

  end
end
