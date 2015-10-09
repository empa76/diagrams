require 'rails_helper'

describe 'api/v1/public/users' do

  before do
    FactoryGirl.create_list(:user, 2)
  end

  let(:user) { User.last }

  describe :index do
    before do
      get api_v1_users_path
    end

    it 'response is success' do
      expect_response_to_be_success
    end

    it "get all users" do
      expect(response_json["users"]).to have(2).items
    end
  end

  describe :show do
    before do
      get api_v1_user_path(user)
    end

    it 'response is success' do
      expect_response_to_be_success
    end

    it "returns correct JSON" do
      serializer = UserSerializer.new(user)
      receipt_serialized = JSON.parse(serializer.to_json)
      expect(response_json).to eql(receipt_serialized)
    end
  end
end
