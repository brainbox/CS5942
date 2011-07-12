require "spec_helper"

describe LetterCampaignsController do
  describe "routing" do

    it "routes to #index" do
      get("/letter_campaigns").should route_to("letter_campaigns#index")
    end

    it "routes to #new" do
      get("/letter_campaigns/new").should route_to("letter_campaigns#new")
    end

    it "routes to #show" do
      get("/letter_campaigns/1").should route_to("letter_campaigns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/letter_campaigns/1/edit").should route_to("letter_campaigns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/letter_campaigns").should route_to("letter_campaigns#create")
    end

    it "routes to #update" do
      put("/letter_campaigns/1").should route_to("letter_campaigns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/letter_campaigns/1").should route_to("letter_campaigns#destroy", :id => "1")
    end

  end
end
