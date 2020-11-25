class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email:params[:session][:email].downcase,)
    if user&.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'ログインに成功しました！'
      redirect_to user
    else
      flash.now[:danger] = 'ログインできませんでした正しい情報を入力してください'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
