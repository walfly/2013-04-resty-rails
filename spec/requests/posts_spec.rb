require 'spec_helper'

describe "Posts" do
  let(:valid_attributes) do
   { :title => "New Post", :content => "testing" }
  end

  let(:invalid_attributes) do
    {}
  end

  before :each do
    3.times { @post = Post.create! valid_attributes }
  end

  describe "POST /posts" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post "/posts", :post => valid_attributes
        }.to change(Post, :count).by(1)
      end

      it "returns a 201 Success" do
        post "/posts", :post => valid_attributes
        response.status.should be(201)
      end
    end

    describe "with invalid params" do
      it "does not create a new record" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect {
          post "/posts", :post => invalid_attributes
        }.to change(Post, :count).by(0)
      end

      it "returns a 400 Bad Request" do
        post "/posts", :post => invalid_attributes
        response.status.should be(400)
      end
    end
  end

  describe "GET /post/:id" do
    it "returns properly formatted JSON" do
      get "/posts/3"
      response.body.should eq(@post.to_json)
    end
  end

  describe "PUT /posts/1" do
    describe "with valid params" do
      it "updates the content of Post 1" do
        put "/posts/1", :post => { :content => "change text" }
        Post.find(1).content.should eq("change text")
      end

      it "returns a 204 No Content" do
        put "/posts/1", :post => { :content => "change text" }
        response.status.should be(204)
      end
    end

    describe "with invalid params" do
      it "does not change the record" do
        # Trigger the behavior that occurs when invalid params are submitted
        put "/posts/1", :post => { :content => nil }
        Post.find(1).content.should eq("testing")
      end

      it "returns a 400 Bad Request" do
        put "/posts/1", :post => { :content => nil }
        response.status.should be(400)
      end
    end
  end

  describe "DELETE /post/1" do
    it "destroys the requested post" do
      expect {
        delete "/posts/1"
      }.to change(Post, :count).by(-1)
    end

    it "returns a 204 No Content" do
        delete "/posts/1"
        response.status.should be(204)
    end
  end

  describe "GET /posts" do
    it "returns all the records" do
      get "/posts"
      response.status.should be(200)
      response.body.should have_json_size(3)
    end
  end
end
