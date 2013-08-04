require 'spec_helper'

describe Revily::Client::Resources::PolicyRules do
  let(:client) { Revily::Client.new }

  describe 'policy_rule_rules', :vcr do
    it 'returns all policy_rule_rules' do
      policy_rule_rules = client.policy_rules "0K7Z5zHR"
    end
  end

  describe 'policy_rule', :vcr do
    it 'returns a policy_rule' do
      policy_rule = client.policy_rule "0K7Z5zHR", "Zcxlq02M"
    end
  end

  describe 'create_policy_rule', :vcr do
    it 'creates a policy_rule' do
      policy_rule = client.create_policy_rule "0K7Z5zHR", "sZjlN4dv", 'user', 1, 1
      policy = policy_rule.rels[:policy].get.data
      assignment = policy_rule.rels[:assignment].get.data

      expect(policy_rule.position).to eq 1
      expect(policy_rule.position).to eq 1
      expect(policy.id).to eq "0K7Z5zHR"
      expect(assignment.id).to eq "sZjlN4dv"
    end
  end

  describe 'update_policy_rule', :vcr do
    it 'updates a policy_rule' do
      response = client.update_policy_rule "0K7Z5zHR", "dBsVNgjE", escalation_timeout: 5
      expect(response).to be_true
    end
  end

  describe 'delete_policy_rule', :vcr do
    it 'deletes a policy_rule' do
      response = client.delete_policy_rule "0K7Z5zHR", "dBsVNgjE"
      expect(response).to be_true
    end
  end

end
