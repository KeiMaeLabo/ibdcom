class UsersController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @users = User.all.order("created_at DESC")
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


  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :sex, :email, :disease, :history, :status, :sns, :word)
  end

end
