class AddUnitTemplatesToUnitTemplates < ActiveRecord::Migration
  def change
    add_reference :unit_templates, :parent, index: true
  end
end
