class CreateDevelopmentAreas < ActiveRecord::Migration
  def change
    create_table :development_areas do |t|
      t.string :name
      t.decimal :area, :precision => 8, :scale => 2
      t.decimal :valuation, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
