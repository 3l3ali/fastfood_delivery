class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :apartment
      t.string :city
      t.string :building
      t.string :state
      t.string :zipcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
