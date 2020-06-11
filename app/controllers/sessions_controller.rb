class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            if params[:remember_me]
                cookies.permanent[:auth_token] = @user.auth_token
            # session[:user_id] = @user.id
            else 
                cookies[:auth_token] = @user.auth_token
            end 
            flash[:info] = "Login Successful!"
            redirect_to @user
        else
            @error = "No such username or wrong password."
            render :new
        end
    end

    def destroy
        cookies.delete(:auth_token)
        session[:user_id] = nil
        redirect_to users_path
    end
end
