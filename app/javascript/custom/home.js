document.addEventListener("turbolinks:load", function() {
  var user_nav = document.getElementById('user-nav');
  document.getElementById('user-nav').style.display = 'none'
  // ボタンをクリックしたらナビゲーションの表示の切り替え
  
  document.addEventListener('click', (e) => {
    if(!e.target.closest('#user-nav-button')) {
      //ここに外側をクリックしたときの処理
      userNavDisabled(user_nav);
    } else {
      //ここに内側をクリックしたときの処理
      userNavToggle(user_nav)
    }
  })

  // ユーザナビ表示切り替えの関数
  function userNavToggle(user_nav){
    if(user_nav.style.display === 'none'){
      user_nav.style.display = 'flex';
    } else {
      user_nav.style.display = 'none';
    }
  };

  // ユーザナビを非表示に切り替える関数
  function userNavDisabled(user_nav){
    user_nav.style.display = 'none';
  };

});
