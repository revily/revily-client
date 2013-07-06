module Reveille
  module Command
    class Service::Update < Service
      def execute
        logger.info "updating service"
      end
      
    end
  end
end