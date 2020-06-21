class UsersController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @users = User.all.order("RAND()")
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index, notice: 'ログインするとご利用いただけます' unless user_signed_in?
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :privacy, :sex, :email, :disease, :history, :status, :sns, :word, :image)
  end

end
