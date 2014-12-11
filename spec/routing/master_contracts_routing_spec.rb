require "spec_helper"

describe MasterContractsController do
  describe "routing" do

    it "routes to #index" do
      get("/master_contracts").should route_to("master_contracts#index")
    end

    it "routes to #new" do
      get("/master_contracts/new").should route_to("master_contracts#new")
    end

    it "routes to #show" do
      get("/master_contracts/1").should route_to("master_contracts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/master_contracts/1/edit").should route_to("master_contracts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/master_contracts").should route_to("master_contracts#create")
    end

    it "routes to #update" do
      put("/master_contracts/1").should route_to("master_contracts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/master_contracts/1").should route_to("master_contracts#destroy", :id => "1")
    end

  end
end
