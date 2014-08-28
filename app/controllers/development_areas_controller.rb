class DevelopmentAreasController < ApplicationController
  include CustomFormsHelper
  before_action :set_development_area, only: [:show, :edit, :update, :destroy]

  # GET /development_areas
  # GET /development_areas.json
  def index
    @development_areas = DevelopmentArea.all
  end

  # GET /development_areas/1
  # GET /development_areas/1.json
  def show
  end

  # GET /development_areas/new
  def new
    @property_owner = PropertyOwner.find(params[:property_owner_id])
    @development_area = @property_owner.development_areas.new
    @development_area.build_address
  end

  # GET /development_areas/1/edit
  def edit
    @property_owner = PropertyOwner.find(params[:property_owner_id])
    @development_area = @property_owner.development_areas.find(params[:id])
  end

  # POST /development_areas
  # POST /development_areas.json
  def create
    @property_owner = PropertyOwner.find(params[:property_owner_id])
    @development_area = @property_owner.development_areas.new(development_area_params)

    respond_to do |format|
      if @development_area.save
        format.html { redirect_to @property_owner, notice: 'Development area was successfully created.' }
        format.json { render action: 'show', status: :created, location: @development_area }
      else
        format.html { render action: 'new' }
        format.json { render json: @development_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /development_areas/1
  # PATCH/PUT /development_areas/1.json
  def update
    @property_owner = PropertyOwner.find(params[:property_owner_id])
    respond_to do |format|
      if @development_area.update(development_area_params)
        format.html { redirect_to @property_owner, notice: 'Development area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @development_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /development_areas/1
  # DELETE /development_areas/1.json
  def destroy
    @property_owner = PropertyOwner.find(params[:property_owner_id])
    @development_area = DevelopmentArea.find(params[:id])
    @development_area.destroy
    respond_to do |format|
      format.html { redirect_to @property_owner }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_development_area
      @development_area = DevelopmentArea.find(params[:id])
      @property_owner = @development_area.property_owner
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def development_area_params
      params.require(:development_area).permit(:name, :area, :valuation, 
      :address_attributes => [:address_1, :address_2, :city, :region, :zip, :country, :addressable_id, :addressable_type])
    end
end
