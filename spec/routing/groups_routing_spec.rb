require "spec_helper"

describe GroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/groups").should route_to("groups#index")
    end

    it "routes to #show" do
      get("/groups/1").should route_to("groups#show", :id => "1")
    end

    it "routes to #create" do
      post("/groups").should route_to("groups#create")
    end

    it "routes to #update" do
      put("/groups/1").should route_to("groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/groups/1").should route_to("groups#destroy", :id => "1")
    end

  end
end
