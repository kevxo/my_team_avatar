module Api
  module V1
    class SessionController < ApplicationController
      def create
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          render json: UserSerializer.new(user), status: 200
        else
          render json: { error: 'Credentials are incorrect' }, status: 400
        end
      end
    end
  end
end
