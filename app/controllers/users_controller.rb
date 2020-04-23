class UsersController < ApplicationController
    before_action :authenticate!, except: [:index, :new, :create]
    def index 
        @users = User.all 
    end  

    def new
        @user = User.new
        @groups = Group.all
    end

    def show
        @user = User.find(params[:id])
    end
    
    


    def create 
        @user = User.new(user_params)
        
            if @user.save 
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                render :new
            end 
    end

    def edit 
        @user = User.find(params[:id])
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
        params.require(:user).permit(:name, :username, :password, :group_id)
    end
end
