class ChangePledgeAmountToBeIntegerInChallenges < ActiveRecord::Migration[6.0]
  def change
    change_column :challenges, :pledge_amount, :integer
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
