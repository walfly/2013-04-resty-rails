require "spec_helper"

describe CommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/comments").should route_to("comments#index")
    end

    it "routes to #show" do
      get("/comments/1").should route_to("comments#show", :id => "1")
    end

    it "routes to #create" do
      post("/comments").should route_to("comments#create")
    end

    it "routes to #update" do
      put("/comments/1").should route_to("comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/comments/1").should route_to("comments#destroy", :id => "1")
    end
  end
end
