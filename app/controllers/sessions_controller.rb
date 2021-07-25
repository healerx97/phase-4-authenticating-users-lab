class SessionsController < ApplicationController
    def create
        user = User.find_by(session_params)
        session[:user_id] = user.id
        render json: user
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

    private

    def session_params
        params.permit(:username)
    end
end
