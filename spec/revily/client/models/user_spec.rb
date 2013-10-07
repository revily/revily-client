require 'spec_helper'

describe Revily::Client::User do

  describe 'users', :vcr do
    it 'returns all users' do
      users = client.users
    end
  end

  describe 'user', :vcr do
    it 'returns a user' do
      user = client.user "sZjlN4dv"

    end
  end

  describe 'create_user', :vcr do
    it 'creates a user' do
      user = client.create_user "Bill Williamson", "bill@example.com", "worstpass"
    end
  end
 
  describe 'update_user', :vcr do
    it 'updates a user' do
      response = client.update_user "0aMoDfFr", name: "William Williamson"
      user = client.user "0aMoDfFr"
      expect(response).to be_true
      expect(user.name).to eq "William Williamson"
    end
  end

  describe 'delete_user', :vcr do
    it 'deletes a user' do
      response = client.delete_user "0aMoDfFr"
      # user = client.user "0aMoDfFr"
      expect(response).to be_true
      # expect(user).to be_false
    end
  end

end
