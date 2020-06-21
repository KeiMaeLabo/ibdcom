class PostsController < ApplicationController
  def index
    @num = User.count
    @posts = Post.includes(:user).order("updated_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/posts#index", notice: '質問をアップロードしました'
    else
      redirect_to "/posts#index"
    end
  end

  def show
    @num = User.count
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @comment_num = @post.comments.count
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end

end
