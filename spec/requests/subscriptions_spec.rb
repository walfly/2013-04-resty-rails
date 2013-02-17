require 'spec_helper'

describe "Subscriptions" do
  let(:datetime) { DateTime.new(2013, 2, 13) }

  let(:valid_attributes) do
   { :renew_date => datetime }
  end

  let(:invalid_attributes) do
    { :renew_date => "not a date" }
  end

  before :each do
    3.times { @subscription = Subscription.create! valid_attributes }
  end

  describe "POST /subscriptions" do
    describe "with valid params" do
      it "creates a new subscription" do
        expect {
          post "/subscriptions", :subscription => valid_attributes
        }.to change(Subscription, :count).by(1)
      end

      it "returns a 201 Success" do
        post "/subscriptions", :subscription => valid_attributes
        response.status.should be(201)
      end
    end

    describe "with invalid params" do
      it "does not create a new record" do
        # Trigger the behavior that occurs when invalid params are submitted
        expect {
          post "/subscriptions", :subscription => invalid_attributes
        }.to change(Subscription, :count).by(0)
      end

      it "returns a 400 Bad Request" do
        post "/subscriptions", :subscription => invalid_attributes
        response.status.should be(400)
      end
    end
  end

  describe "GET /subscription/:id" do
    it "returns properly formatted JSON" do
      get "/subscriptions/3"
      response.body.should eq(@subscription.to_json)
    end
  end

  describe "PUT /subscriptions/1" do
    describe "with valid params" do
      let(:new_date) { DateTime.new(2001,2,3) }

      it "updates the content of subscription 1" do
        put "/subscriptions/1", :subscription => { :renew_date => new_date }
        Subscription.find(1).renew_date.should eq(new_date)
      end

      it "returns a 204 No Content" do
        put "/subscriptions/1", :subscription => { :renew_date => new_date }
        response.status.should be(204)
      end
    end

    describe "with invalid params" do
      it "does not change the record" do
        # Trigger the behavior that occurs when invalid params are submitted
        put "/subscriptions/1", :subscription => { :renew_date => "not a date" }
        Subscription.find(1).renew_date.should eq(datetime)
      end

      it "returns a 400 Bad Request" do
        put "/subscriptions/1", :subscription => { :renew_date => "not a date" }
        response.status.should be(400)
      end
    end
  end

  describe "DELETE /subscription/1" do
    it "destroys the requested subscription" do
      expect {
        delete "/subscriptions/1"
      }.to change(Subscription, :count).by(-1)
    end

    it "returns a 204 No Content" do
        delete "/subscriptions/1"
        response.status.should be(204)
    end
  end

  describe "GET /subscriptions" do
    it "returns all the records" do
      get "/subscriptions"
      response.status.should be(200)
      response.body.should have_json_size(3)
    end
  end
end
