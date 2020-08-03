class Charity < ApplicationRecord
    has_many :challenges
    validates :name, presence: true, uniqueness: true
    validates :description, length:{ maximum: 500 }
    validates :url, :presence => true, :url => true
    has_one_attached :photo



end
