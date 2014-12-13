class PostsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    @post = Post.create post_params
    respond_with @post
  end

  def edit

  end

  def update
    @post.update post_params
    respond_to do |format|
      format.html { respond_with @post }
      format.js   { head :ok }
    end
  end

  def destroy
    @post.destroy
    respond_with @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
