class MasterContractsController < ApplicationController
  respond_to :pdf, :html
  before_action :set_master_contract, only: [:show, :edit, :update, :destroy, :viewpdf]

  def viewpdf # A custom member route for viewing PDF of the contract    
    respond_with @master_contract do |format|
      format.pdf do
        @example_text = "Some Txt"
        render :pdf => "contract.pdf",
               :template => 'master_contracts/viewpdf.pdf.erb.haml',
               :footer => {
                 :center => "Contract of Lease",
                 :left => "Left",
                 :right => "Right"
                }
      end
    end
  end
  
  # GET /master_contracts
  # GET /master_contracts.json
  def index
    @master_contracts = MasterContract.all
  end

  # GET /master_contracts/1
  # GET /master_contracts/1.json
  def show
  end

  # GET /master_contracts/new
  def new
    @master_contract = MasterContract.new
  end

  # GET /master_contracts/1/edit
  def edit
  end

  # POST /master_contracts
  # POST /master_contracts.json
  def create
    @master_contract = MasterContract.new(master_contract_params)

    respond_to do |format|
      if @master_contract.save
        format.html { redirect_to @master_contract, notice: 'Master contract was successfully created.' }
        format.json { render action: 'show', status: :created, location: @master_contract }
      else
        format.html { render action: 'new' }
        format.json { render json: @master_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_contracts/1
  # PATCH/PUT /master_contracts/1.json
  def update
    respond_to do |format|
      if @master_contract.update(master_contract_params)
        format.html { redirect_to @master_contract, notice: 'Master contract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @master_contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_contracts/1
  # DELETE /master_contracts/1.json
  def destroy
    @master_contract.destroy
    respond_to do |format|
      format.html { redirect_to master_contracts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_contract
      @master_contract = MasterContract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_contract_params
      params.require(:master_contract).permit(:contract_name, :contract_label, :body)
    end
end
