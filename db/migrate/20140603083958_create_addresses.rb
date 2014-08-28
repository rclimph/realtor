class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :region
      t.string :zip
      t.string :country
      t.integer :addressable_id, :null => false
      t.string :addressable_type, :null => false

      t.timestamps
    end
  end
end
