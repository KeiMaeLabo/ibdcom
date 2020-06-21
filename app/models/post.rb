class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def show_comment_num
    if comments.present?
      comments.count
    else
      '0'
    end
  end

  def show_last_comment
    if (last_comment = comments.last).present?
      last_comment.text
    else
      ' まだコメントはありません'
    end
  end

  def show_last_comment_date
    if (last_comment = comments.last).present?
      last_comment.created_at.strftime("%Y年%m月%d日 %H:%M")
    else
      ' '
    end
  end

  def show_last_comment_user
    if (last_comment = comments.last).present?
      last_comment.user.name
    else
      ' '
    end
  end

  def show_last_comment_disease
    if (last_comment = comments.last).present?
      last_comment.user.disease
    else
      ' '
    end
  end

  def show_last_comment_history
    if (last_comment = comments.last).present?
      "病歴: #{last_comment.user.history}年"
    else
      ' '
    end
  end

end
