class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order("updated_at DESC")
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/posts#index", notice: '質問をアップロードしました。'
    else
      redirect_to "/posts#index"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @comment_num = @post.comments.count
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to "/posts/#{post.id}", notice: '質問を更新しました。'
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end

end
