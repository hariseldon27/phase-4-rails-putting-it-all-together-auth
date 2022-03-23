class UsersController < ApplicationController
    skip_before_action :authorize, only: [:create]
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    # this is the solution version
    def show
        render json: @current_user
    end
    # this is mine
    # def show
    #     user = User.find_by(id: session[:user_id])
    #     render json: user
    # end



private

    def user_params
        params.permit(:username, :password, :image_url, :bio)
    end
end
