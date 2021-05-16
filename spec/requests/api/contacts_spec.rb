require 'rails_helper'

RSpec.describe "Api::Contacts", type: :request do
  describe "GET /api/contacts" do
    it "works! (now write some real specs)" do
      get api_contacts_index_path
      expect(response).to have_http_status(200)
    end
  end
end
