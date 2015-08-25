class ActualUnitWizardController < ApplicationController
  include Wicked::Wizard
  steps :override, :add_pricings
  
  def show
    @actual_unit = ActualUnit.find(session[:actual_unit_id])
    @building = @actual_unit.building
    @unit_templates = @actual_unit.building.unit_templates
    # RECENTLY ADDED BELOW
    case step
#    when :add_subunits
#      @actual_unit.build_subunits # SUBUNITS DISABLED
    when :add_pricings
      unless @actual_unit.actual_unit_pricings.any?
        @actual_unit.build_pricings # only build pricings from template if pricings don't already exist.  They will exist if this is an EDIT/UPDATE
      end
    end
    
    
    # RECENTLY ADDED ABOVE
    # ADDED FOR PRICING
    # @actual_unit.build_pricings if :add_pricings_step # builds pricing for ALL including children units
    # ADDED FOR PRICING
    if @actual_unit.furnished_override.nil?
      @actual_unit.furnished_override = @actual_unit.unit_template.furnished
    end
    if @actual_unit.area_override.nil?
      @actual_unit.area_override = @actual_unit.unit_template.area
    end
    render_wizard
  end
  
  def update
    @actual_unit = ActualUnit.find(session[:actual_unit_id])
    case step
    when :override
      @actual_unit.update_attributes(actual_unit_params)
#    when :add_subunits 
 #     @actual_unit.update_attributes(actual_subunit_params) DISABLED SUBUNITS
    when :add_pricings
      @actual_unit.update_attributes(actual_unit_pricing_params)
    end
    render_wizard @actual_unit
  end
  
  private
    
  def actual_unit_params
    params.require(:actual_unit).permit(:name, :floor_humanized, :area_override, :furnished_override, :unit_template_id, :furnished, :building_id)
  end
  
  def actual_subunit_params
    params.require(:actual_unit).permit(children_attributes: [:id, :name, :floor_humanized, :area_override, :furnished_override, :building_id, :unit_template_id])
  end
  
  def actual_unit_pricing_params
    params.require(:actual_unit).permit(actual_unit_pricings_attributes: [ :id, :price_type, :pricepersqm, :priceperunit, :actual_unit_id, :price, :pricing_basis], children_attributes: [ :id, actual_unit_pricings_attributes: [ :price_type, :pricepersqm, :priceperunit, :actual_unit_id]])
  end
    
end
