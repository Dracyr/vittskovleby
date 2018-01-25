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

  before_action :load_navigation_menu
  layout :layout_by_resource

  protected

  def load_navigation_menu
    @nav_menus = Menu.orphans
  end

  def layout_by_resource
    devise_controller? ? 'session_layout' : 'application'
  end
end
