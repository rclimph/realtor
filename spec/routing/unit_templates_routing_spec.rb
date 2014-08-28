require "spec_helper"

describe UnitTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/unit_templates").should route_to("unit_templates#index")
    end

    it "routes to #new" do
      get("/unit_templates/new").should route_to("unit_templates#new")
    end

    it "routes to #show" do
      get("/unit_templates/1").should route_to("unit_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/unit_templates/1/edit").should route_to("unit_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/unit_templates").should route_to("unit_templates#create")
    end

    it "routes to #update" do
      put("/unit_templates/1").should route_to("unit_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/unit_templates/1").should route_to("unit_templates#destroy", :id => "1")
    end

  end
end
