class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :activity_name
      t.integer :activity_reps
      t.integer :group_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
