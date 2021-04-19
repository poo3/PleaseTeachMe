<template>
  <header>
    <h1>Header</h1>
    <div class="header-wrapper">
      <div class="app-logo-container">
        <!-- <%= link_to embedded_svg("PLEASE TEACH ME LOGO.svg", class:
        "application-logo",alt: "PleaseTeachMe logo", width:"200px"), root_path
        %> -->
        <router-link
          class="application-logo"
          src="@/assets/images/PLEASE TEACH ME LOGO.svg"
        ></router-link>
      </div>
      <nav>
        <div class="nav-container">
          <div class="static-pages-nav">
            <ul class="nav">
              <li>
                <router-link></router-link>
                <!-- <%= link_to 'ヘルプ',
                static_pages_help_path %> -->
              </li>
              <li>
                <router-link></router-link>
                <!-- <%= link_to 'お問合せ',
                new_contact_path %> -->
              </li>
            </ul>
          </div>
          <div class="user-nav-wrapper">
            <button id="user-nav-button" type="button">
              <div>
                <%= image_tag("user-menu-logo",class: "user-menu-logo")%>
              </div>
            </button>
            <div class="user-nav" id="user-nav">
              <ul>
                <!-- <%if logged_in? %> -->
                <li v-if="logged_in">
                  <!-- <%= link_to "ログアウト" , logout_path, method: :delete %> -->
                </li>
                <li v-if="logged_in">
                  <!-- <%= link_to "マイページ" , user_path(current_user) %> -->
                </li>
                <li v-if="logged_in">
                  <!-- <%= link_to "登録内容編集", edit_user_path(current_user) %> -->
                </li>
                <% else %>
                <li v-if="logged_in">
                  <!-- <%= link_to '登録する', new_user_path , class: "signup-btn"%> -->
                </li>
                <li v-if="logged_in">
                  <!-- <%= link_to "ログイン", login_path %> -->
                </li>
                <!-- <% end %> -->
              </ul>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </header>
</template>

<script>
export default {};
</script>