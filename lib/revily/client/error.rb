module Revily::Client
  class Error < StandardError
    def initialize(response=nil)
      @response = response
      super(build_error_message)
    end

    def response_body
      @response_body ||=
      if @response && (body = @response[:body].strip) && !body.empty?
        if body.is_a?(String)
          MultiJson.decode(body)
        else
          body
        end
      else
        nil
      end
    end

    def build_error_message
      return nil if @response.nil?

      message = if response_body
        ": #{response_body['error'] || response_body['message'] || ''}"
      else
        ''
      end
      errors = response_body && response_body['errors'] ?  map_error_messages : []
      "#{@response[:method].to_s.upcase} #{@response[:url].to_s}: #{@response[:status]}#{message}#{errors.join('; ')}"
    end

    def map_error_messages
      response_body['errors'].inject([]) do |messages, (attribute,values)|
        values.each do |value|
          messages << "#{attribute} #{value}"
        end
        messages
      end
    end
  end

  class BadRequest < Error; end
  class Unauthorized < Error; end
  class Forbidden < Error; end
  class NotFound < Error; end
  class NotAcceptable < Error; end
  class UnprocessableEntity < Error; end
  class InternalServerError < Error; end
  class NotImplemented < Error; end
  class BadGateway < Error; end
  class ServiceUnavailable < Error; end
end
