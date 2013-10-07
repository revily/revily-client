require 'spec_helper'

describe Revily::Client::Service do

  describe 'services', :vcr do
    it 'returns all services' do
      services = client.services
    end
  end

  describe 'service', :vcr do
    it 'returns a service' do
      service = client.service "OCyySkGT"
    end
  end

  describe 'create_service', :vcr do
    it 'creates a service' do
      service = client.create_service "New Service", 30, 60
    end
  end

  describe 'update_service', :vcr do
    it 'updates a service' do
      response = client.update_service "OCyySkGT", auto_resolve_timeout: 60
      service = client.service "OCyySkGT"
      expect(response).to be_true
      expect(service.auto_resolve_timeout).to eq 60
    end
  end

  describe 'delete_service', :vcr do
    it 'deletes a service' do
      response = client.delete_service "OCyySkGT"
      expect(response).to be_true
    end
  end

end
