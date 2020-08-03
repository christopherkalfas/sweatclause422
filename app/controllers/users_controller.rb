class UsersController < ApplicationController
    before_action :authenticate!, except: [:index, :new, :create]
    before_action :correct_user,   only: [:edit, :update, :delete]
    def index 
        @users = User.all 
    end  

    def new
        @user = User.new
    end

    def show
        # @user = User.find(params[:id])
        @user = User.find(current_user.id)
    end
    
    


    def create 
        @user = User.new(user_params)
        
            if @user.save 
                UserMailer.signup_confirmation(@user).deliver
                session[:user_id] = @user.id
                redirect_to user_path(@user), notice: "Signed up successfully!"
            else 
                render :new
            end 
    end

    def edit 
        @user = User.find(params[:id])
        @user.profile_pic.attach(params[:profile_pic])
    end 

    def update 
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end 
    end 


    def destroy 
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end
    

    private 

    def user_params 
        params.require(:user).permit(:name, :username, :password, :email, :auth_token, :password_reset_token, :password_reset_sent_at, :profile_pic)
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to users_path unless current_user?(@user)
    end 
end
