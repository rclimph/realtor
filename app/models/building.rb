class Building < ActiveRecord::Base
  include SharedHelper
  belongs_to :development_area
  has_one :address, :as => :addressable, dependent: :destroy
  has_many :unit_templates, dependent: :destroy
  has_many :actual_units, dependent: :destroy
  accepts_nested_attributes_for :address

  BUILDING_TYPES = [ 'PEZA Certified Office Building', 'Office', 'Office and Commercial', 'Commercial',
                     'Mixed-Use Apartment and Commercial', 'Apartment', 'Serviced Apartment', 'Residential Condominium', 'Hotel', 'Warehouse',
                     'PEZA Certified Warehouse', 'Subdivision House', 'Standalone House', 'Raw Land' ]
  BUILDING_TYPES_LABEL = [ 'Select Building Type']
  
  def unit_templates_regular
    # This returns all unit templates that are not merged units (e.g. units that do not have a parent unit)
    # regular unit templates are simply unit templates that have no parents (e.g. they are not merged units)
    regular_units = []
    self.unit_templates.each do |t|
      unless t.is_a_merged_unit?
        regular_units << t
      end
    end
    return regular_units
  end

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

  def total_floors
    return self.highest_floor - self.lowest_floor
  end
  
  def floors_humanized
    floors_array = []
    for f in self.lowest_floor..self.highest_floor
      floors_array << floor_humanized(f) unless f == 0 # the 0th floor doesn't count (its not a floor)
    end
    return floors_array
  end

end