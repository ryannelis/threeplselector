class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.float :length
      t.float :width
      t.float :height
      t.float :weight
      t.string :name
      t.integer :user_id
      t.integer :units_shipped_per_month

      t.timestamps
    end
  end
end
