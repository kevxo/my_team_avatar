module Api
  module V1
    class AvatarController < ApplicationController
      def index
        avatars = AvatarFacade.all_avatars

        render json: AvatarSerializer.new(avatars)
      end

      def show
        avatar = AvatarFacade.avatar(params[:avatar_id])

        render json: AvatarSerializer.new(avatar)
      end
    end
  end
end
