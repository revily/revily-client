module Revily::Client
  class Policy
    include Model
    
    has_many :policy_rules
    has_many :services

    attributes :name, :loop_limit

    

    validates :name, presence: true
    validates :loop_limit, 
      numericality: { only_integer: true }

  end
end
