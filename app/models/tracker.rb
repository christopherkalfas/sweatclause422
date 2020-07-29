class Tracker < ApplicationRecord
    belongs_to :user
    belongs_to :challenge

    accepts_nested_attributes_for :challenge

    validates :challenge_id, uniqueness: {scope: :user_id}

    validates :sunday_reps, :monday_reps, :tuesday_reps, :wednesday_reps, :thursday_reps, :friday_reps, :saturday_reps, :numericality => true, length: {maximum: 10}
    
    def challenge_info
        challenge_start_date
        challenge_day_two
        challenge_day_three
        challenge_day_four
        challenge_day_five
        challenge_day_six
        challenge_day_seven
    end 
    def challenge_start_date
        self.challenge.start_date.strftime("%a #{self.challenge.start_date.day.ordinalize}")
    end

    def challenge_day_two
        self.challenge.start_date.next_day(1).strftime("%a #{self.challenge.start_date.next_day(1).day.ordinalize}")
    end

    def challenge_day_three
        self.challenge.start_date.next_day(2).strftime("%a #{self.challenge.start_date.next_day(2).day.ordinalize}")
    end

    def challenge_day_four
        self.challenge.start_date.next_day(3).strftime("%a #{self.challenge.start_date.next_day(3).day.ordinalize}")
    end

    def challenge_day_five
        self.challenge.start_date.next_day(4).strftime("%a #{self.challenge.start_date.next_day(4).day.ordinalize}")
    end

    def challenge_day_six
        self.challenge.start_date.next_day(5).strftime("%a #{self.challenge.start_date.next_day(5).day.ordinalize}")
    end

    def challenge_day_seven
        self.challenge.start_date.next_day(6).strftime("%a #{self.challenge.start_date.next_day(6).day.ordinalize}")

    end 

    def total_reps
        total = self.sunday_reps + self.monday_reps + self.tuesday_reps + self.wednesday_reps + self.thursday_reps + self.friday_reps + self.saturday_reps
    end 
end
