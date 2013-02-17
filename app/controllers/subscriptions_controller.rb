class SubscriptionsController < ApplicationController
  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.all

    render json: @subscriptions 
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    @subscription = Subscription.find(params[:id])

    render json: @subscription
  end


  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(params[:subscription])

    if @subscription.save
      render json: @subscription, status: :created, location: @subscription 
    else
      render json: @subscription.errors, status: :bad_request
    end
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.json
  def update
    @subscription = Subscription.find(params[:id])

    if @subscription.update_attributes(params[:subscription])
      head :no_content 
    else
      render json: @subscription.errors, status: :bad_request
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    
    head :no_content 
  end
end
