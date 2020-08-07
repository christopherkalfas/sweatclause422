class User < ApplicationRecord
    has_secure_password
    has_many :memberships
    has_many :groups, through: :memberships
    has_many :owned_groups, foreign_key: 'owner_id', class_name: 'Group'
    has_many :trackers
    has_many :challenges, through: :trackers
    has_one_attached :profile_pic
    has_many :pledges


    validates :username, presence: true, uniqueness: true, :on => :create
    before_create { generate_token(:auth_token) }

    def send_password_reset 
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!
        UserMailer.password_reset(self).deliver
    end 
    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end 

    def self.non_admins
        self.all.select {|user| user.admin == false}
    end

    

 


end
