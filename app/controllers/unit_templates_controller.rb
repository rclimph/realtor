class UnitTemplatesController < ApplicationController
  before_action :set_unit_template, only: [:show, :edit, :update, :destroy]

  # GET /unit_templates
  # GET /unit_templates.json
  def index
    @unit_templates = UnitTemplate.all
  end

  # GET /unit_templates/1
  # GET /unit_templates/1.json
  def show
  end

  # GET /unit_templates/new
  def new
    @building = Building.find(params[:building_id])
    @unit_template = @building.unit_templates.new
  end

  # GET /unit_templates/1/edit
  def edit
  end

  # POST /unit_templates
  # POST /unit_templates.json
  def create
    @building = Building.find(params[:building_id])
    @unit_template = @building.unit_templates.new(unit_template_params)

    respond_to do |format|
      if @unit_template.save
        format.html { redirect_to development_area_building_url(@building.development_area, @building), notice: 'Unit template was successfully created.' }
        format.json { render action: 'show', status: :created, location: @unit_template }
      else
        format.html { render action: 'new' }
        format.json { render json: @unit_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_templates/1
  # PATCH/PUT /unit_templates/1.json
  def update
    respond_to do |format|
      if @unit_template.update(unit_template_params)
        format.html { redirect_to development_area_building_url(@building.development_area, @building), notice: 'Unit template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unit_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_templates/1
  # DELETE /unit_templates/1.json
  def destroy
    @unit_template.destroy
    respond_to do |format|
      format.html { redirect_to development_area_building_url(@building.development_area, @building) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_template
      @unit_template = UnitTemplate.find(params[:id])
      @building = @unit_template.building
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_template_params
      params.require(:unit_template).permit(:name, :unit_type, :furnished, :area, unit_template_pricings_attributes: [:id, :price_type, :pricepersqm, :priceperunit, :_destroy])
    end
    

end
