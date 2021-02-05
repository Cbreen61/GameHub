class ApplicationController < ActionController::Base
    helper_method  :current_user, :logged_in?, :require_login
    private 

    def logged_in?
        !!current_user 
    end

    def current_user
        User.find_by(id: session[:user_id]) 
    end
    def require_login
        unless logged_in?
            redirect_to new_user_path
        end
    end
 
end
