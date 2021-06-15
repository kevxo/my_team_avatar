module Api
  module V1
    class UserController < ApplicationController
      def create
        search = Search.new(request: params[:controller], action: params[:action], payload: payload.to_json)
        search.save
        user = User.new(user_params)

        if user.save
          render json: UserSerializer.new(user), status: 201
        else
          render json: user.errors.full_messages, status: 400
        end
      end

      private

      def payload
        {
          'email' => params[:email],
          'password' => params[:password],
          'password_confirmation' => params[:password_confirmation]
        }
      end

      def user_params
        params.permit(:email, :password, :password_confirmation, :api_key)
      end
    end
  end
end
