require 'rails_helper'

RSpec.describe "Marketings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/marketing/index"
      expect(response).to have_http_status(:success)
    end
  end

end
