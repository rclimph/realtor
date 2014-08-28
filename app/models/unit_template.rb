class UnitTemplate < ActiveRecord::Base
  includes SharedHelper
  belongs_to :building
  

end
