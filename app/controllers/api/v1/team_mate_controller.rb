module Api
  module V1
    class TeamMateController < ApplicationController
      def index
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