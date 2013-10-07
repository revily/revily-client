module Revily::Client
  class Service
    include Model

    has_many :incidents

    attributes :name, :auto_resolve_timeout, :acknowledge_timeout

    validates :name, presence: true
    validates :auto_resolve_timeout, presence: true
    validates :acknowledge_timeout, presence: true

  end
end
