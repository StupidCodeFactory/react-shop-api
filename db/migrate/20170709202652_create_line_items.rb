class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items, id: :uuid do |t|
      t.belongs_to :checkout, index: true, type: :uuid
      t.belongs_to :product, index: true,type: :uuid
    end
  end
end
