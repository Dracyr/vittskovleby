class PagesController < ApplicationController
  load_resource find_by: :permalink
  authorize_resource

  def index
    @orphan_pages = @pages.orphans
    @menus = Menu.all
  end

  def show
  end

  def new
  end

  def create
    @page = Page.create page_params
    respond_with @page
  end

  def edit

  end

  def update
    @page.update page_params
    respond_with @page
  end

  def update_all
    NavigationOrderer.new(params[:page_data]).update
    respond_to do |format|
      format.js { render js: "window.location.reload();" }
    end
  end

  def destroy
    @page.destroy
    respond_with @page
  end

  private

  def page_params
    params.require(:page).permit(:title, :content, :menu_id)
  end
end
