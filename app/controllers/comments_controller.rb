class CommentsController < ApplicationController
  before_action :authenticate_request!, :current_user
  before_action :set_post, only: [:index, :create]
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = @post.comments

    render json: @comments, status: :ok
  end

  # GET /comments/1
  def show
  end

  # POST /comments
  def create
    @comment = @post.comments.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
