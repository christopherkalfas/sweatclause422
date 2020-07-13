class Group < ApplicationRecord
    has_many :challenges
    has_many :memberships
    has_many :users, through: :memberships
    belongs_to :owner, class_name: 'User', foreign_key: :owner_id

    validates :name, presence: true, uniqueness: true
end
