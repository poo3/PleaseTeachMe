class Api::UsersController < ApplicationController
  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  before_action :logged_in_user, only: %i[edit update]
  before_action :correct_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def index
    @user = User.find(params[:id]).select(:name, :user_type)
    render json: @user
  end

  def show
    user = User.find(params[:id])
    if current_user?(user)
      render json: { user: safe_user(user), current_user: true }
    else
      render template: 'sessions/new',
             json: {
               message: 'ログインして下さい',
               current_user: false,
             }
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      render json: {
               user: safe_user(user),
               message: "#{user.name}様ようこそPleaseTeachmeへ",
             },
             status: :created
    else
      render json: {
               errors: user.errors.full_messages,
             },
             status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {
               user: safe_user(user),
               message: '情報を更新しました！！',
             },
             status: :ok
    else
      render json: { message: '編集に失敗しました' }, status: :bad_request
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(:name, :email, :password, :password_confirmation, :user_type)
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

  # beforeアクション

  #正しいユーザか確認する（セッションユーザ本人のページかどうか）
  def correct_user
    user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(user)
  end

  # 例外発生時に実行するメソッド
  def render_not_found
    render json: {}, status: :not_found
  end

  def render_status_500
    render json: {}, status: :internal_server_error
  end
end
