class AddActualUnitsToActualUnits < ActiveRecord::Migration
  def change
    add_reference :actual_units, :parent, index: true
  end
end
