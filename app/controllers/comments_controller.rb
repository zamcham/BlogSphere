class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @current_user.id

    if @comment.save
      redirect_to user_post_path(@post.user, @post), notice: 'Comment was successfully added.'
    else
      redirect_to user_post_path(@post.user, @post), alert: 'Failed to add the comment.'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post, notice: 'Comment was successfully deleted.'
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
