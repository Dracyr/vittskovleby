require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  before_filter :load_navigation_menu
  layout :layout_by_resource

  protected

  def load_navigation_menu
    I18n.locale = :sv
    @nav_menus = Menu.orphans
  end

  def layout_by_resource
    if devise_controller?
      "session_layout"
    else
      "application"
    end
  end
end
