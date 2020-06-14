class Group < ApplicationRecord
    has_many :challenges
    has_many :memberships
    has_many :members, through: :memberships, source: :user
    belongs_to :owner, :class_name => 'User', foreign_key: :owner_id
    has_many :invites

    validates :name, presence: true, uniqueness: true
end
