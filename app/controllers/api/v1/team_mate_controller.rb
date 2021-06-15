module Api
  module V1
    class TeamMateController < ApplicationController
      def index
        search = Search.new(request: params[:controller], action: params[:action], params: "count=#{params[:count]}")
        search.save

        if params[:count] != ''
          mates = TeamMateFacade.team_mates(params[:count])

          render json: TeamMateSerializer.new(mates)
        else
          render json: { error: 'Missing Parameter' }, status: 400
        end
      end
    end
  end
end