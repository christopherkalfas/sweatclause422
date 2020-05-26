class CharitiesController < ApplicationController
    before_action :authticate!, except:[:index, :show]

    def index 
        @charities = Charity.all
    end 

    def show 
        @charity = Charity.find(params[:id])
    end 

    def new
        @charity = Charity.new
    end

    def def create
        @charity = Charity.new(charity_params)
        if @charity.save
            flash[:success] = "Charity successfully created"
            redirect_to charity_path(@charity)
        else
            flash[:error] = "Something went wrong"
            render :new
        end
    end

    def edit
        @charty = Charity.find(params[:id])
    end
    
    def update
        @charity = Charity.find(params[:id])
        if @charity.update(charity_params)
            flash[:success] = "Charity was successfully updated"
            redirect_to charity_path(@charity)
        else
            flash[:error] = "Something went wrong"
            render :edit
        end
    end

    def destroy 
        @chairty = Charity.find(params[:id])
        @chairty.destroy 
        redirect_to charities_path
    end

    private

    def charity_params
        params.require(:charity).permit(:name, :description, :url)
    end
    
    
    
end 