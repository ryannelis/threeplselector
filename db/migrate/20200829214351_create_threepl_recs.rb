class CreateThreeplRecs < ActiveRecord::Migration[6.0]
  def change
    create_table :threepl_recs do |t|
      t.integer :product_id
      t.integer :three_pl_id
      t.boolean :selected

      t.timestamps
    end
  end
end
