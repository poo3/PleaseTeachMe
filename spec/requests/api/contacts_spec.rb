require 'rails_helper'

RSpec.describe 'Api::Contacts', type: :request do
  describe 'POST /api/contact' do
    contact = FactoryBot.create(:contact)
    let(:valid_contact_params) do
      {
        contact: {
          name: contact.name,
          email: contact.email,
          content: contact.content,
        },
      }
    end
    let(:invalid_contact_params) do
      { contact: { name: '', email: '', content: '' } }
    end
    it '質問の送信ができること' do
      post '/api/contacts', params: valid_contact_params
      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json['contact']).to include(
        {
          'name' => contact.name,
          'email' => contact.email,
          'content' => contact.content,
        },
      )
      expect(json).to include('message')
    end
    it '質問の送信が失敗すること' do
      post '/api/contacts', params: invalid_contact_params
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json).to include('message')
    end
  end
end
