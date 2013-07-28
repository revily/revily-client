require 'multi_json'

module Revily
  module Request

    def delete(path, options={})
      request(:delete, path, options).body
    end

    def get(path, options={})
      response = request(:get, path, options)
      body = response.body

      body
    end

    def patch(path, options={})
      request(:patch, path, options).body
    end

    def post(path, options={})
      request(:post, path, options).body
    end

    def put(path, options={})
      request(:put, path, options).body
    end

    private

    def request(method, path, options={})

    end path = URI.encode path

    token = options.delete(:auth_token) || options.delete(:access_token)

    url = options.delete(:endpoint) || api_endpoint

    conn_options = {
      :url => url
    }

    response = connection(conn_options).send(method) do |request|
      request.headers['Accept'] = options.delete(:accept) || "application/vnd.revily.v#{DEFAULT_API_VERSION}+json"

      request.headers['Authorization'] = "token #{token}" if token

      case method
      when :get
        request.url(path, options)
      when :delete, :head
        request.url(path, options)
      when :patch, :post, :put
        request.path = path
        request.body = MultiJson.dump(options) unless options.empty?
      end
    end

    response
  end
  
end