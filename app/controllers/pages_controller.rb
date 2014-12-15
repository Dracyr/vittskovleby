class PagesController < ApplicationController
  load_resource find_by: :permalink, except: :show
  authorize_resource

  def index
    @orphan_pages = @pages.orphans
    @menus = Menu.orphans
  end

  def show
    @page = Page.find_by_permalink(params[:id])
    authorize! :read, @page
    # Render the page, else try to render a static view
    @page ? respond_with(@page) : render("static/#{params[:id]}", layout: 'static_layout')
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
