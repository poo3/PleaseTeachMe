require 'rails_helper'

RSpec.describe 'UsersApi', type: :request do
  describe 'POST /api/users' do
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
      expect { post api_users_path, params: user_params }.to change {
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

    it 'ユーザの作成に失敗すること' do
      expect { post api_users_path, params: invalid_user_params }.to change {
        User.count
      }.by(0)

      # ステータスコードが正しく返答されているかチェック
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)

      # エラーの情報がレスポンスされているかチェック
      expect(json['errors']).not_to be_empty
    end
  end

  describe 'PATCH`/api/users/${this.$route.params.id}`' do
    user = FactoryBot.create(:user)
    let(:session_params) do
      { session: { email: user.email, password: user.password } }
    end
    let(:valid_user_updated_params) do
      {
        user: {
          name: 'edituser',
          email: 'edituser@example.com',
          password: 'editpassword',
          password_confirmation: 'editpassword',
          user_type: user.user_type,
        },
        id: user.id,
      }
    end
    let(:invalid_user_updated_params) do
      {
        user: {
          name: 'edituser',
          email: 'edituser@example.com',
          password: 'editpassword',
          password_confirmation: 'editpassword_invalid',
          user_type: user.user_type,
        },
        id: user.id,
      }
    end

    it 'ユーザの更新に成功すること' do
      # ログインしておく
      post '/api/login', params: session_params

      patch api_user_path(user), params: valid_user_updated_params
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['user']).to include(
        {
          'id' => user.id,
          'name' => 'edituser',
          'email' => 'edituser@example.com',
          'user_type' => 'student',
        },
      )
      expect(json).to include({ 'message' => '情報を更新しました！！' })
    end
    it 'ユーザの更新に失敗すること' do
      # ログインしておく
      post '/api/login', params: session_params

      patch api_user_path(user), params: invalid_user_updated_params
      expect(response).to have_http_status(:bad_request)
      json = JSON.parse(response.body)

      expect(json).to include({ 'message' => '編集に失敗しました' })
    end
  end
end
