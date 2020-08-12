class Pledge < ApplicationRecord
    belongs_to :challenge
    belongs_to :charity
    belongs_to :user
    has_one_attached :donation_image

   validates :challenge_id, uniqueness: true

    accepts_nested_attributes_for :challenge
    accepts_nested_attributes_for :charity

    def challenge_info
        # challenge_loser
        challenge_pledge
        challenge_group
        challenge_charity_name
        challenge_charity_url
        challenge_charity_url
    end 

    # def challenge_loser 
    #     self.challenge.low_score.user
    # end 

    def challenge_pledge
        self.challenge.pledge_amount
    end
    
    def challenge_group 
        self.challenge.group.name
    end 

    def challenge_charity_name
        self.challenge.charity.name 
    end 

    def challenge_charity_id
        self.challenge.charity.id
    end

    def challenge_charity_url
        self.challenge.charity.url
    end 

    def self.donation_total
        Pledge.all.collect{|p| p.amount}.reduce()
    end 


end
