class GroupsController < ApplicationController
  # GET /groups
  def index
    @group = Group.find(:all)
    render :json => @group
  end

  # GET /groups/1
  def show
    @group = Group.find(params[:id])
    render :json => @group
  end


  # POST /groups
  def create
    @group = Group.new(params[:group])
    if @group.save
      head :created
    else
      head :bad_request
    end
  end

  # PUT /groups/1
  def update
    @group = Group.update(params[:id], params[:group])
    if @group.save
      head :no_content
    else
      head :bad_request
    end
  end

  # DELETE /groups/1
  def destroy
    if Group.destroy(params[:id])
      head :no_content
    else
      head :bad_request
    end
  end
end
