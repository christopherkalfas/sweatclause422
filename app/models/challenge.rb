class Challenge < ApplicationRecord
    belongs_to :group
    belongs_to :charity
    has_many :trackers

    validates :name, presence: true
    validates :group_id, presence: true

    def rank_trackers
        self.trackers.sort_by {|tracker| tracker.total_reps}.reverse!
    end 

    def high_score
        if self.trackers.blank?
            return "No trackers yet"
        else 
            self.trackers.max_by {|tracker| tracker.total_reps}
    end

    def low_score
        self.trackers.min_by {|tracker| tracker.total_reps}
    end
end
