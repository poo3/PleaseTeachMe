class Api::UsersController < ApplicationController
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
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'プロフィール更新しました！'
      redirect_to @user
    else
      render 'edit'
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
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
