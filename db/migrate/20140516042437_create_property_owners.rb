class CreatePropertyOwners < ActiveRecord::Migration
  def change
    create_table :property_owners do |t|
      t.string :company_name
      t.string :email
      t.string :contact_number
      t.string :representative_name
      t.string :representative_position

      t.timestamps
    end
  end
end
