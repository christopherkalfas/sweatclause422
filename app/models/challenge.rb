class Challenge < ApplicationRecord
    belongs_to :group
    has_many :trackers

    validates :name, presence: true
    validates :group_id, presence: true

end
