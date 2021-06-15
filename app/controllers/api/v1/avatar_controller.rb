module Api
  module V1
    class AvatarController < ApplicationController
      def index
        search = Search.new(request: params[:controller], action: params[:action])
        search.save

        avatars = AvatarFacade.all_avatars

        render json: AvatarSerializer.new(avatars)
      end

      def show
        search = Search.new(request: params[:controller], action: params[:action],
                            params: "avatar_id=#{params[:avatar_id]}")
        search.save

        avatar = AvatarFacade.avatar(params[:avatar_id])

        render json: AvatarSerializer.new(avatar)
      end
    end
  end
end
