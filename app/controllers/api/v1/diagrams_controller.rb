module Api
  module V1
    class DiagramsController < ApplicationController
      expose(:diagrams)
      expose(:diagram, attributes: :diagram_params)

      def show
        render json: diagram
      end

      def index
        render json: diagrams
      end

      def create
        if diagram.save
          render json: diagram, status: :created
        else
          render json: { error: diagram.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if diagram.save
          render json: diagram, status: :ok
        else
          render json: { error: diagram.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if diagram.delete
          render json: {}, status: :ok
        else
          render json: { error: diagram.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def diagram_params
        params.require(:diagram).permit(:name)
      end
    end
  end
end
