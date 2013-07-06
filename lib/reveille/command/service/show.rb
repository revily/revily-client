module Reveille
  module Command
    class Service::Show < Service
      def execute
        logger.info "showing service"
      end
      
    end
  end
end