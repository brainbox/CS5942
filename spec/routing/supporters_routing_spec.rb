require "spec_helper"

describe SupportersController do
  describe "routing" do

    it "routes to #index" do
      get("/supporters").should route_to("supporters#index")
    end

    it "routes to #new" do
      get("/supporters/new").should route_to("supporters#new")
    end

    it "routes to #show" do
      get("/supporters/1").should route_to("supporters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/supporters/1/edit").should route_to("supporters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/supporters").should route_to("supporters#create")
    end

    it "routes to #update" do
      put("/supporters/1").should route_to("supporters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/supporters/1").should route_to("supporters#destroy", :id => "1")
    end

  end
end
