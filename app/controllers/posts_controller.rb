class PostsController < ApplicationController
  def index
    # New post for form
    @post = Post.new

    # All friends posts
    @posts = Post.all.order(created_at: :desc).includes(:likes)
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to root_path
  end

  def like
    is_already_liked = Like.where(likeable_type: "Post", likeable_id: params[:id], user_id: current_user.id).any?
    puts "\n\n#{is_already_liked}\n\n"
    if is_already_liked
      Like.where(likeable_type: "Post", likeable_id: params[:id], user_id: current_user.id).destroy_all
    else
      post = Post.find(params[:id]).likes.build(user_id: current_user.id)
      post.save
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
