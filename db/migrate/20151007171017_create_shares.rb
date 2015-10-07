class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.belongs_to :user
      t.belongs_to :diagram
      t.timestamps null: false
    end
  end
end
