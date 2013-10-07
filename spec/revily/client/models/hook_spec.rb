require 'spec_helper'

describe Revily::Client::Hook, vcr: { cassette_name: 'hooks' } do

  subject { described_class }

  describe 'all' do
    let(:resource_1) { ignore { subject.create(name: "test", events: [ "incident.*" ]) } }
    let(:resource_2) { ignore { subject.create(name: "test", events: [ "service.*" ]) } }
    after { ignore { resource_1.destroy; resource_2.destroy } }

    it 'returns all hooks' do
      hooks = subject.all.fetch
      expect(hooks).to be_kind_of Array
      expect(hooks.first).to be_kind_of subject
    end
  end

  describe 'find' do
    let(:resource) { ignore { subject.create name: "test", events: [ "incident.*" ] } }
    after { ignore { resource.destroy } }
    it 'returns a hook' do
      # h = ignore { subject.create name}
      hook =  subject.find(resource.id)
      expect(hook.id).to eq resource.id
      expect(hook.name).to eq "test"
      expect(hook.events).to include("incident.create", "incident.update")
      expect(hook.config).to eq({})
      expect(hook.state).to eq "enabled"
    end
  end

  describe 'create' do
    it 'creates a hook' do
      hook = subject.create name: "test", events: [ "incident.*" ], config: { bar: 'baz' }
      expect(hook.name).to eq "test"
      expect(hook.events).to include("incident.trigger", "incident.resolve")
    end
  end

  describe 'update' do
    let(:resource) {}
    it 'updates a hook' do
      hook = subject.create name: "test", events: [ "incident.*" ]
      hook.events = [ "service.*" ]
      hook.valid? && hook.save

      expect(hook).to have(0).errors
    end
  end

  describe 'delete' do
    let(:resource) { ignore { subject.create name: "test", events: [ "incident.*" ] } }
    it 'deletes a hook' do
      hook = subject.find(resource.id)
      hook.destroy

      expect(hook).to be_destroyed
    end
  end

end
