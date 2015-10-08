module Api
  module V1
    class DiagramsController < ApplicationController
      expose(:user)
      expose(:diagrams, ancestor: :user)
      expose(:diagram)

      def show
        render json: diagram
      end

      def index
        render json: diagrams
      end
    end
  end
end
