class Tracker < ApplicationRecord
    belongs_to :user
    belongs_to :challenge

    def total_reps
        total = self.sunday_reps + self.monday_reps + self.tuesday_reps + self.wednesday_reps + self.thursday_reps + self.friday_reps + self.saturday_reps
    end 
end
