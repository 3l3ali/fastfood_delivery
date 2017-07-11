class ChangeDefaultValueOnUserRole < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:users, :role, 3)
  end
end
