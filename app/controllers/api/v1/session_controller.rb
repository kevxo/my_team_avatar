module Api
  module V1
    class SessionController < ApplicationController
      def create
        search = Search.new(request: params[:controller], action: params[:action], payload: payload.to_json)
        search.save
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          render json: UserSerializer.new(user), status: 200
        else
          render json: { error: 'Credentials are incorrect' }, status: 400
        end
      end

      private

      def payload
        {
          'email' => params[:email],
          'password' => params[:password]
        }
      end
    end
  end
end
