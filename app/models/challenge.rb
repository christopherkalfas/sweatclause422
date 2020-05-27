class Challenge < ApplicationRecord
    belongs_to :group
    belongs_to :charity
    has_many :trackers

    validates :name, presence: true
    validates :group_id, presence: true

    def rank_trackers
        self.trackers.sort_by {|tracker| tracker.total_reps}.reverse!
    end 
end
