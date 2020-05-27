class Charity < ApplicationRecord
    has_many :challenges
    validates :name, presence: true

end
