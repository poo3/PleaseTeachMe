window.onload = function(){
  console.log('ready');
  var user_nav_button = document.getElementById('user-nav-button');
  console.log(user_nav_button);
  user_nav_button.onclick = function() {
    userNavToggle();
  };
  function userNavToggle(){
    var user_nav = document.getElementById('user-nav');
    console.log(user_nav.style.display)
    if(user_nav.style.display === 'none'){
      user_nav.style.display = 'flex';
    } else {
      user_nav.style.display = 'none';
    }
  };
};