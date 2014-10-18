class PagesController < ApplicationController
  load_and_authorize_resource

  def show
  end

  def new
  end

  def create
    @page = Page.create page_params
    respond_with @page
  end


  private

  def page_params
    params.require(:page).permit(:title, :content)
  end
end
