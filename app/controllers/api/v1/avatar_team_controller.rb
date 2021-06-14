module Api
  module V1
    class AvatarTeamController < ApplicationController
      def create
        user = User.find_by(api_key: params[:api_key])

        if user
          avatar_team = AvatarTeamFacade.team(params[:count], params[:name])
          render json: AvatarTeamSerializer.new(avatar_team)
        else
          render json: { error: 'Unauthorized' }, status: 401
        end
      end
    end
  end
end