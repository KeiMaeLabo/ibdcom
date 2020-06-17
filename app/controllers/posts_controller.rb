class PostsController < ApplicationController
  def index
    @num = User.count
  end
end
