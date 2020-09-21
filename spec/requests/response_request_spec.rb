require 'rails_helper'

RSpec.describe "Responses", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/response/new"
      expect(response).to have_http_status(:success)
    end
  end

end
