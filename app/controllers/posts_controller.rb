class PostsController < ApplicationController
  def index
    # New post for form
    @post = Post.new

    # All friends posts
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.save
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
