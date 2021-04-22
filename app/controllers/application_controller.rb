class ApplicationController < ActionController::Base

  # vueファイルのみでフロントエンド構成するため
  # override ActionController::ImplicitRender for omitting view file per action
  def default_render
    render(html: "", layout: true)
  end

  include SessionsHelper

  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
