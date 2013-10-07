module Revily::Client
  class Hook
    include Model

    attributes :id, :name, :events, :config

    validates :name, presence: true
    validates :events, presence: true

  end
end
