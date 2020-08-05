class PledgesController < ApplicationController

    def index 
        @pledges = Pledge.all 
    end 

    def new 
        # @pledge = Pledge.new(challenge_id: params[:challenge_id], group_id: params[:group_id], charity_id: params[:charity_id], user_id: params[:user_id])
        @pledge = Pledge.new(challenge_id: params[:challenge_id])
        @pledge.challenge_info    
      
    end 

    def create 
        @pledge = Pledge.create(pledge_params)
        @pledge.donated = true
        if @pledge.save 
            flash[:success] = "Charity successfully created"
            redirect_to group_path(@pledge.group)
        else 
            flash[:error] = "Something went wrong"
            render :new
        end 
    end 

    def show 
        @pledge = Pledge.find(params[:id])
    end 


    private

    def pledge_params 
        params.require(:pledge).permit(:amount, :donated, :challenge_id, :group_id, :charity_id, :user_id, :donation_image)
    end 
end 