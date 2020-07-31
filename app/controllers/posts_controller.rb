class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @comment_num = @post.comments.count
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to "/posts/#{@post.id}", notice: '質問を更新しました。'
  end

  def search
    if params[:text].present?
      @posts = Post.where('text LIKE ?', "%#{params[:text]}%")
    else
      @posts = Post.none
    end
  end

  private
  
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end

end
