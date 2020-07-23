class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :index
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :users_number, only: [:index, :show, :edit, :search]

  private

  def users_number #ヘッダーの登録患者数
    @num = User.count
  end

  protected

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :privacy, :sex, :disease, :history, :status, :sns, :word, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :privacy, :sex, :disease, :history, :status, :sns, :word, :image])
  end

end
