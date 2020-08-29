class CreateThreepls < ActiveRecord::Migration[6.0]
  def change
    create_table :threepls do |t|
      t.float :storage_fees
      t.float :pick_and_pack_fees
      t.integer :number_of_products_can_handle
      t.float :monthly_volume
      t.boolean :api__edi_integration

      t.timestamps
    end
  end
end
