class UsersController < ApplicationController
  # GET /users
  def index
    @user = User.find(:all)
    render :json => @user
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    render :json => @user
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    if @user.save
      head :created
    else
      head :bad_request
    end
  end

  # PUT /users/1
  def update
    @user = User.update(params[:id], params[:user])
    if @user.save
      head :no_content
    else
      head :bad_request
    end
  end

  # DELETE /users/1
  def destroy
    if User.destroy(params[:id])
      head :no_content
    else
      head :bad_request
    end
  end
end
