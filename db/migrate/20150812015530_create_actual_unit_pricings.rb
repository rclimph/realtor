class CreateActualUnitPricings < ActiveRecord::Migration
  def change
    create_table :actual_unit_pricings do |t|
      t.string :price_type
      t.decimal :pricepersqm  # only used to calculate price per unit
      t.decimal :priceperunit # this is the unit measure used in contracts or guest agreement forms
      t.integer :actual_unit_id #FK
      t.timestamps
    end
  end
end
