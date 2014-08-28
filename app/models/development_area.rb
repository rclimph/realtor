class DevelopmentArea < ActiveRecord::Base
  belongs_to :property_owner
  has_one :address, :as => :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :buildings
end
