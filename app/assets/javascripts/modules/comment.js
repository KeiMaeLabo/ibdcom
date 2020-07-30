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
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    console.log(url)
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.above-field').append(html);
      $('.above-field').animate({ scrollTop: $('.above-field')[0].scrollHeight});
      $('.comment-input').val('');
      $('.comment-btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  });
});