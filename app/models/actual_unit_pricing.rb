class ActualUnitPricing < ActiveRecord::Base
  belongs_to :actual_unit
  attr_accessor :price, :pricing_basis
  validates_presence_of :price
  validates :pricing_basis, :presence => true
 
  def pricing_basis=(value)
    if value=='Price Per Sqm'
      self.pricepersqm = self.price
      self.priceperunit = self.pricepersqm * self.actual_unit.area_override
    else
      self.priceperunit = self.price
      self.pricepersqm = self.priceperunit / self.actual_unit.area_override
    end
    @pricing_basis = value
  end
end
