<template>
  <div class="user-form-wrapper">
    <div class="form-group">
      <label for="userName">名前</label>
      <input
        type="text"
        name="userName"
        class="form-control"
        id="userName"
        placeholder="名前を入力して下さい"
      />
    </div>
    <div class="form-group">
      <label for="userEmail">メールアドレス</label>
      <input
        type="email"
        name="userEmail"
        class="form-control"
        id="userEmail"
        placeholder="メールアドレスを入力して下さい"
      />
    </div>
    <div class="form-group">
      <label for="userPassword">パスワード</label>
      <input
        type="password"
        name="userPassword"
        class="form-control"
        id="userPassword"
        placeholder="パスワードを入力して下さい"
      />
    </div>
    <div class="form-group">
      <label for="userPasswordConfirmation">パスワードの確認</label>
      <input
        type="password"
        name="userPasswordConfirmation"
        class="form-control"
        id="userPasswordConfirmation"
        placeholder="再度パスワード入力して下さい"
      />
    </div>
    <div class="submit-button-wrapper">
      <input
        type="submit"
        value="送信"
        name="submitBtn"
        class="btn btn-submit"
        id="submitBtn"
      />
    </div>
  </div>
</template>

<style lang="scss" scoped>
.user-form-wrapper {
  > .form-group {
    height: 2rem;
    width: 40%;
    margin: 2rem auto;
    position: relative;
    display: flex;
    align-items: center;
    > input {
      height: 100%;
      position: absolute;
      left: 15rem;
      width: 60%;
      border: 2px solid #880016;
      padding-left: 1rem;
      border-radius: 1rem;
      outline: 0;
    }
  }
  > .submit-button-wrapper {
    width: 40%;
    margin: 10vh auto;
    text-align: center;
    > input {
      margin: auto;
      border: 2px solid #880016;
      padding: 0.5rem;
      border-radius: 1rem;
      width: 6rem;
    }
  }
}
</style>