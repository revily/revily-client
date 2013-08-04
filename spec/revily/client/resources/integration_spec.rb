require 'spec_helper'

describe Revily::Client::Resources::Integration do
  let(:client) { Revily::Client.new }

  describe '.service_trigger_incident', :vcr do
    it 'triggers an incident' do
    end
  end

  describe '.service_acknowledge_incident', :vcr do
    it 'acknowledges an incident' do
    end
  end

  describe '.service_resolve_incident', :vcr do
    it 'resolves an incident' do
    end
  end
end
