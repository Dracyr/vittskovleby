class ImagesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    @image = Image.create image_params
    respond_to do |format|
      format.html { respond_with @image, location: images_path }

      format.js do
        if @image.save
          render action: 'upload_success'
        else
          render json: @image.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
  end

  def update
    @image.update image_params
    respond_with @image, location: images_path
  end

  private

  def image_params
    params.require(:image).permit(:title, :file)
  end

end
