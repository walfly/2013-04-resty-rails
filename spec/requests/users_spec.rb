require 'spec_helper'

describe "Users" do
  let(:valid_attributes) do
   { :name => "Jon", :email => "jon@test.com" }
  end

  let(:invalid_attributes) do
    { :name => "Stu", :email => "fake" }
  end

  before :each do
    @user = User.create! :name => "Grace", :email => "gracie@ibm.com"
  end

  describe "POST /users" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post "/users", :user => valid_attributes
        }.to change(User, :count).by(1)
      end

      it "returns a 201 Success" do
        post "/users", :user => valid_attributes
        response.status.should be(201)
      end
    end

    describe "with invalid params" do
      it "does not create a new record" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect {
          post "/users", :user => invalid_attributes
        }.to change(User, :count).by(0)
      end

      it "returns a 400 Bad Request" do
        post "/users", :user => invalid_attributes
        response.status.should be(400)
      end
    end
  end

  describe "GET /user/:id" do
    it "returns properly formatted JSON" do
      get "/users/1"
      response.body.should eq(@user.to_json)
    end
  end

  describe "PUT /users/1" do
    describe "with valid params" do
      it "updates the content of User 1" do
        put "/users/1", :user => { :name => "Mary" }
        User.find(1).name.should eq("Mary")
      end

      it "returns a 204 No Content" do
        put "/users/1", :user => { :name => "Mary" }
        response.status.should be(204)
      end
    end

    describe "with invalid params" do
      it "does not change the record" do
        # Trigger the behavior that occurs when invalid params are submitted
        put "/users/1", :user => { :email => "notvalid" }
        User.find(1).email.should eq("gracie@ibm.com")
      end

      it "returns a 400 Bad Request" do
        put "/users/1", :user => { :email => "notvalid" }
        response.status.should be(400)
      end
    end
  end

  describe "DELETE /user/1" do
    it "destroys the requested user" do
      expect {
        delete "/users/1"
      }.to change(User, :count).by(-1)
    end

    it "returns a 204 No Content" do
        delete "/users/1"
        response.status.should be(204)
    end
  end

  describe "GET /users" do
    it "returns all the records" do
      get "/users"
      response.status.should be(200)
      response.body.should have_json_size(1)
    end
  end
end
