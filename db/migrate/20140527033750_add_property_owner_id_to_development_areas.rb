class AddPropertyOwnerIdToDevelopmentAreas < ActiveRecord::Migration
  def change
    add_column :development_areas, :property_owner_id, :integer
  end
end
