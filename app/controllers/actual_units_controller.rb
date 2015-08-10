class ActualUnitsController < ApplicationController
  include SharedHelper
  before_action :set_building, only: [:new, :index, :edit, :update, :destroy]
  def index
    
  end
  
  def new
    session[:building_id] = @building.id
    @actual_unit = @building.actual_units.new(params[:actual_unit])
  end
  
  def create
    @building = Building.find(params[:building_id])
    @actual_unit = @building.actual_units.new(actual_unit_params)
    
    respond_to do |format|
      if @actual_unit.save
        session[:actual_unit_id] = @actual_unit.id # send the newly created unit to next step
        session[:unit_template_id] = params[:unit_template_id] # send the unit_template to use to pre-generate data fields
        format.html { redirect_to actual_unit_wizard_path(:add_subunits), notice: "Step one complete."}
      else
        format.html { render :new }
      end
    end
  end
  
  private
  
  def set_building
    @building = Building.find(params[:building_id])
    @development_area = @building.development_area    
  end
  
  def actual_unit_params
    params.require(:actual_unit).permit(:name, :floor_humanized,  :unit_template_id)
  end
end
