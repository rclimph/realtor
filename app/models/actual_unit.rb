class ActualUnit < ActiveRecord::Base
  belongs_to :unit_template
  belongs_to :building
end
