class Api::SessionsController < ApplicationController
  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

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
               message: 'ログインできませんでした正しい情報を入力してください',
             },
             status: :unprocessable_entity
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

  private

  def render_not_found
    render json: {}, status: :not_found
  end

  def render_status_500
    render json: {}, status: :internal_server_error
  end

end
