class RemoveGroupIdFromPledges < ActiveRecord::Migration[6.0]
  def change
    remove_column :pledges, :group_id 
  end
end
