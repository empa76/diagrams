require 'rails_helper'

describe 'api/v1/public/diagrams' do

  before do
    FactoryGirl.create_list(:user_with_diagram, 2)
  end

  let(:user) { User.first }
  let(:diagram) { user.diagrams.first }

  describe :index do
    before do
      get api_v1_user_diagrams_path(user)
    end

    it 'response is success' do
      expect_response_to_be_success
    end

    it "get all diagrams" do
      expect(response_json["diagrams"]).to have(2).items
    end
  end

  describe :show do
    before do
      get api_v1_user_diagram_path(user, diagram)
    end

    it 'response is success' do
      expect_response_to_be_success
    end

    it "returns correct JSON" do
      serializer = DiagramSerializer.new(diagram)
      receipt_serialized = JSON.parse(serializer.to_json)
      expect(response_json).to eql(receipt_serialized)
    end
  end
end
