class ApplicationController < ActionController::Base
  include UsersHelper
  #before_filter :require_login
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # Ruta.js
  # protect_from_forgery with: :null_session


helper_method :admin?

  protected
  def admin?     
        #if current_user.rol_id == 1             
               # flash[:notice] = "Bienvenido #{current_user.first_name.capitalize}"
     #end   
     true         
  end

  def authorize
    unless admin?
      flash[:error] = "Acceso no Permitido"
      redirect_to root_path
      false
    end
  end

  private
  def not_authenticated
    flash[:danger] = "Por Favor Inicia Sesión Para Continuar"
    redirect_to login_path
  end
  
  def not_found
    flash[:danger] = "#{params[:controller].chop.capitalize } not found."
    redirect_back_or_to controller: params[:controller]
  end

  def current_users
    User.current_users
  end

  helper_method :current_users

end
