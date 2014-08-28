class AddDevelopmentAreaIdToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :development_area_id, :integer
  end
end
