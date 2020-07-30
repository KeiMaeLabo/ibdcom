class Api::CommentsController < ApplicationController
  def index
    post = Post.find(params[:post_id])
    # ajaxで送られてくる最後のコメントのid番号を変数に代入
    last_comment_id = params[:id]
    # 取得した質問でのコメント達から、idがlast_comment_idよりも新しい(大きい)メッセージ達のみを取得
    @comments = post.comments.includes(:user).where("id > ?", last_comment_id)
  end
end