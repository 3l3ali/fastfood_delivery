class RenameItemsordersToItemsOrders < ActiveRecord::Migration[5.0]
  def change
    rename_table :itemsorders, :items_orders
  end
end
