class ApplicationController < ActionController::Base
    helper_method  :current_user, :logged_in?, :require_login, :not_found
    private 

    def logged_in?
        !!current_user 
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def require_login
        unless logged_in?
            redirect_to new_user_path
        end
    end
    def game_not_found
        redirect_to games_path
    end
    def platform_not_found
        redirect_to platforms_path
    end

 
end
