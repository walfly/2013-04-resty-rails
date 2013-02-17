class StatusesController < ApplicationController
  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all

    render json: @statuses 
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    @status = Status.find(params[:id])

    render json: @status
  end


  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(params[:status])

    if @status.save
      render json: @status, status: :created, location: @status 
    else
      render json: @status.errors, status: :bad_request
    end
  end

  # PUT /statuses/1
  # PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])

    if @status.update_attributes(params[:status])
      head :no_content 
    else
      render json: @status.errors, status: :bad_request
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    
    head :no_content 
  end
end
