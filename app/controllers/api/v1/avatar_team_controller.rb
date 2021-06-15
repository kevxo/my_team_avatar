module Api
  module V1
    class AvatarTeamController < ApplicationController
      def create
        search = Search.new(request: params[:controller], action: params[:action], payload: payload.to_json)
        search.save
        user = User.find_by(api_key: params[:api_key])

        if user
          avatar_team = AvatarTeamFacade.team(params[:count], params[:name])
          render json: AvatarTeamSerializer.new(avatar_team)
        else
          render json: { error: 'Unauthorized' }, status: 401
        end
      end

      private

      def payload
        {
          'name': params[:name],
          'count': params[:count],
          'api_key': params[:api_key]
        }
      end
    end
  end
end
