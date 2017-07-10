class CreateItemsorders < ActiveRecord::Migration[5.0]
  def change
    create_table :itemsorders do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.text :instruction

      t.timestamps
    end
  end
end
