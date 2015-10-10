class DeleteUserAndShares < ActiveRecord::Migration
  def change
    drop_table :users
    drop_table :shares
  end
end
