module Reveille
  module Command
    autoload :Base, 'reveille/command/base'
    autoload :Service, 'reveille/command/service'

    def self.run(*args)
      Base.run(*args)
    end

  end
end
