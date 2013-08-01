require 'faraday'
require 'revily/client/error'

module Revily::Client::Response

  # This class raises an Revily::Client-flavored exception based
  # HTTP status codes returned by the API
  class RaiseError < Faraday::Response::Middleware

    # Status code to error mappings
    # @private
    ERROR_MAP = {
      400 => Revily::Client::BadRequest,
      401 => Revily::Client::Unauthorized,
      403 => Revily::Client::Forbidden,
      404 => Revily::Client::NotFound,
      406 => Revily::Client::NotAcceptable,
      422 => Revily::Client::UnprocessableEntity,
      500 => Revily::Client::InternalServerError,
      501 => Revily::Client::NotImplemented,
      502 => Revily::Client::BadGateway,
      503 => Revily::Client::ServiceUnavailable
    }

    private

      def on_complete(response)
        key = response[:status].to_i
        raise ERROR_MAP[key].new(response) if ERROR_MAP.has_key? key
      end
  end
end
