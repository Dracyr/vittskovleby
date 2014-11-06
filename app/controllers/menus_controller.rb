class MenusController < ApplicationController
  load_and_authorize_resource

  def new
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

  def destroy
    @menu.destroy
    respond_with @menu, location: pages_path
  end

  private

  def menu_params
    params.require(:menu).permit(:title)
  end

end
