class ActualUnit < ActiveRecord::Base
  belongs_to :unit_template
  belongs_to :building
  has_many :children, class_name: "ActualUnit", foreign_key: "parent_id"
  has_many :actual_unit_pricings
  belongs_to :parent, class_name: "ActualUnit"
  accepts_nested_attributes_for :children
  accepts_nested_attributes_for :actual_unit_pricings, allow_destroy: true
  validates_associated :actual_unit_pricings
  validates_uniqueness_of :name, scope: :building_id
  
  def build_subunits
    # this method allows the building of child subunits of a unit for creating a form with the subunit fields with defaults copied over from child unit_templates of the unit_template attached to this subunit
    letter = 'A'
    self.unit_template.children.each do |sub|
      self.children.build(:name => self.name + " " + letter, :floor_humanized => self.floor_humanized, :area_override => sub.area, :furnished_override => sub.furnished, :building_id => self.building_id, :unit_template_id => sub.id)
      letter = letter.next
    end
  end
  
  def build_pricings
    self.unit_template.unit_template_pricings.each do |parent_template_price|
      self.actual_unit_pricings.build(:price_type => parent_template_price.price_type, :pricepersqm => parent_template_price.pricepersqm, :priceperunit => parent_template_price.priceperunit)
    end
    
    self.children.each do |child_unit|
      child_unit.unit_template.unit_template_pricings.each do |child_template_price|
        child_unit.actual_unit_pricings.new(:price_type => child_template_price.price_type, :pricepersqm => child_template_price.pricepersqm, :priceperunit => child_template_price.priceperunit)
      end
    end
  end
end
