class DropInvitesDropMemberships < ActiveRecord::Migration[6.0]
  def change
    drop_table :memberships
    drop_table :invites
  end
end
