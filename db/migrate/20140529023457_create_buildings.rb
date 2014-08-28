class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :building_type
      t.boolean :address_same_as_development
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :zip
      t.string :country
      t.integer :lowest_floor
      t.integer :highest_floor

      t.timestamps
    end
  end
end
