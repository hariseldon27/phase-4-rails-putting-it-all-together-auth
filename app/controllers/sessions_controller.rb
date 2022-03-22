class SessionsController < ApplicationController

    def create
        user = User.find_by(id: params[:id])
        if user
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unauthorized
        end
    end

    def destroy
        session[:user_id].destroy
        head :nocontent
    end
end
