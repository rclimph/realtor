class ActualUnitsController < ApplicationController
  include SharedHelper
  before_action :set_building, only: [:index, :edit, :update, :destroy]
  def index
    
  end
  
  private
  
  def set_building
    @building = Building.find(params[:building_id])
    @development_area = @building.development_area    
  end
end
