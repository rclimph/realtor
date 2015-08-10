class ActualUnit < ActiveRecord::Base
  belongs_to :unit_template
  belongs_to :building
  has_many :children, class_name: "ActualUnit", foreign_key: "parent_id"
  belongs_to :parent, class_name: "ActualUnit"
end
