require 'sawyer'

# require 'revily/client/authentication'
# require 'revily/client/config'
# require 'revily/client/default'
# require 'revily/client/resources'
# require 'revily/client/version'

module Revily
  class Client
    autoload :Authentication, 'revily/client/authentication'
    autoload :Config, 'revily/client/config'
    autoload :Default, 'revily/client/default'
    autoload :Resources, 'revily/client/resources'
    
    class << self
      include Revily::Client::Config
    end

    include Revily::Client::Authentication
    include Revily::Client::Config

    include Revily::Client::Resources::Hooks
    include Revily::Client::Resources::Incidents
    include Revily::Client::Resources::Integration
    include Revily::Client::Resources::Policies
    include Revily::Client::Resources::PolicyRules
    include Revily::Client::Resources::ScheduleLayers
    include Revily::Client::Resources::Schedules
    include Revily::Client::Resources::Services
    include Revily::Client::Resources::Users

    CONVENIENCE_HEADERS = Set.new [:accept]

    def initialize(options={})
      Revily::Client::Config.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Revily::Client.instance_variable_get(:"@#{key}"))
      end
    end


    def get(url, options={})
      request :get, url, parse_query_and_convenience_headers(options)
    end

    def post(url, options={})
      request :post, url, options
    end

    def put(url, options={})
      request :put, url, options
    end

    def patch(url, options={})
      request :patch, url, options
    end

    def delete(url, options={})
      request :head, url, parse_query_and_convenience_headers(options)
    end

    def paginate(url, options={})
      opts = parse_query_and_convenience_headers(options.dup)
      if @auto_paginate || @per_page
        opts[:query][:per_page] ||= @per_page || (@auto_paginate ? 100 : nil)
      end

      data = request(:get, url, opts)

      if @auto_paginate && data.is_a?(Array)
        while @last_response.rels[:next] && rate_limit.remaining > 0
          @last_response = @last_response.rels[:next].get
          data.concat(@last_response.data) if @last_response.data.is_a?(Array)
        end
      end

      data
    end

    def agent
      @agent ||= Sawyer::Agent.new(api_endpoint, sawyer_options) do |http|
        http.headers[:accept] = default_content_type
        http.headers[:content_type] = 'application/json; charset=UTF-8'
        http.headers[:user_agent] = user_agent
        if token_authenticated?
          http.authorization 'token', @auth_token
        end
      end
    end

    def root
      agent.start.data
    end

    def last_response
      @last_response
    end

    private

      def request(method, path, options)
        if accept = options.delete(:accept)
          options[:headers] ||= {}
          options[:headers][:accept] = accept
        end

        @last_response = response = agent.call(method, URI.encode(path), options)
        response.data
      end

      def boolean_from_response(method, path, options={})
        request(method, path, options)
        @last_response.status == 204
      rescue Revily::Client::NotFound
        false
      end

      def sawyer_options
        opts = {
          :links_parser => Sawyer::LinkParsers::Hal.new
        }
        conn_opts = @connection_options
        conn_opts[:builder] = @middleware if @middleware
        opts[:faraday] = Faraday.new(conn_opts)

        opts
      end

      def parse_query_and_convenience_headers(options)
        headers = options.fetch(:headers, {})
        CONVENIENCE_HEADERS.each do |h|
          if header = options.delete(h)
            headers[h] = header
          end
        end
        query = options.delete(:query)
        opts = {:query => options}
        opts[:query].merge!(query) if query && query.is_a?(Hash)
        opts[:headers] = headers unless headers.empty?

        opts
      end
  end
end

Revily::Client.setup