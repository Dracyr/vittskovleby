class PagesController < ApplicationController
  load_and_authorize_resource

  def show
    @page = Page.find params[:id]
  end

  def new
    @page = Page.new
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
