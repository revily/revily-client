require 'spec_helper'

describe Revily::Client::Incident do

  describe 'incidents', :vcr do
    it 'returns all incidents' do
      incidents = client.incidents
      expect(incidents).to be_kind_of Array
      expect(incidents.length).to eq 9
    end

    it 'returns all incidents for a given service' do
      incidents = client.incidents("048j1N2J")
      expect(incidents).to be_kind_of Array
      expect(incidents.length).to eq 3
    end
  end

  describe 'incident', :vcr do
    it 'returns an incident' do
      incident = client.incident "CXGIBtSD"
      expect(incident.id).to eq "CXGIBtSD"
      expect(incident.state).to eq "resolved"
      expect(incident.key).to eq "464ee3a56056bd5a8c2e630f404269e5"
    end
  end

  describe 'acknowledge_incident', :vcr do
    it 'acknowledges an incident' do
      response = client.acknowledge_incident "b7fQ1LuE"
      expect(response).to be_true
    end
  end

  describe 'resolve_incident', :vcr do
    it 'resolves an incident' do
      response = client.resolve_incident "f0B0BgmB"
      expect(response).to be_true
    end
  end
end
