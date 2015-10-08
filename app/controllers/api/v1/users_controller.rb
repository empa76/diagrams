module Api
  module V1
    class UsersController < ApplicationController
      expose(:users)
      expose(:user)

      def show
        render json: user
      end

      def index
        render json: users
      end
    end
  end
end
