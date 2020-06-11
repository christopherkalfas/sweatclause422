class User < ApplicationRecord
    has_secure_password
    belongs_to :group
    has_many :trackers
    has_many :challenges, through: :trackers


    validates :username, presence: true, uniqueness: true, :on => :create
    before_create { generate_token(:auth_token) }

    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end 

end
