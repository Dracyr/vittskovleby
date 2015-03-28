class MenusController < ApplicationController
  load_and_authorize_resource

  def new
    @parent_id = params[:parent_id]
  end

  def create
    respond_to do |format|
      format.html { respond_with @menu, location: pages_path }

      format.js do
        if @menu.save
          respond_with @menu, location: pages_path
        else
          render json: {menu: @menu.errors}, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
  end

  def update
    @menu.update menu_params
    respond_with @menu, location: pages_path
  end

  def update_all
    Menu.update_order!(JSON.parse(params[:menu_data]))
    render js: 'location.reload();'
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
