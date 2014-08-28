class CreateCorporateTenants < ActiveRecord::Migration
  def self.up
    create_table :corporate_tenants do |t|
      t.string :company_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :province
      t.string :company_country
      t.string :zip
      t.string :business_type
      
      t.string :representative_position
      t.string :representative_last_name
      t.string :representative_middle_name
      t.string :representative_first_name
      t.string :representative_salutation
      t.string :representative_country_citizenship
      t.string :representative_address_1
      t.string :representative_address_2
      t.string :representative_city
      t.string :representative_province
      t.string :representative_country
      t.string :representative_zip
      

      t.string :id_type_1
      t.string :id_number_1
      t.date :id_issued_1
      t.date :id_expiry_1
      t.string :issue_place_1
    
      t.string :id_type_2
      t.string :id_number_2
      t.date :id_issued_2
      t.date :id_expiry_2
      t.string :issue_place_2
    
      t.string :id_type_3
      t.string :id_number_3
      t.date :id_issued_3
      t.date :id_expiry_3
      t.string :issue_place_3
      
      t.integer :contract_id #FK
      t.timestamps
    end
  end

  def self.down
    drop_table :corporate_tenants
  end
end