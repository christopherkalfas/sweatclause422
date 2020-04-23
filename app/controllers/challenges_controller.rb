class ChallengesController < ApplicationController
    before_action :authenticate!, except: [:index, :show]

    def index
        @challenges  = Challenge.all
    end

    def show
        @challenge = Challenge.find(params[:id])
    end

    def new
        @challenge  = Challenge.new
        @groups = Group.all
    end

    def create 
        @challenge = current_user.group.challenges.build(challenge_params)
        if @challenge.save 
            redirect_to challenge_path(@challenge)
        else  
            render :new 
        end 
    end 

    def edit
        @challenge = Challenge.find(params[:id])
    end

    def update 
        @challenge = Challenge.find(params[:id])
        if @challenge.update(challenge_params)
            redirect_to challenge_path(@challenge)
        else
            render :edit
        end 
    end 
    
    
    def destroy
        @challenge = Challenge.find(params[:id])
        @challenge.destroy
        redirect_to challenges_path
    end 

    private 

    def challenge_params 
        params.require(:challenge).permit(:name, :activity_name, :activity_reps, :group_id)
    end 
end
