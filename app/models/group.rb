class Group < ApplicationRecord
    has_many :challenges
    has_many :memberships
    has_many :users, through: :memberships
    belongs_to :owner, class_name: 'User', foreign_key: :owner_id

    validates :name, presence: true, uniqueness: true

    def non_group_memberships 
        Membership.all.select {|mem| mem.group_id != self.id}
    end

    def not_in_group
        User.select {|user| user.groups.pluck(:name).exclude?(self.name)}
    end



end

