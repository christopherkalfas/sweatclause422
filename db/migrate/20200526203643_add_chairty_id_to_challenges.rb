class AddChairtyIdToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :charity_id, :integer
  end
end
