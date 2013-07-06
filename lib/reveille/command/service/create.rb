module Reveille
  module Command
    class Service::Create < Service
      def execute
        logger.info "creating service"
      end
      
    end
  end
end