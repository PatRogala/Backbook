class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    # New post for form
    @post = Post.new

    # All friends posts
    @posts = Post.all.order(created_at: :desc).includes(:likes)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)

    @new_comment = @post.comments.build
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
    redirect_back(fallback_location: root_path)
  end

  def comment
    post = Post.find(params[:id]).comments.build(user_id: current_user.id, body: params[:comment][:body])
    post.save
    redirect_to post_path(params[:id])
  end
  private

  def post_params
    params.require(:post).permit(:body)
  end
end
