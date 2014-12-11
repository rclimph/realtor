class UnitTemplatePricing < ActiveRecord::Base
  validates_presence_of :price_type
  validates_numericality_of :pricepersqm, allow_blank: true 
  validates_numericality_of :priceperunit, allow_blank: true
  validate :enforce_price_fields
  
  PRICING_TYPES = [ 'Monthly', 'Weekly', 'Daily', 'Annually' ]
  
  private
  
  def enforce_price_fields
    # Price fields (sqmprice, unitprice) cannot both be filled.  Unitprice can be computed from sqmprice and vice-versa.
    # Both fields can be blank (this means units based on this template must set their own pricing.)
    if !(priceperunit.blank? ^ pricepersqm.blank?)
      errors.add(:base, "Specify a per square meter price or a unit price, not both") unless (pricepersqm.blank? and priceperunit.blank?)
    end
  end
end
