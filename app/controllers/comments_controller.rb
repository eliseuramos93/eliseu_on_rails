class CommentsController < ApplicationController
  before_action :require_user_signed_in

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :commenter_id)
    end

    def require_user_signed_in
      unless user_signed_in?
        flash[:failure] = 'You must be logged in to add a comment.'
        redirect_to root_path
      end

      true
    end
end
