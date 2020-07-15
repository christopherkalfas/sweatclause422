class MembershipsController < ApplicationController
   
    def index 
        @memberships = Membership.all 
    end 

    def new 
        @membership = Membership.new 
        @group = current_user.owned_groups
        @users = User.all       
    end 

    def create 
        @membership = Membership.create(membership_params)
        if @membership.save 
            redirect_to group_path(@membership.group)
        else  
            render :new
        end 
    end 

    def destroy 
        @membership = Membership.find(params[:id])
        @membership.destroy 
        redirect_to group_path(@membership.group)
    end
    
 

    private 

    def membership_params 
        params.require(:membership).permit(:user_id, :group_id)
    end 

    def load_group
        @group = Group.find(params[:group_id])
    end
end