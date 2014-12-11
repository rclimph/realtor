class CreateUnitTemplatePricings < ActiveRecord::Migration
  def change
    create_table :unit_template_pricings do |t|
      t.string :price_type
      t.decimal :pricepersqm
      t.decimal :priceperunit
      t.integer :unit_template_id

      t.timestamps
    end
  end
end
