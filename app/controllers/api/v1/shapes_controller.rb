module Api
  module V1
    class ShapesController < ApplicationController
      expose(:diagram)
      expose(:shapes, ancestor: :diagram)
      expose(:shape, attributes: :shape_params)

      def show
        render json: shape
      end

      def index
        render json: shapes
      end

      def create
        shape.diagram = diagram
        if shape.save
          render json: shape, status: :created
        else
          render json: { error: shape.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        if shape.save
          render json: shape, status: :ok
        else
          render json: { error: shape.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def destroy
        if shape.delete
          render json: {}, status: :ok
        else
          render json: { error: shape.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def shape_params
        allowed_params = [:label, :kind,
                          properties: [:color, :radius, :width, :heigth]]
        params.require(:shape).permit(allowed_params)
      end
    end
  end
end
