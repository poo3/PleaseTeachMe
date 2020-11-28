require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user){FactoryBot.create(:user)}

  describe "sessions" do
    it "ログインページへのアクセス" do
      get login_path
      expect(response).to have_http_status(200)
    end

    context "正しい情報が入力されている時" do
      
      it "ログイン" do
        post login_path params:{session:{email: user.email,password: user.password}}
        expect(flash[:success]).to match('ログインに成功しました')
        expect(response).to redirect_to user_path(user.id)
      end
    end
    context "正しくない情報が入力されている時" do
      
      it "ログイン" do
        post login_path params:{session:{name: "",email: " "}}
        expect(flash[:danger]).to match('ログインできませんでした正しい情報を入力してください')
      end
    end

  end
end
