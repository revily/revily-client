class Revily::Client
  class Error < StandardError
    def initialize(response=nil)
      @response = response
      super(build_error_message)
    end

    def response_body
      @response_body ||=
        # return nil if @response.nil? && response[:body].nil?

        if @response && (body = @response[:body]) && !body.empty?
          if body.is_a?(String)
            serializer = Sawyer::Serializer.new(Sawyer::Serializer.any_json)
            serializer.decode(body)
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
      errors = unless message.empty?
        response_body['errors'] ?  ": #{response_body['errors'].map{|e|e['message']}.join(', ')}" : ''
      end
      "#{@response[:method].to_s.upcase} #{@response[:url].to_s}: #{@response[:status]}#{message}#{errors}"
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
