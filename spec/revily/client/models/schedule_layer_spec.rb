require 'spec_helper'

describe Revily::Client::ScheduleLayer do

  describe '.schedule_layers', :vcr do
    it 'returns all schedule_layers' do
      schedule_layers = client.schedule_layers
    end
  end

  describe '.schedule_layer', :vcr do
    it 'returns a schedule_layer' do
      schedule_layer = client.schedule_layer "XVcZJWdV"
    end
  end

  describe '.create_schedule_layer', :vcr do
    it 'creates a schedule_layer' do
      schedule_layer = client.create_schedule_layer
    end
  end

  describe '.update_schedule_layer', :vcr do
    it 'updates a schedule_layer' do
      schedule_layer = lient.update_schedule_layer
    end
  end

  describe '.delete_schedule_layer', :vcr do
    it 'deletes a schedule_layer' do
      schedule_layer = client.delete_schedule_layer
    end
  end

end
