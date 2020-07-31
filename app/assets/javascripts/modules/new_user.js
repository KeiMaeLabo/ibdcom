$(function(){
  //fileが選択された時に発火するイベント
  $('#user_image').change(function(){
    //選択したfileのオブジェクトをpropで取得
    var file = $('input[type="file"]').prop('files')[0];
    //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
    var fileReader = new FileReader();
    //読み込みが完了すると、srcにfileのURLを格納
    fileReader.onloadend = function() {
      var src = fileReader.result
      var html= `<img src="${src}" width="55" height="55" class="preview-image" >`
      //image_box__container要素の前にhtmlを差し込む
      if ($('.preview-image').length !== 0) {
        $('.preview-image').remove();
      }
      $('.preview').append(html);
    }
    fileReader.readAsDataURL(file);
  });
});