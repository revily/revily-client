module Revily::Client
  class PolicyRule
    include Model
    
    belongs_to :policy
    # belongs_to :assignment


    def assignment
      match = self.links['assignment']['href'].match /\/(?<klass>.+)\/(?<id>.+)/
      klass = Revily::Client.const_get(match[:klass].singularize.classify)
      id = match[:id]

      klass.find(id)
    end

    collection_path "/policies/:policy_id/policy_rules"
  end
end
