class CreatePledges < ActiveRecord::Migration[6.0]
  def change
    create_table :pledges do |t|
      t.decimal :amount
      t.boolean :donated, default: false
      t.integer :challenge_id
      t.integer :charity_id
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
