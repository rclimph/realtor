class UnitTemplateMergingsController < ApplicationController
  before_action :set_unit_template_merging, only: [:show, :edit, :update, :destroy]

  # GET /unit_template_mergings
  # GET /unit_template_mergings.json
  def index
    @unit_template_mergings = UnitTemplateMerging.all
  end

  # GET /unit_template_mergings/1
  # GET /unit_template_mergings/1.json
  def show
  end

  # GET /unit_template_mergings/new
  def new
    @unit_template_merging = UnitTemplateMerging.new
  end

  # GET /unit_template_mergings/1/edit
  def edit
  end

  # POST /unit_template_mergings
  # POST /unit_template_mergings.json
  def create
    @unit_template_merging = UnitTemplateMerging.new(unit_template_merging_params)

    respond_to do |format|
      if @unit_template_merging.save
        format.html { redirect_to @unit_template_merging, notice: 'Unit template merging was successfully created.' }
        format.json { render action: 'show', status: :created, location: @unit_template_merging }
      else
        format.html { render action: 'new' }
        format.json { render json: @unit_template_merging.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_template_mergings/1
  # PATCH/PUT /unit_template_mergings/1.json
  def update
    respond_to do |format|
      if @unit_template_merging.update(unit_template_merging_params)
        format.html { redirect_to @unit_template_merging, notice: 'Unit template merging was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unit_template_merging.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_template_mergings/1
  # DELETE /unit_template_mergings/1.json
  def destroy
    @unit_template_merging.destroy
    respond_to do |format|
      format.html { redirect_to unit_template_mergings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_template_merging
      @unit_template_merging = UnitTemplateMerging.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_template_merging_params
      params[:unit_template_merging]
    end
end
