class Pledge < ApplicationRecord
    belongs_to :challenge
    belongs_to :charity
    belongs_to :group
    belongs_to :user
    has_one_attached :donation_image

    accepts_nested_attributes_for :challenge


    def challenge_info
        challenge_group_info
    end

    def challenge_group_info
        self.challenge.group.name
    end 
end
