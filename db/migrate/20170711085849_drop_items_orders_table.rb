class DropItemsOrdersTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :items_orders
  end
end
