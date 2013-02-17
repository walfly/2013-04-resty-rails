class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    render json: @posts 
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    render json: @post
  end


  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    if @post.save
      render json: @post, status: :created, location: @post 
    else
      render json: @post.errors, status: :bad_request
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      head :no_content 
    else
      render json: @post.errors, status: :bad_request
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    head :no_content 
  end
end
