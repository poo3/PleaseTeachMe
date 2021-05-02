require 'rails_helper'

RSpec.describe 'Api::SessionsApis', type: :request do
  describe 'POST /login' do
    user = FactoryBot.create(:user)
    let(:session_params) do
      { session: { email: user.email, password: user.password } }
    end
    it 'セッション作成が成功すること' do
      post '/login', params: session_params
      expect(response).to have_http_status(:created)
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
      post '/login', params: invalid_session_params
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json).to include('message')
    end
  end
end
