require "spec_helper"

describe PropertyOwnersController do
  describe "routing" do

    it "routes to #index" do
      get("/property_owners").should route_to("property_owners#index")
    end

    it "routes to #new" do
      get("/property_owners/new").should route_to("property_owners#new")
    end

    it "routes to #show" do
      get("/property_owners/1").should route_to("property_owners#show", :id => "1")
    end

    it "routes to #edit" do
      get("/property_owners/1/edit").should route_to("property_owners#edit", :id => "1")
    end

    it "routes to #create" do
      post("/property_owners").should route_to("property_owners#create")
    end

    it "routes to #update" do
      put("/property_owners/1").should route_to("property_owners#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/property_owners/1").should route_to("property_owners#destroy", :id => "1")
    end

  end
end
