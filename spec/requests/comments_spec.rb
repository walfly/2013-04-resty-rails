require 'spec_helper'

describe "Comments" do
  let(:valid_attributes) do
   { :content => "testing" }
  end

  let(:invalid_attributes) do
    {}
  end

  before :each do
    3.times { @comment = Comment.create! valid_attributes }
  end

  describe "POST /comments" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post "/comments", :comment => valid_attributes
        }.to change(Comment, :count).by(1)
      end

      it "returns a 201 Success" do
        post "/comments", :comment => valid_attributes
        response.status.should be(201)
      end
    end

    describe "with invalid params" do
      it "does not create a new record" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect {
          post "/comments", :comment => invalid_attributes
        }.to change(Comment, :count).by(0)
      end

      it "returns a 400 Bad Request" do
        post "/comments", :comment => invalid_attributes
        response.status.should be(400)
      end
    end
  end

  describe "GET /comment/:id" do
    it "returns properly formatted JSON" do
      get "/comments/3"
      response.body.should eq(@comment.to_json)
    end
  end

  describe "PUT /comments/1" do
    describe "with valid params" do
      it "updates the content of Comment 1" do
        put "/comments/1", :comment => { :content => "change text" }
        Comment.find(1).content.should eq("change text")
      end

      it "returns a 204 No Content" do
        put "/comments/1", :comment => { :content => "change text" }
        response.status.should be(204)
      end
    end

    describe "with invalid params" do
      it "does not change the record" do
        # Trigger the behavior that occurs when invalid params are submitted
        put "/comments/1", :comment => { :content => nil }
        Comment.find(1).content.should eq("testing")
      end

      it "returns a 400 Bad Request" do
        put "/comments/1", :comment => { :content => nil }
        response.status.should be(400)
      end
    end
  end

  describe "DELETE /comment/1" do
    it "destroys the requested comment" do
      expect {
        delete "/comments/1"
      }.to change(Comment, :count).by(-1)
    end

    it "returns a 204 No Content" do
        delete "/comments/1"
        response.status.should be(204)
    end
  end

  describe "GET /comments" do
    it "returns all the records" do
      get "/comments"
      response.status.should be(200)
      response.body.should have_json_size(3)
    end
  end
end
