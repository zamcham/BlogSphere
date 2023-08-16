class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])

    @like = @post.likes.build(user: @user)

    if @like.save
      @post.increment!(:like_count) # Increment like_count
      redirect_to user_post_path(@user, @post), notice: 'Post was liked!'
    else
      redirect_to user_post_path(@user, @post), alert: 'Failed to like the post.'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like = @post.likes.find(params[:id])

    if @like.destroy
      @post.decrement!(:like_count) # Decrement like_count
      redirect_to user_post_path(@user, @post), notice: 'Post was unliked.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Failed to unlike the post.'
    end
  end
end
