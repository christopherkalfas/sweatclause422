class Challenge < ApplicationRecord
    belongs_to :group
    belongs_to :charity
    has_many :trackers

    validates :name, presence: true
    validates :activity_name, presence: true
    validates :activity_reps, numericality: { message: "Must enter a number" }, length: {maximum: 10}
    validates :start_date, :end_date, presence: true
    validate :end_date_after_start_date?


    validates :group_id, presence: true
    validates :charity_id, presence: true 

    before_save :update_end_date
    before_update :update_end_date

    def rank_trackers
        self.trackers.sort_by {|tracker| tracker.total_reps}.reverse!
    end 

    # def next_day(int)
    #     (self.start_date.next_day.day(int))
    # end
        
    def update_end_date
       self.end_date = self.start_date + 7.days

    end 
    # def high_score
    #     if self.trackers.empty?
    #         return "No trackers yet"
    #     else 
    #         self.trackers.max_by {|tracker| tracker.total_reps}
    #     end
    # end

    # def low_score
    #     self.trackers.min_by {|tracker| tracker.total_reps}
    # end

    private
    def end_date_after_start_date?
        return if end_date.blank? || start_date.blank?
        if end_date < start_date
            errors.add(:end_date, "must be after the start date")
        end
    end
end
