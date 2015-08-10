class ActualUnitWizardController < ApplicationController
  include Wicked::Wizard
  steps :add_subunits
  
  def show
    @actual_unit = ActualUnit.find(session[:actual_unit_id])
    @building = @actual_unit.building
    @unit_templates = @actual_unit.building.unit_templates
    @actual_unit.area_override = @actual_unit.unit_template.area
    render_wizard
  end
  

end
