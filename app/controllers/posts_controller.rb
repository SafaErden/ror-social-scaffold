class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
    friend_ids = current_user.friends.pluck(:id)
    friends_posts = Post.where(user_id: friend_ids).includes(:user)
    @timeline_posts ||= (current_user.posts.includes(:user) + friends_posts).sort_by(&:created_at).reverse
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
