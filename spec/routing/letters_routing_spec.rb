require "spec_helper"

describe LettersController do
  describe "routing" do

    it "routes to #index" do
      get("/letters").should route_to("letters#index")
    end

    it "routes to #new" do
      get("/letters/new").should route_to("letters#new")
    end

    it "routes to #show" do
      get("/letters/1").should route_to("letters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/letters/1/edit").should route_to("letters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/letters").should route_to("letters#create")
    end

    it "routes to #update" do
      put("/letters/1").should route_to("letters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/letters/1").should route_to("letters#destroy", :id => "1")
    end

  end
end
