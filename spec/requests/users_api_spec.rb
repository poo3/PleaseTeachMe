require 'rails_helper'

RSpec.describe "UsersApi", type: :request do
  let(:user_params) do
    { user: { name: 'test', email: 'test@example.com', password: 'password', password_confirmation: 'password', 
       user_type: "teacher"} }
  end
  # ユーザを新規作成できること
  it "先生ユーザを作成" do
    expect{post users_path, params: user_params}.to change{User.count}.by(1) 
    # ステータスコードが正しく返答されているかチェック
    expect(response).to have_http_status(201)
    json = JSON.parse(response.body)
    # ユーザの情報がレスポンスされているかチェック
    expect(json['user']).to include({
      "id" => be_present,
      "name" => "test",
      "email" => "test@example.com",
      "user_type" => "teacher"
    })
    # フラッシュメッセージの文言が含まれているかチェック
    expect(json).to include({
      "message" => "test様ようこそPleaseTeachmeへ"
    })
  end

end
