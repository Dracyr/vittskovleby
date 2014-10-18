class PostsController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def new
  end

  def create
    @post = Post.create post_params
    respond_with @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
