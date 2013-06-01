class PostsController < ApplicationController
  # GET /posts
  def index
    @post = Post.find(:all)
    render :json => @post
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    render :json => @post
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])
    if @post.save
      head :created
    else
      head :bad_request
    end
  end

  # PUT /posts/1
  def update
    @post = Post.update(params[:id], params[:post])
    if @post.save
      head :no_content
    else
      head :bad_request
    end
  end

  # DELETE /posts/1
  def destroy
    if Post.destroy(params[:id])
      head :no_content
    else
      head :bad_request
    end
  end
end
