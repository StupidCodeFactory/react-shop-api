class AddNoPriceRangeOverlapOnDeliveryCharges < ActiveRecord::Migration[5.1]
  def change
    add_index :delivery_charges, :price_range, using: :gist
    reversible do |dir|
      dir.up do
        execute <<-SQL
ALTER TABLE delivery_charges ADD CONSTRAINT no_price_range_overlap EXCLUDE USING gist (price_range WITH &&)
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE delivery_charges
            DROP CONSTRAINT no_price_range_overlap
        SQL
      end
    end
  end
end
