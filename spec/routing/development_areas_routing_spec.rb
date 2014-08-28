require "spec_helper"

describe DevelopmentAreasController do
  describe "routing" do

    it "routes to #index" do
      get("/development_areas").should route_to("development_areas#index")
    end

    it "routes to #new" do
      get("/development_areas/new").should route_to("development_areas#new")
    end

    it "routes to #show" do
      get("/development_areas/1").should route_to("development_areas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/development_areas/1/edit").should route_to("development_areas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/development_areas").should route_to("development_areas#create")
    end

    it "routes to #update" do
      put("/development_areas/1").should route_to("development_areas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/development_areas/1").should route_to("development_areas#destroy", :id => "1")
    end

  end
end
