class Group < ApplicationRecord
    has_many :challenges
    has_many :memberships
    has_many :charities, through: :challenges
    has_many :users, through: :memberships
    belongs_to :owner, class_name: 'User', foreign_key: :owner_id
    has_many :pledges

    validates :name, presence: true, uniqueness: true

    def non_group_memberships 
        Membership.all.select {|mem| mem.group_id != self.id}
    end

    def not_in_group
        User.select {|user| user.groups.pluck(:name).exclude?(self.name)}
    end

    def all_donations
        Pledge.all.select {|pledge| pledge.group_id == self.id}
    end 

    def donation_amounts
        all_donations.collect {|donat| donat.amount}
    end

    def donation_total_value
        donation_amounts.reduce()
    end 



end

