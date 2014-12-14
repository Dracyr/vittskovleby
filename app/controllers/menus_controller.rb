class MenusController < ApplicationController
  load_and_authorize_resource

  def new
    @parent_id = params[:parent_id]
  end

  def create
    @menu = Menu.create menu_params
    respond_with @menu, location: pages_path
  end

  def edit
  end

  def update
    @menu.update menu_params
    respond_with @menu, location: pages_path
  end

  def update_all
    NavigationOrderer.new(params[:menu_data]).update
    respond_to do |format|
      format.js { render js: "window.location.reload();" }
    end
  end

  def destroy
    @menu.destroy
    respond_with @menu, location: pages_path
  end

  private

  def menu_params
    params.require(:menu).permit(:title, :link, :menu_type, :parent_id, :page_id)
  end

end
