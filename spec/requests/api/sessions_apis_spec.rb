require 'rails_helper'

RSpec.describe 'Api::SessionsApis', type: :request do
  # logged_in?を利用するためにsessionヘルパーをインクルード
  include SessionsHelper
  describe 'POST /api/login' do
    user = FactoryBot.create(:user)
    let(:session_params) do
      { session: { email: user.email, password: user.password } }
    end
    it 'セッション作成が成功すること' do
      post '/api/login', params: session_params
      expect(response).to have_http_status(:created)
      expect(logged_in?).to be_truthy
      json = JSON.parse(response.body)
      expect(json['user']).to include(
        {
          'id' => be_present,
          'name' => user.name,
          'email' => user.email,
          'user_type' => user.user_type,
        },
      )
      expect(json).to include('message')
    end

    let(:invalid_session_params) do
      { session: { email: 'invalid_email', password: 'invalid_password' } }
    end
    it 'セッション作成が失敗すること' do
      post '/api/login', params: invalid_session_params
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json).to include('message')
    end
  end
  
  describe "POST /api/auth_conf" do
    user = FactoryBot.create(:user)
    another_user = FactoryBot.create(:user)
    let :unknown_user_id do 99999 end
    let(:session_params) do
      { session: { email: user.email, password: user.password } }
    end
    let(:another_session_params) do
      { session: { email: another_user.email, password: another_user.password } }
    end
    before do
      post '/api/login', params: session_params
    end
    it "認証に成功すること" do
      post '/api/auth_conf',params:{id: user.id}
      expect(response).to have_http_status(:ok)
    end

    it "認証に失敗すること(存在しないユーザIDとして実行)" do
      post '/api/auth_conf',params:{id: unknown_user_id}
      expect(response).to have_http_status(:not_found)
    end

    it "認証に失敗すること（存在するユーザIDとして実行）" do
      post '/api/login', params: another_session_params
      post '/api/auth_conf',params:{id: user.id}
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
