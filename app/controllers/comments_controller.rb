class CommentsController < ApplicationController
   respond_to :json
  # GET /comments
  def index
    @comment = Comment.find(:all)
    render :json => @comment
  end

  # GET /comments/1
  def show
    @comment = Comment.find(params[:id])
    render :json => @comment
  end


  # POST /comments
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      head :created
    else
      head :bad_request
    end
  end

  # PUT /comments/1
  def update
    @comment = Comment.update(params[:id], params[:comment])
    if @comment.save
      head :no_content
    else
      head :bad_request
    end
  end

  # DELETE /comments/1
  def destroy
    if Comment.destroy(params[:id])
      head :no_content
    else
      head :bad_request
    end
  end
end
