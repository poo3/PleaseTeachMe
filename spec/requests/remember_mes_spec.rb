require 'rails_helper'

RSpec.describe "RememberMes", type: :request do
  let(:user){FactoryBot.create(:user)}

  # テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
    !session[:user_id].nil?
  end

  describe "delete /logout" do
    it "redirects to root_path" do
      post login_path, params: {session:{
        email: user.email,
        password: user.password
      }}
      delete logout_path
      aggregate_failures do
        expect(response).to redirect_to root_path
        expect(is_logged_in?).to be false
      end
    end
  end
end
