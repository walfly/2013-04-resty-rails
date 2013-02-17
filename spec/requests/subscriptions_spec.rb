require 'spec_helper'

# This should return the minimal set of attributes required to create a valid
# User. As you add validations to User, be sure to
# update the return value of this method accordingly.
def valid_attributes
    {  }
end

describe "Subscriptions" do
  describe "GET /subscriptions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get subscriptions_path
      response.status.should be(200)
    end
  end

  describe "GET index" do
    it "assigns all subscriptions as @subscriptions" do
      subscription = Subscription.create! valid_attributes
      get :index, {}, valid_session
      assigns(:subscriptions).should eq([subscription])
    end
  end

  describe "GET show" do
    it "assigns the requested subscription as @subscription" do
      subscription = Subscription.create! valid_attributes
      get :show, {:id => subscription.to_param}, valid_session
      assigns(:subscription).should eq(subscription)
    end
  end

  describe "GET new" do
    it "assigns a new subscription as @subscription" do
      get :new, {}, valid_session
      assigns(:subscription).should be_a_new(Subscription)
    end
  end

  describe "GET edit" do
    it "assigns the requested subscription as @subscription" do
      subscription = Subscription.create! valid_attributes
      get :edit, {:id => subscription.to_param}, valid_session
      assigns(:subscription).should eq(subscription)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Subscription" do
        expect {
          post :create, {:subscription => valid_attributes}, valid_session
        }.to change(Subscription, :count).by(1)
      end

      it "assigns a newly created subscription as @subscription" do
        post :create, {:subscription => valid_attributes}, valid_session
        assigns(:subscription).should be_a(Subscription)
        assigns(:subscription).should be_persisted
      end

      it "redirects to the created subscription" do
        post :create, {:subscription => valid_attributes}, valid_session
        response.should redirect_to(Subscription.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved subscription as @subscription" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subscription.any_instance.stub(:save).and_return(false)
        post :create, {:subscription => {  }}, valid_session
        assigns(:subscription).should be_a_new(Subscription)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subscription.any_instance.stub(:save).and_return(false)
        post :create, {:subscription => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested subscription" do
        subscription = Subscription.create! valid_attributes
        # Assuming there are no other subscriptions in the database, this
        # specifies that the Subscription created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Subscription.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => subscription.to_param, :subscription => { "these" => "params" }}, valid_session
      end

      it "assigns the requested subscription as @subscription" do
        subscription = Subscription.create! valid_attributes
        put :update, {:id => subscription.to_param, :subscription => valid_attributes}, valid_session
        assigns(:subscription).should eq(subscription)
      end

      it "redirects to the subscription" do
        subscription = Subscription.create! valid_attributes
        put :update, {:id => subscription.to_param, :subscription => valid_attributes}, valid_session
        response.should redirect_to(subscription)
      end
    end

    describe "with invalid params" do
      it "assigns the subscription as @subscription" do
        subscription = Subscription.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Subscription.any_instance.stub(:save).and_return(false)
        put :update, {:id => subscription.to_param, :subscription => {  }}, valid_session
        assigns(:subscription).should eq(subscription)
      end

      it "re-renders the 'edit' template" do
        subscription = Subscription.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Subscription.any_instance.stub(:save).and_return(false)
        put :update, {:id => subscription.to_param, :subscription => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested subscription" do
      subscription = Subscription.create! valid_attributes
      expect {
        delete :destroy, {:id => subscription.to_param}, valid_session
      }.to change(Subscription, :count).by(-1)
    end

    it "redirects to the subscriptions list" do
      subscription = Subscription.create! valid_attributes
      delete :destroy, {:id => subscription.to_param}, valid_session
      response.should redirect_to(subscriptions_url)
    end
  end
end
