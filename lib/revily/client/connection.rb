
module Revily
  module Connection
    def connection(options={})
      options = {
        authenticate: true,
        raw: false
      }.merge(options)

      connection = Faraday.new(options) do |builder|

        builder.use FaradayMiddleware::FollowRedirects
        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson, content_type: /\bjson$/

        faraday_config_block.call(builder) if faraday_config_block

        builder.adapter *adapter
      end

      connection.headers[:user_agent] = user_agent

      connection
    end
  end
end