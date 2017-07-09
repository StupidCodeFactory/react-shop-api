class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_join_table :checkouts, :products, table_name: :line_items
  end
end
