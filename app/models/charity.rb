class Charity < ApplicationRecord
    has_many :challenges
    has_many :pledges
    validates :name, presence: true, uniqueness: true
    validates :description, length:{ maximum: 500 }
    validates :url, :presence => true, :url => true
    has_one_attached :photo


    def total_donations
        Pledge.all.select {|pledge| pledge.charity_id == self.id}.collect{|pled| pled.amount}.reduce()
    end 
end
