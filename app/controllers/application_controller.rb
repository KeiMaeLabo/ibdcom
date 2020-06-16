class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :index
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :privacy, :sex, :disease, :history, :status, :sns, :word, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :privacy, :sex, :disease, :history, :status, :sns, :word, :image])
  end
end
