class Api::SessionsController < ApplicationController
  def new; end

  def auth_conf
    user = User.find(params[:id])
    if current_user?(user)
      render json: {}, status: :ok
    else
      render json: {}, status: :unauthorized
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    # 登録されているuser_typeと合っているかどうかを検証する
    if user.user_type == params[:user_type]
      if user&.authenticate(params[:session][:password])
        log_in user

        # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        render json: {
                 user: safe_user(user),
                 message: 'ログインに成功しました！',
               },
               status: :created
      else
        render json: {
                 message:
                   'ログインできませんでした正しい情報を入力してください',
               },
               status: :unprocessable_entity
      end
    else
      render json: {
               message: 'ログインできませんでした正しい情報を入力してください',
             },
             status: :forbidden
    end
  end

  def safe_user(user)
    return(
      {
        id: user.id,
        name: user.name,
        email: user.email,
        user_type: user.user_type,
      }
    )
  end

  def destroy
    log_out if logged_in?
    render json: { message: 'ログアウトしました' }
    # redirect_to root_url
  end
end
