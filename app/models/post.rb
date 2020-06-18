class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def show_post_user
    @user = User.find[user_id]
  end
end
