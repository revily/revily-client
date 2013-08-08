require 'spec_helper'

describe Revily::Client::Resources::Schedules do
  let(:client) { Revily::Client.new }

  describe 'schedules', :vcr do
    it 'returns all schedules' do
      schedules = client.schedules
    end
  end

  describe 'schedule', :vcr do
    it 'returns a schedule' do
      schedule = client.schedule "5aBoNfbK"
    end
  end

  describe 'create_schedule', :vcr do
    it 'creates a schedule' do
      schedule = client.create_schedule "Developers", "EST"
    end
  end

  describe 'update_schedule', :vcr do
    it 'updates a schedule' do
      response = client.update_schedule "wW2OWrse", name: "Devs", time_zone: "PST"
      schedule = client.schedule("wW2OWrse")
      expect(response).to be_true
      expect(schedule.name).to eq "Devs"
      expect(schedule.time_zone).to eq "PST"
    end
  end

  describe 'delete_schedule', :vcr do
    it 'deletes a schedule' do
      response = client.delete_schedule "wW2OWrse"
      expect(response).to be_true
    end
  end

end
