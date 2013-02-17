require 'spec_helper'

describe "Groups" do
  let(:valid_attributes) do
   { :name => "We like to test", :motto => "Testing is the best" }
  end

  let(:invalid_attributes) do
    {}
  end

  before :each do
    Group.create! valid_attributes.merge( :name => "new Group" ) 
    @group = Group.create! valid_attributes.merge( :name => "keep it unique" )
  end

  describe "POST /groups" do
    describe "with valid params" do
      it "creates a new Group" do
        expect {
          post "/groups", :group => valid_attributes
        }.to change(Group, :count).by(1)
      end

      it "returns a 201 Success" do
        post "/groups", :group => valid_attributes
        response.status.should be(201)
      end
    end

    describe "with invalid params" do
      it "does not create a new record" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect {
          post "/groups", :group => invalid_attributes
        }.to change(Group, :count).by(0)
      end

      it "returns a 400 Bad Request" do
        post "/groups", :group => invalid_attributes
        response.status.should be(400)
      end
    end
  end

  describe "GET /group/:id" do
    it "returns properly formatted JSON" do
      get "/groups/2"
      response.body.should eq(@group.to_json)
    end
  end

  describe "PUT /groups/1" do
    describe "with valid params" do
      it "updates the content of Group 1" do
        put "/groups/1", :group => { :motto => "change text" }
        Group.find(1).motto.should eq("change text")
      end

      it "returns a 204 No Content" do
        put "/groups/1", :group => { :motto => "change text" }
        response.status.should be(204)
      end
    end

    describe "with invalid params" do
      it "does not change the record" do
        # Trigger the behavior that occurs when invalid params are submitted
        put "/groups/1", :group => { :motto => nil }
        Group.find(1).motto.should eq("Testing is the best")
      end

      it "returns a 400 Bad Request" do
        put "/groups/1", :group => { :motto => nil }
        response.status.should be(400)
      end
    end
  end

  describe "DELETE /groups/1" do
    it "destroys the requested group" do
      expect {
        delete "/groups/1"
      }.to change(Group, :count).by(-1)
    end

    it "returns a 204 No Content" do
        delete "/groups/1"
        response.status.should be(204)
    end
  end

  describe "GET /groups" do
    it "returns all the records" do
      get "/groups"
      response.status.should be(200)
      response.body.should have_json_size(2)
    end
  end
end
