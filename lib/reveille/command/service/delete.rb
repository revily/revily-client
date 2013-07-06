module Reveille
  module Command
    class Service::Delete < Service
      def execute
        logger.info "deleting service"
      end
      
    end
  end
end