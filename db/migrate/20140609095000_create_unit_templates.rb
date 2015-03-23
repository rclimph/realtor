class CreateUnitTemplates < ActiveRecord::Migration
  def change
    create_table :unit_templates do |t|
      t.string :name
      t.string :unit_type
      t.boolean :furnished
      t.decimal :area
      t.decimal :sqmprice
      t.decimal :unitprice
      t.boolean :has_merged, :default => false  # if TRUE the unit consists of child units under it that can be merged together
      #t.integer :floor
      
      # FKs
      t.integer :building_id

      t.timestamps
    end
  end
end
