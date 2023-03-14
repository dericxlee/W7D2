class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    
    def create
        incoming_username = params[:user][:username]
        incoming_password = params[:user][:password]
        @user = User.find_by_credentials(incoming_username, incoming_password)

        if @user
            login!(@user) # session[:session_token] = @user.reset_session_token
            redirect_to users_url
        else
            render :new 
        end
    end
    

    def destroy

    end
end
