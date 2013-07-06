module Reveille
  module Command
    class Service < Base

      self.default_subcommand = 'list'

      # def ex
      subcommand 'list', 'list all services' do
        def execute
          super
          puts self.inspect
          logger.info "listing services"
        end
      end

    end
  end
end
