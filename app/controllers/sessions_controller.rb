class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email:params[:session][:email].downcase,)
    if user && user.authenticate(params[:session][:password])
      #ログイン成功の処理を実装
    else
      flash[:danger] = 'ログインできませんでした正しい情報を入力してください'
      render 'new'
    end
  end

  def destroy

  end
end
