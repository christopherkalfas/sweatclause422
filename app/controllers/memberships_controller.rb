class MembershipsContoller < ApplicationRecord

    def create 
        @group = Group.find(params[:group])
        @membership = current_user.memberships.build(group: @group)
        @group.members << current_user 

        if @membership.save 
            flash[:notice] = "Joined #{@group.name}"
        else 
            flash[:notice] = "Not able to join the group"
        end 
        redirect_to groups_url
    end 

    def destroy 
        @membership = current_user.memberships.find(params[:id])
        @group = @membership.group

        if @group.owner == current_user 
            @group.destroy 
            flash[:notice] = "Group has been deleted."
            redirect_to groups_path 
        else  
            @membership.destroy 
            flash[:notice] = "You left the group"
            redirect_to groups_path
        end 
    end 
end 