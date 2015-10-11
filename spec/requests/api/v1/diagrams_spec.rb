require 'rails_helper'
describe 'api/v1/diagrams' do
  before do
    FactoryGirl.create_list(:diagram, 2)
  end

  let(:diagram) { Diagram.first }

  describe :index do
    before do
      get api_v1_diagrams_path
    end

    it 'response is success' do
      expect_response_to_be_success
    end

    it 'get all diagrams' do
      expect(response_json['diagrams']).to have(2).items
    end
  end

  describe :show do
    before do
      get api_v1_diagram_path(diagram)
    end

    it 'response is success' do
      expect_response_to_be_success
    end

    it 'returns correct JSON' do
      serializer = DiagramSerializer.new(diagram)
      receipt_serialized = JSON.parse(serializer.to_json)
      expect(response_json).to eql(receipt_serialized)
    end
  end

  describe :destroy do
    it 'removes diagram from list' do
      delete api_v1_diagram_path(diagram)

      expect_response_to_be_success
      expect(response_json).to be_empty
      expect(Diagram.all).to have(1).item
    end

    it 'returns error when record not found' do
      delete api_v1_diagram_path(id: 0)
      expect_response_to_be_not_found
    end
  end

  describe :create do
    context 'when is successfully created' do
      before do
        post api_v1_diagrams_path(diagram: attributes_for(:diagram))
      end

      it 'renders the JSON for the record just created' do
        expect(Diagram.count).to eq(3)
      end

      it 'response is not empty' do
        expect(response_json).not_to be_empty
      end

      it 'should respond with 201' do
        expect_response_to_be_created
      end
    end

    context 'when is not created at all' do
      it 'should respond with 422' do
        post api_v1_diagrams_path(diagram: attributes_for(:diagram, name: nil))
        expect_response_to_be_unprocessable
      end

      it 'should respond with 400 when params are invalid' do
        post api_v1_diagrams_path(diagram: {})
        expect_response_to_be_bad_request
      end
    end
  end

  describe :update do
    let(:diagram_to_update) { Diagram.first }

    context 'when is successfully updated' do
      let(:new_value) { 'my-new-shiny-diagram' }

      before do
        put api_v1_diagram_path(diagram_to_update, diagram: { name: new_value })
      end

      it 'renders the JSON for the record just updated' do
        expect(response_json['diagram']['name']).to eql(new_value)
      end

      it 'should respond with 200' do
        expect_response_to_be_success
      end

      it 'response is not empty' do
        expect(response_json).not_to be_empty
      end
    end

    context 'when is not updated at all' do
      before do
        put api_v1_diagram_path(diagram_to_update, diagram: { name: nil })
      end

      it 'should respond with 422' do
        expect_response_to_be_unprocessable
      end
    end
  end
end
