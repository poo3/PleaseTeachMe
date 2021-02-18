document.addEventListener("turbolinks:load", function(){
  // フォームの要素を取得
  var form = document.getElementById("contact-form");
  var textarea = document.getElementById("contact_content");

  // 文字数制限
  // getAttributeメソッドで属性を取得可能
  var maxTextNum = textarea.getAttribute("maxlength");

  /* 要素の追加 ***************/
  // 残り文字数を表示する要素の追加
  var textMessage = document.createElement('div');
  var parent = textarea.parentElement;
  parent.insertBefore(textMessage, textarea);

  // テキストエリアで要素をタイプした時。
  // 残り文字数を表示する要素の追加
  var currentTextNum = textarea.value.length;
  textMessage.innerHTML = '<p>あと「' + (maxTextNum - currentTextNum) + '」文字入力できます。</p>';
  
  textarea.addEventListener('keyup', function() {
    var currentTextNum = textarea.value.length;
    //  (maxTextNum - currentTextNum) で残り文字数を求めている
    textMessage.innerHTML = '<p>あと「' + (maxTextNum - currentTextNum) + '」文字入力できます。</p>';
    if( (maxTextNum - currentTextNum) === 0){
      textMessage.style.color = 'red'
    } else {
      textMessage.style.color = 'black'
    }
  });
});