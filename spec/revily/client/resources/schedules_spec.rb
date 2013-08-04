require 'spec_helper'

describe Revily::Client::Resources::Schedules do
  let(:client) { Revily::Client.new }

  describe '.schedules', :vcr do
    it 'returns all schedules' do
      schedules = client.schedules
    end
  end

  describe '.schedule', :vcr do
    it 'returns a schedule' do
      schedule = client.schedule "XVcZJWdV"
    end
  end

  describe '.create_schedule', :vcr do
    it 'creates a schedule' do
      schedule = client.create_schedule
    end
  end

  describe '.update_schedule', :vcr do
    it 'updates a schedule' do
      schedule = lient.update_schedule
    end
  end

  describe '.delete_schedule', :vcr do
    it 'deletes a schedule' do
      schedule = client.delete_schedule
    end
  end

end
