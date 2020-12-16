require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages" do
    it "should get root" do
      get root_path
      expect(response).to have_http_status(200)
    end

    it "should get help" do
      get static_pages_help_path
      expect(response).to have_http_status(200)
    end

    it "should get contact" do
      get static_pages_contact_path
      expect(response).to have_http_status(200)
    end
  end
end
