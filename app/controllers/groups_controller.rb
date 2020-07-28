class GroupsController < ApplicationController
    before_action :authenticate!, except: [:index, :show]
    def index
        @groups = Group.all
    end

    def show
        @group = Group.find(params[:id])
    end

    def new
        @group = Group.new
    end
    

    def create 
        @group = Group.create(group_params)
        @group.owner_id = current_user.id if current_user
            if @group.save 
                Membership.create(group_id: "#{@group.id}", user_id: "#{@current_user.id}")
                flash[:success] = "Successfully created a new group!"
                redirect_to group_path(@group)
            else 
                flash[:error] = "Something went wrongzo!"
                render :new
            end 
    end

    def edit 
        @group = Group.find(params[:id])
        # @users = @group.not_in_group
        @users = User.all
    end 

    def update 
        @group = Group.find(params[:id])
        @user = User.find(params["user"]["id"])
        @group.users << @user
        if @group.update(group_params)
            flash[:success] = "Successfully updated the Group"
            redirect_to group_path(@group)
        else
            render :edit
        end 
    end 
    
    def destroy 
        @group = Group.find(params[:id])
        @group.destroy
        flash[:alert] = "Successfully destroyed..."
        redirect_to groups_path
    end 

    private 

    def group_params 
        params.require(:group).permit(:name)
    end 
end
