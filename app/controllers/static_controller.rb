class StaticController < ApplicationController
  layout "static_layout"

  def home
    @posts = Post.take(3)
  end
end
