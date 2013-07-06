module Reveille
  module Command
    class Service::List < Service
      def execute
        logger.info "listing services"
      end
      
    end
  end
end