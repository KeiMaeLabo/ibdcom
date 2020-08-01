json.text @comment.text
json.user_id @comment.user.id
json.post_id @comment.post.id
json.created_at @comment.created_at.strftime("%Y年%m月%d日 %H:%M")
json.user_name @comment.user.name
json.user_disease @comment.user.disease
json.user_history @comment.user.history
json.user_image_url @comment.user.image_url
json.id @comment.id
