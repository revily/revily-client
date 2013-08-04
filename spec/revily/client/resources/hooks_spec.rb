require 'spec_helper'

describe Revily::Client::Resources::Hooks do
  let(:client) { Revily::Client.new }

  describe 'hooks', :vcr do
    it 'returns all hooks' do
      hooks = client.hooks
      expect(hooks).to be_kind_of Array
    end
  end

  describe 'hook', :vcr do
    it 'returns a hook' do
      hook = client.hook "MsxCMuKk"
      expect(hook.id).to eq "MsxCMuKk"
      expect(hook.name).to eq "test"
      expect(hook.events).to include("incident.created", "incident.updated")
      expect(hook.config.attrs).to eq({})
      expect(hook.state).to eq "enabled"
    end
  end

  describe 'create_hook', :vcr do
    it 'creates a hook' do
      hook = client.create_hook "test", [ "incident.*" ], config: { bar: 'baz' }
      expect(hook.name).to eq "test"
      expect(hook.events).to include("incident.triggered", "incident.resolved")
    end
  end

  describe 'update_hook', :vcr do
    it 'updates a hook' do
      result = client.update_hook("MsxCMuKk", events: [ "service.*" ])
      expect(result).to be_true
    end
  end

  describe 'delete_hook', :vcr do
    it 'deletes a hook' do
      result = client.delete_hook("MsxCMuKk")
      expect(result).to be_true
    end
  end

end
