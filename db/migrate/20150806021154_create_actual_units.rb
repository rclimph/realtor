class CreateActualUnits < ActiveRecord::Migration
  def change
    create_table :actual_units do |t|
      t.string :name # often the unit number, e.g. 301, 301 A, etc
      t.string :floor_humanized # as humanized
      t.decimal :area_override # overrides AREA in template if need be (such as if the template is an office template and the only variable is small differences in AREA)
      t.integer :building_id # FK
      t.integer :unit_template_id # FK
      t.timestamps
    end
  end
end