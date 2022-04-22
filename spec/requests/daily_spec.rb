require 'rails_helper'

RSpec.describe "Dailies", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/daily"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /byCustomer" do
    it "returns http success" do
      get "/daily/byCustomer"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /byTotal" do
    it "returns http success" do
      get "/daily/byTotal"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /byRangeDate" do
    it "returns http success" do
      get "/daily/byRangeDate"
      expect(response).to have_http_status(:success)
    end
  end

end
