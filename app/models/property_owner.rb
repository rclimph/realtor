class PropertyOwner < ActiveRecord::Base
  include ActiveModel::Validations
  has_many :development_areas, dependent: :destroy
  has_one :address, :as => :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
  validate :company_name_or_representative_must_exist
  validates :email, email: true
  validates_uniqueness_of :company_name
  
  def company_name_or_representative_must_exist
    if company_name.blank? && representative_name.blank?
      errors.add(:company_name, "Company Name or Representative Required")
    end
  end
  
end
