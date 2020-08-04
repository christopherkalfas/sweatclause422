class AddPledgeAmountToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :pledge_amount, :decimal
  end
end
