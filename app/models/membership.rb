class Membership < ApplicationRecord
    belongs_to :user
    belongs_to :group

    def not_in_group
        User.select {|user| user.groups.pluck(:name).exclude?(group.name)}
    end 
end
