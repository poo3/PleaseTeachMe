require 'rails_helper'

RSpec.describe "SessionsControllers", type: :request do
  describe "GET /sessions_controllers" do
    it "should get new" do
      get login_path
      expect(response).to have_http_status(200)
    end
  end
end
