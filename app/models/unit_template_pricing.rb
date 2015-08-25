class UnitTemplatePricing < ActiveRecord::Base
  belongs_to :unit_template
  validates_presence_of :price_type
  validates_numericality_of :pricepersqm, allow_blank: true 
  validates_numericality_of :priceperunit, allow_blank: true
  validate :enforce_price_fields
  validates_uniqueness_of :price_type, :scope => :unit_template_id
  before_save :compute_price_fields
  
  PRICING_TYPES = [ 'Monthly Minimum 1 Month', 'Monthly Minimum 3 Months', 'Monthly Minimum 6 Months', 'Monthly Minimum 12 Months', 'Weekly', 'Daily', 'Annually' ]
  
  def enforce_price_fields
    # Price fields (sqmprice, unitprice) cannot both be filled.  Unitprice can be computed from sqmprice and vice-versa.
    # Both fields can be blank (this means units based on this template must set their own pricing.)
    if !(priceperunit.blank? ^ pricepersqm.blank?)
      errors.add(:base, "Specify a per square meter price or a unit price, not both") unless (pricepersqm.blank? and priceperunit.blank?)
    end
  end
  
  def compute_price_fields
    if self.area_exists
      if self.priceperunit
        computed_price = self.priceperunit/self.unit_template.area
        self.pricepersqm = computed_price
      else
        computed_price = self.pricepersqm*self.unit_template.area
        self.priceperunit = computed_price
      end
    end
  end
    
  def area_exists
    return self.unit_template.area
  end 
end
