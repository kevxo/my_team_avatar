module Api
  module V1
    class TeamMateController < ApplicationController
      def index
        mates = TeamMateFacade.team_mates(params[:count])

        render json: TeamMateSerializer.new(mates)
      end
    end
  end
end