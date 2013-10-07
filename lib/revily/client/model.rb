require 'her'

module Revily::Client
  module Model
    extend ActiveSupport::Concern

    included do
      include Her::Model
    end

    def links
      _links
    end

    module ClassMethods
      
    end
  end
end
