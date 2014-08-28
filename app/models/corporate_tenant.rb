class CorporateTenant < ActiveRecord::Base
  include ActiveModel::Validations
  validate :check_id_type_selected, :check_expiry_date_after_issue_date
  validates_presence_of :company_name, :business_type, :representative_salutation, :representative_last_name, :representative_position,
  :representative_country_citizenship, :representative_country, :id_number_1, :id_number_2, :id_number_3
  validates_uniqueness_of :company_name
    
  ID_TYPES = [ "Drivers License", "Foreign Passport", "Philippine Passport", "Community Tax Certificate", "OTHER" ]
  ID_LABEL = "Select ID Type"
  
  def check_id_type_selected
    unless id_number_1.blank?
      if id_type_1.blank?
        errors.add(:id_type_1, "Select ID type")
      end
    end
  end

  def check_expiry_date_after_issue_date
    self.check_expiry_dates(id_issued_1, id_expiry_1, :id_expiry_1)
    self.check_expiry_dates(id_issued_2, id_expiry_2, :id_expiry_2)
    self.check_expiry_dates(id_issued_3, id_expiry_3, :id_expiry_3)
  end
  
  def check_expiry_dates(issue_obj, expiry_obj, error_field_obj)
    unless (issue_obj.blank? || expiry_obj.blank?)
      if issue_obj > expiry_obj
        errors.add(error_field_obj, "Expiry before issue date!")
      end
    end
  end
end
