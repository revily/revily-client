module Revily::Client
  class Schedule
    include Model

    has_many :schedule_layers
    
    attributes :name, :time_zone
  end
end
