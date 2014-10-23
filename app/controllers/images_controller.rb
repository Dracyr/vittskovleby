class ImagesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    @image = Image.create image_params
    respond_with @image, location: images_path
  end

  def edit
  end

  def update
    @image.update image_params
  end

  private

  def image_params
    params.require(:image).permit(:title, :file)
  end

end
