module Revily::Client
  class Incident
    include Model

    belongs_to :service
    attributes :message, :description, :key, :service_id, :current_user_id, :current_policy_rule_id
    validates :message, presence: true

    def resolve
      self.class.put("/incidents/#{self.id}/resolve")
      self.state = "resolved"

      self
    end

    def acknowledge
      self.class.put("/incidents/#{self.id}/acknowledge")
      self.state = "acknowledged"

      self
    end

  end
end
