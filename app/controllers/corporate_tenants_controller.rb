class CorporateTenantsController < ApplicationController
  include CustomFormsHelper
  def index
    @corporate_tenants = CorporateTenant.all
  end
  
  def new
    @corporate_tenant = CorporateTenant.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tenant }
    end
  end
  
  def edit
    @corporate_tenant = CorporateTenant.find(params[:id])
  end
  
  def create
    @corporate_tenant = CorporateTenant.new(corporate_tenants_params)
    
    respond_to do |format|
      if @corporate_tenant.save
        format.html { redirect_to( corporate_tenant_path(@corporate_tenant), :notice => 'Tenant successfully created.') } 
      else
        format.html { render new_corporate_tenant_path }
      end
    end
  end
  
  def update
    @corporate_tenant = CorporateTenant.find(params[:id])
    
    respond_to do |format|
      if @corporate_tenant.update(corporate_tenants_params)
        format.html { redirect_to @corporate_tenant, :notice => 'Tenant updated.'}
      else
        format.html { render action: 'edit'}
      end
    end
  end
  
  def show
    @t = CorporateTenant.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def corporate_tenants_params
    params.require(:corporate_tenant).permit!
  end
end
