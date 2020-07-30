$(function(){
  function buildHTML(comment){
    let html = 
      `<div class="comment" data-comment-id=${comment.id}>
        <div class="comment-top">
          <div class="comment-user">
            ${comment.created_at}
            <a href="/users/${comment.user_id}">${comment.user_name}</a>
            ${comment.user_disease} 病歴: ${comment.user_history} 年
          </div>
          <img alt="" src="${comment.user_image_url}" class="comment-image" width="50", height="50" />
        </div>
        <div class="comment-content">
          <i class="fas fa-comment"></i>  ${comment.text}
        </div>
      </div>`
    return html;
  }
  let reloadComments = function() {
    //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
    let last_comment_id = $('.comment:last').data("comment-id") || 0;
    let post_id = $('.main-post').data("post-id")
    $.ajax({
      //ルーティングで設定した通り/posts/id番号/api/commentsとなるよう文字列を書く
      url: `/posts/${post_id}/api/comments`,
      //ルーティングで設定した通りhttpメソッドをgetに指定
      type: 'get',
      dataType: 'json',
      //dataオプションでリクエストに値を含める
      data: {id: last_comment_id}
    })
    .done(function(comments) {
      // 更新するメッセージがなかった場合は.doneの後の処理が動かないようにする
      console.log(comments.length)
      if (comments.length !== 0) {
        //追加するHTMLの入れ物を作る
        let insertHTML = '';
        //配列commentsの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
        $.each(comments, function(i, comment) {
          insertHTML += buildHTML(comment)
        });
        //メッセージが入ったHTMLに、入れ物ごと追加
        $('.above-field').append(insertHTML);
        $('.above-field').animate({ scrollTop: $('.above-field')[0].scrollHeight});
      }
    })
    .fail(function() {
      alert('autoReload error');
    });
  };
  setInterval(reloadComments, 7000);
});