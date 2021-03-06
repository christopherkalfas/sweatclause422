class TrackersController < ApplicationController
    before_action :authenticate!, except: [:index, :show]
    before_action :correct_user, only: [:edit, :update, :destroy]


    

    def index
        @trackers = Tracker.all
    end
    
    
    def new
        @tracker = Tracker.new(challenge_id: params[:challenge_id])
        @tracker.challenge_info
        # @challenge = Challenge.all
    end

    def create
        @tracker = current_user.trackers.build(tracker_params)
        if @tracker.save
            redirect_to challenge_path(@tracker.challenge)
        else
            @error = "You can't have more than one(1) tracker per challenge!" 
            render :new
        end
    end 

    def edit
        @tracker = Tracker.find(params[:id])
        @tracker.challenge_info
    end
    
    def update 

        @tracker = Tracker.find(params[:id])
        if @tracker.update(tracker_params)
            redirect_to challenge_path(@tracker.challenge)
        else
            render :edit
        end 
    end 

    def destroy
        @tracker = Tracker.find(params[:id])
        @tracker.destroy
        redirect_to trackers_path(@atracker)
    end 
private

    def tracker_params 
        params.require(:tracker).permit(:user_id, :challenge_id, :sunday_reps, :monday_reps, :tuesday_reps, :wednesday_reps, :thursday_reps, :friday_reps, :saturday_reps)
    end 

    def correct_user
        @tracker = Tracker.find(params[:id])
        unless @tracker.user == current_user
            redirect_to challenge_path(@tracker.challenge), flash: {alert: "Not your tracker, my dude."}
        end
    end

    

    
    
end
