document.addEventListener("turbolinks:load", function() {
  const button = document.getElementById("user-nav-button");
  document.getElementById('user-nav').style.display = 'none'
  // ボタンをクリックしたらナビゲーションの表示の切り替え
  button.addEventListener("click", event => {
    var user_nav = document.getElementById('user-nav')
    userNavToggle(user_nav)
  });
  // ユーザナビ表示切り替えの関数
  function userNavToggle(user_nav){
    if(user_nav.style.display === 'none'){
      user_nav.style.display = 'flex';
    } else {
      user_nav.style.display = 'none';
    }
  };
});
