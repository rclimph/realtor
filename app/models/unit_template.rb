class UnitTemplate < ActiveRecord::Base
  includes SharedHelper
  belongs_to :building
  has_many :unit_template_pricings
  accepts_nested_attributes_for :unit_template_pricings, allow_destroy: true
  validates_numericality_of :sqmprice, allow_blank: true 
  validates_numericality_of :unitprice, allow_blank: true
  validate :name_unique_for_building
  validate :enforce_price_fields
  
  UNIT_TYPES = [ "Residential - Serviced Apartment", "Residential - Apartment", "Office Space", "Commercial", "Warehouse" ]
  UNIT_TYPES_LABEL = "Select Unit Type"
  
  private
  
  def enforce_price_fields
    # Price fields (sqmprice, unitprice) cannot both be filled.  Unitprice can be computed from sqmprice and vice-versa.
    if !(sqmprice.blank? ^ unitprice.blank?)
      errors.add(:base, "Specify a per square meter price or a unit price, not both") unless (sqmprice.blank? and unitprice.blank?)
    end
  end
  
  def name_unique_for_building
    # check that name is unique to building.
    if self.building.unit_templates.find_by_name(self.name)
      errors.add(:base, "A unit template with the same name already exists for this building.")
    end
  end  
end
