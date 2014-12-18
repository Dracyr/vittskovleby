class PagesController < ApplicationController
  load_resource find_by: :permalink
  authorize_resource

  def index
    @orphan_pages = @pages.orphans
    @menus = Menu.orphans
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
    respond_to do |format|
      format.html { respond_with @page }
      format.js   { head :ok }
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
