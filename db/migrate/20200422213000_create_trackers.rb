class CreateTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :trackers do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.integer :sunday_reps, default: 0
      t.integer :monday_reps, default: 0
      t.integer :tuesday_reps, default: 0
      t.integer :wednesday_reps, default: 0
      t.integer :thursday_reps, default: 0
      t.integer :friday_reps, default: 0
      t.integer :saturday_reps, default: 0

      t.timestamps
    end
  end
end
