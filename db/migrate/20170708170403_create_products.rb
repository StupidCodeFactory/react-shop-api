class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.string :code
      t.integer :price_in_cents

      t.timestamps
    end
  end
end
