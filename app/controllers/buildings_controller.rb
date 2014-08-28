class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = Building.all
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
  end

  # GET /buildings/new
  def new
    @development_area = DevelopmentArea.find(params[:development_area_id])
    @building = @development_area.buildings.new
    @building.build_address
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @development_area = DevelopmentArea.find(params[:development_area_id])
    @building = @development_area.buildings.new(building_params)
    
    if @building.address_same_as_development
      @building.address = @development_area.address
    end
    
    respond_to do |format|
      if @building.save
        format.html { redirect_to @development_area, notice: 'Building was successfully created.' }
        format.json { render action: 'show', status: :created, location: @building }
      else
        format.html { render action: 'new' }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|
      if @building.update_copy_address_if_same(building_params)
        format.html { redirect_to @development_area, notice: 'Building was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
      @development_area = @building.development_area
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_params
      params.require(:building).permit(:name, :building_type, :address_same_as_development, :highest_floor, :lowest_floor,
      :address_attributes => [:address_1, :address_2, :city, :region, :zip, :country, :addressable_id, :addressable_type])
    end
end
