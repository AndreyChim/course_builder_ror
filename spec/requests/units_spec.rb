require 'rails_helper'

RSpec.describe "Units", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/units/index"
      expect(response).to have_http_status(:success)
    end
  end

end
