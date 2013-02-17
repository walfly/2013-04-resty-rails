require 'spec_helper'

describe "Statuses" do
  let(:valid_attributes) do
   { :content => "testing" }
  end

  before :each do
    3.times { @status = Status.create! valid_attributes }
  end

  describe "POST /statuses" do
    describe "with valid params" do
      it "creates a new Status" do
        expect {
          post "/statuses", :status => valid_attributes
        }.to change(Status, :count).by(1)
      end

      it "returns a 201 Success" do
        post "/statuses", :status => valid_attributes
        response.status.should be(201)
      end
    end
  end

  describe "GET /status/:id" do
    it "returns properly formatted JSON" do
      get "/statuses/3"
      response.body.should eq(@status.to_json)
    end
  end

  describe "PUT /statuses/1" do
    describe "with valid params" do
      it "updates the content of Status 1" do
        put "/statuses/1", :status => { :content => "change text" }
        Status.find(1).content.should eq("change text")
      end

      it "returns a 204 No Content" do
        put "/statuses/1", :status => { :content => "change text" }
        response.status.should be(204)
      end
    end
  end

  describe "DELETE /status/1" do
    it "destroys the requested status" do
      expect {
        delete "/statuses/1"
      }.to change(Status, :count).by(-1)
    end

    it "returns a 204 No Content" do
        delete "/statuses/1"
        response.status.should be(204)
    end
  end

  describe "GET /statuses" do
    it "returns all the records" do
      get "/statuses"
      response.status.should be(200)
      response.body.should have_json_size(3)
    end
  end
end
