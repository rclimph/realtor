class Building < ActiveRecord::Base
  include SharedHelper
  belongs_to :development_area
  has_one :address, :as => :addressable, dependent: :destroy
  has_many :unit_templates, dependent: :destroy
  accepts_nested_attributes_for :address
  
  BUILDING_TYPES = [ 'PEZA Certified Office Building', 'Office', 'Office and Commercial', 'Commercial',
                     'Mixed-Use Apartment and Commercial', 'Apartment', 'Serviced Apartment', 'Residential Condominium', 'Hotel', 'Warehouse',
                     'PEZA Certified Warehouse', 'Subdivision House', 'Standalone House', 'Raw Land' ]
  BUILDING_TYPES_LABEL = [ 'Select Building Type']
  
  def copy_address_if_same(development_area)
    if self[:address_same_as_development]
      self.address = development_area.address
    end
  end
  
  def update_copy_address_if_same(b_params)
    dev = self.development_area
    return_val = true
    transaction do
      if !self.update!(b_params)
        return_val = false
      end
      if self[:address_same_as_development]
        if !self.address.update!(address_1: dev.address.address_1,
                  address_2: dev.address.address_2,
                  city: dev.address.city,
                  zip: dev.address.zip,
                  region: dev.address.region,
                  country: dev.address.country)
          return_val = false
        end
      end
    end
    return return_val
  end
  
  def highest_floor_humanized
    return floor_humanized(self.highest_floor)
  end
  
  def lowest_floor_humanized
    return floor_humanized(self.lowest_floor)
  end

end