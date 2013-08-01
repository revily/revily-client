module Revily::Client::Resources::PolicyRules
  
  def policy_rules(policy_id, options={})
    get "policies/#{policy_id}/rules", options
  end
  alias :list_policy_rules :policy_rules
  alias :list_rules :policy_rules

  def policy_rule(policy_id, id, options={})
    get "policies/#{policy_id}/rules/#{id}", options
  end
  alias :rule :policy_rule

  def create_policy_rule(assignment_id, loop_limit, options={})
    post "policies", options.merge({name: name, loop_limit: loop_limit})
  end
  alias :create_rule :create_policy_rule

  def update_policy_rule(policy_id, id, options={})
    patch "policies/#{policy_id}/rules/#{id}", options
  end
  alias :update_rule :update_policy_rule

  def delete_policy_rule(policy_id, id, options={})
    delete "policies/#{policy_id}/rules/#{id}", options
  end
  alias :delete_rule :delete_policy_rule

end
