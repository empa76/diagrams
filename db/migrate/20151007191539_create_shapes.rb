class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.string :label
      t.string :kind
      t.text :properties
      t.belongs_to :diagram

      t.timestamps null: false
    end
  end
end
