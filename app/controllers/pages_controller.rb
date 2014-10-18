class PagesController < ApplicationController

  def show
    @page = Page.find params[:id]
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.create page_params
    if @page.save
      redirect_to @page, notice: "Page created successfully"
    else
      render 'new'
    end
  end


  private

  def page_params
    params.require(:page).permit(:title, :content)
  end
end
