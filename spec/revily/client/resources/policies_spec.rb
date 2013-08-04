require 'spec_helper'

describe Revily::Client::Resources::Policies do
  let(:client) { Revily::Client.new }

  describe 'policies', :vcr do
    it 'returns all policies' do
      policies = client.policies
      expect(policies).to be_kind_of Array
      expect(policies.length).to eq 1
    end
  end

  describe 'policy', :vcr do
    it 'returns a policy' do
      policy = client.policy "0K7Z5zHR"
      expect(policy.id).to eq "0K7Z5zHR"
      expect(policy.name).to eq "Operations"
      expect(policy.loop_limit).to eq 3
    end
  end

  describe 'create_policy', :vcr do
    it 'creates a policy' do
      policy = client.create_policy 'Operations', 3
      expect(policy.name).to eq 'Operations'
      expect(policy.loop_limit).to eq 3
    end
  end

  describe 'update_policy', :vcr do
    it 'updates a policy' do
      response = client.update_policy "0K7Z5zHR", loop_limit: 5
      expect(response).to be_true
    end
  end

  describe 'delete_policy', :vcr do
    it 'deletes a policy' do
      response = client.delete_policy "0K7Z5zHR"
      expect(response).to be_true
    end
  end

end
