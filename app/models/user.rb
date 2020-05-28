class User < ApplicationRecord
    has_secure_password
    belongs_to :group
    has_many :trackers
    has_many :challenges, through: :trackers


    validates :username, presence: true, uniqueness: true, :on => :create
    validates :password, presence: true, length: { minimum: 4}

end
