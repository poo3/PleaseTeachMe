require 'rails_helper'

RSpec.describe 'UsersApi', type: :request do
  describe 'POST /users' do
    let(:user_params) do
      {
        user: {
          name: 'test',
          email: 'test@example.com',
          password: 'password',
          password_confirmation: 'password',
          user_type: 'teacher',
        },
      }
    end

    it 'ユーザを作成できる事' do
      expect { post users_path, params: user_params }.to change {
        User.count
      }.by(1)

      # ステータスコードが正しく返答されているかチェック
      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)

      # ユーザの情報がレスポンスされているかチェック
      expect(json['user']).to include(
        {
          'id' => be_present,
          'name' => 'test',
          'email' => 'test@example.com',
          'user_type' => 'teacher',
        },
      )

      # フラッシュメッセージの文言が含まれているかチェック
      expect(json).to include({ 'message' => 'test様ようこそPleaseTeachmeへ' })
    end

    # 無効ユーザ定義
    let(:invalid_user_params) do
      {
        user: {
          name: '',
          email: 'test@example.com',
          password: 'password',
          password_confirmation: 'password',
          user_type: 'student',
        },
      }
    end

    it 'ユーザを作成に失敗すること' do
      expect { post users_path, params: invalid_user_params }.to change {
        User.count
      }.by(0)

      # ステータスコードが正しく返答されているかチェック
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)

      # エラーの情報がレスポンスされているかチェック
      expect(json['errors']).not_to be_empty
    end
  end
end
