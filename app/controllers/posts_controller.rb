class PostsController < ApplicationController
  before_action :authenticate_request!, :current_user
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all.reverse
  end

  # GET /posts/1
  def show
  end

  # POST /posts
  def create
    @post = @current_user.posts.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @current_user == @post.user 
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /posts/1
  def destroy
    if @current_user == @post.user
      @post.destroy
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
