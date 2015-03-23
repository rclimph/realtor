require "spec_helper"

describe UnitTemplateMergingsController do
  describe "routing" do

    it "routes to #index" do
      get("/unit_template_mergings").should route_to("unit_template_mergings#index")
    end

    it "routes to #new" do
      get("/unit_template_mergings/new").should route_to("unit_template_mergings#new")
    end

    it "routes to #show" do
      get("/unit_template_mergings/1").should route_to("unit_template_mergings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/unit_template_mergings/1/edit").should route_to("unit_template_mergings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/unit_template_mergings").should route_to("unit_template_mergings#create")
    end

    it "routes to #update" do
      put("/unit_template_mergings/1").should route_to("unit_template_mergings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/unit_template_mergings/1").should route_to("unit_template_mergings#destroy", :id => "1")
    end

  end
end
