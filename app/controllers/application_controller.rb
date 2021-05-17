class ApplicationController < ActionController::Base
  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  # vueファイルのみでフロントエンド構成するため
  # override ActionController::ImplicitRender for omitting view file per action
  def default_render
    render(html: '', layout: true)
  end

  include SessionsHelper

  private

  # ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  # 例外発生時に実行するメソッド
  def render_not_found
    render json: {}, status: :not_found
  end

  def render_status_500
    render json: {}, status: :internal_server_error
  end
end
