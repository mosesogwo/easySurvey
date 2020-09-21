require 'rails_helper'

RSpec.describe "Reports", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/report/show"
      expect(response).to have_http_status(:success)
    end
  end

end
