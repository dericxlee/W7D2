class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    helper_method :current_user, :logged_in?
    
    def current_user
        session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end
end
