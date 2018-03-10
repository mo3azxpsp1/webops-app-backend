class CommentsController < ApplicationController
  before_action :authenticate_request!, :current_user
  before_action :set_post, only: [:create]
  before_action :set_comment, only: [:show, :update, :destroy]


  # POST /comments
  def create
    @comment = @current_user.comments.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @post
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
      params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
