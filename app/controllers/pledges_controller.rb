class PledgesController < ApplicationController

    def index 
        @pledges = Pledge.all 
    end 

    def new 
        # @pledge = Pledge.new(challenge_id: params[:challenge_id], group_id: params[:group_id], charity_id: params[:charity_id], user_id: params[:user_id], amount: params[:amount])
        @pledge = Pledge.new(challenge_id: params[:challenge_id])
        
      
    end 

    def create 
        @pledge = current_user.pledges.build(pledge_params)
        @pledge.donated = true
        if @pledge.save 
            flash[:success] = "Charity successfully created"
            redirect_to challenge_path(@pledge.challenge)
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