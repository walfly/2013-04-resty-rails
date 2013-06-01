class StatusesController < ApplicationController
  # GET /statuses
  def index
    @status = Status.find(:all)
    render :json => @status
  end

  # GET /statuses/1
  def show
    @status = Status.find(params[:id])
    render :json => @status
  end

  # POST /statuses
  def create
    @status = Status.new(params[:status])
    if @status.save
      head :created
    else
      head :bad_request
    end
  end

  # PUT /statuses/1
  def update
    @status = Status.update(params[:id], params[:status])
    if @status.save
      head :no_content
    else
      head :bad_request
    end
  end

  # DELETE /statuses/1
  def destroy
    if Status.destroy(params[:id])
      head :no_content
    else
      head :bad_request
    end
  end
end
