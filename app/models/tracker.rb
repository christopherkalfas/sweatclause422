class Tracker < ApplicationRecord
    belongs_to :user
    belongs_to :challenge

    validates :challenge_id, uniqueness: {scope: :user_id}

    validates :sunday_reps, :monday_reps, :tuesday_reps, :wednesday_reps, :thursday_reps, :friday_reps, :saturday_reps, :numericality => true, length: {maximum: 10}
    def total_reps
        total = self.sunday_reps + self.monday_reps + self.tuesday_reps + self.wednesday_reps + self.thursday_reps + self.friday_reps + self.saturday_reps
    end 
end
