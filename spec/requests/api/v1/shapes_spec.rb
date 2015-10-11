require 'rails_helper'

describe 'api/v1/shapes' do

  before do
    FactoryGirl.create_list(:diagram_with_shapes, 2)
  end

  let(:diagram) { Diagram.first }
  let(:shape) { diagram.shapes.first }

  describe :index do
    before do
      get api_v1_diagram_shapes_path(diagram_id: diagram)
    end

    it 'response is success' do
      expect_response_to_be_success
    end

    it "get all shapes" do
      expect(response_json["shapes"]).to have(2).items
    end
  end

  describe :show do
    before do
      get api_v1_diagram_shape_path(diagram_id: diagram, id: shape.id)
    end

    it 'response is success' do
      expect_response_to_be_success
    end

    it "returns correct JSON" do
      serializer = ShapeSerializer.new(shape)
      receipt_serialized = JSON.parse(serializer.to_json)
      expect(response_json).to eql(receipt_serialized)
    end
  end

  describe :destroy do
    it 'removes shape from list' do
      delete api_v1_diagram_shape_path(diagram_id: diagram, id: shape)

      expect_response_to_be_success
      expect(response_json).to be_empty
      expect(diagram.shapes.count).to eq(1)
    end

    it "returns error when record not found" do
      delete api_v1_diagram_shape_path(diagram_id: diagram, id: 0)
      expect_response_to_be_not_found
    end
  end

  describe :create do
    context "when is successfully created" do
      before do
        post api_v1_diagram_shapes_path(diagram_id: diagram, shape: attributes_for(:shape))
      end

      it "renders the JSON for the record just created" do
        expect(diagram.shapes.count).to eq(3)
      end

      it "response is not empty" do
        expect(response_json).not_to be_empty
      end

      it "should respond with 201" do
        expect_response_to_be_created
      end
    end

    context "when is not created at all" do
      before do
        post api_v1_diagram_shapes_path(diagram_id: diagram, shape: attributes_for(:shape, kind: :square))
      end

      it "should respond with 422" do
        expect_response_to_be_unprocessable
      end
    end
  end

  describe :update do
    let(:shape_to_update) { Shape.last }

    context "when is successfully updated" do
      let(:new_value) { "my-new-shiny-shape" }

      before do
        put api_v1_diagram_shape_path(diagram_id: shape_to_update.diagram, id: shape_to_update, shape: { label: new_value })
      end

      it "renders the JSON for the record just updated" do
        expect(response_json['shape']['label']).to eql(new_value)
      end

      it "should respond with 200" do
        expect_response_to_be_success
      end

      it "response is not empty" do
        expect(response_json).not_to be_empty
      end
    end

    context "when is not updated at all" do
      before do
        put api_v1_diagram_shape_path(diagram_id: shape_to_update.diagram, id: shape_to_update, shape: { label: nil })
      end

      it "should respond with 422" do
        expect_response_to_be_unprocessable
      end
    end
  end
end
