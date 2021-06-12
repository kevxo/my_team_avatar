module Api
  module V1
    class AvatarController < ApplicationController
      def index
        avatars = AvatarFacade.all_avatars

        render json: AvatarSerializer.new(avatars)
      end
    end
  end
end
