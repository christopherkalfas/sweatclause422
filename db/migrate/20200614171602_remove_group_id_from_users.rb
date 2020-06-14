class RemoveGroupIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :group_id, :integer
  end
end
