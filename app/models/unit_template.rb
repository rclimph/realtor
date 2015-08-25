class UnitTemplate < ActiveRecord::Base
  includes SharedHelper
  has_many :actual_units, dependent: :destroy
  belongs_to :building
  has_many :unit_template_pricings
  has_many :children, class_name: "UnitTemplate", foreign_key: "parent_id"
  belongs_to :parent, class_name: "UnitTemplate"
  accepts_nested_attributes_for :unit_template_pricings, allow_destroy: true
  validates_numericality_of :sqmprice, allow_blank: true 
  validates_numericality_of :unitprice, allow_blank: true
  validates_uniqueness_of :name, scope: :building_id
  validate :enforce_price_fields
  
  UNIT_TYPES = [ "Office", "Commercial", "Warehouse" ]
  UNIT_TYPES_LABEL = "Select Unit Type"

  def has_merged_units?
    # if this unit has merged units that form it, then it should have children.  if not then it is either a regular unit or a merged unit (a unit that has a parent but itself does not have merged units under it)
    return self.children.any?  
  end
  
  def is_a_merged_unit?
    # if this is a merged unit, then it should have a parent.  This method is used to determine if a unit_template is a merged unit that belongs to another unit (parent)
    return self.parent.nil? ? false : true
  end
  
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
