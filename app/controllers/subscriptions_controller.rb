class SubscriptionsController < ApplicationController
  # GET /subscriptions
  def index
    @subscription = Subscription.find(:all)
    render :json => @subscription
  end

  # GET /subscriptions/1
  def show
    @subscription = Subscription.find(params[:id])
    render :json => @subscription
  end

  # POST /subscriptions
  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save
      head :created
    else
      head :bad_request
    end
  end

  # PUT /subscriptions/1
  def update
    @subscription = Subscription.update(params[:id], params[:subscription])
    if @subscription.save
      head :no_content
    else
      head :bad_request
    end
  end

  # DELETE /subscriptions/1
  def destroy
    if Subscription.destroy(params[:id])
      head :no_content
    else
      head :bad_request
    end
  end
end
