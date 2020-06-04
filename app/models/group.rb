class Group < ApplicationRecord
    has_many :challenges
    has_many :users

    validates :name, presence: true, uniqueness: true
end
