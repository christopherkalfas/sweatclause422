class Tracker < ApplicationRecord
    belongs_to :user
    belongs_to :challenge
end
