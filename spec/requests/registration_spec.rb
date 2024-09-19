require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "GET /register" do
    it "returns http success" do
      get "/register"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /register" do
    it "returns http success" do
      post "/register", params: { user: { email: FFaker::Internet.email, password: 'password', password_confirmation: 'password' } }
      expect(response).to redirect_to(dashboard_path)
    end
  end
end
