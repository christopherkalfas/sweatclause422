class RemoveOwnerIdFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :owner_id, :integer
  end
end
