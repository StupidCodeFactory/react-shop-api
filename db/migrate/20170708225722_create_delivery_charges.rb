class CreateDeliveryCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_charges, id: :uuid do |t|
      t.integer :amount_in_cents, nil: false, default: 0
      t.int4range :price_range, nil: :false
      t.timestamps
    end
  end
end
