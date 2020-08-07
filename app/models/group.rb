class Group < ApplicationRecord
    has_many :challenges
    has_many :memberships
    has_many :charities, through: :challenges
    has_many :users, through: :memberships
    belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  

    validates :name, presence: true, uniqueness: true

    def non_group_memberships 
        Membership.all.select {|mem| mem.group_id != self.id}
    end

    def not_in_group
        User.select {|user| user.groups.pluck(:name).exclude?(self.name)}
    end

    
    def pledges
        self.users.collect {|user| user.pledges}
    end

    def all_pledges
        total = []
        self.users.each do |user|
            if user.pledges_total != nil
            total << user.pledges_total
            end 
        end 
        total.join()
    end 

    def uniq_charities 
        self.charities.uniq
    end 


    # def pledge_challenges
    #     self.pledges.collect {|pledge| pledge.challenge_id }
    # end 

    # def my_pledges
    #     self.pledge_challenges.select {|challenge| challenge.group_id == self.id}
    # end 

    # def all_donations
    #     Pledge.all.select {|pledge| pledge.group_id == self.id}
    # end 

    # def donation_amounts
    #     all_donations.collect {|donat| donat.amount}
    # end

    # def donation_total_value
    #     donation_amounts.reduce()
    # end 



end

