class SessionsController < ApplicationController

    def signup
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to platforms_path
        else 
            @error = @user.errors.full_messages
            render :signup
        end 
    end

    def logout
        session.delete(:user_id)
        redirect_to root_path
    end

    def google
        @user= User.find_or_create_by(username: auth["info"]["name"]) do |user|
            user.password = SecureRandom.hex(10)
        end
        if @user && @user.id
            session[:user_id] = @user.id
            redirect_to platforms_path
        else
            redirect_to new_user_path
        end
    end


    private

    def auth
        request.env['omniauth.auth']
    end

    def user_params
        params.require(:user).permit(:username,:password)
    end

end