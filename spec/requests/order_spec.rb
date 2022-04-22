require 'rails_helper'

RSpec.describe "Orders", type: :request do
  before(:all) do
    Customer.create(name: "fajri", email: "fajri@gmail.com")
    Item.create(name: "nasi goreng", price: 10000, description: "nasi goreng enak")
    Order.create(customer_id: 1, status: "NEW", total: 10000)
    OrderDetail.create(order_id: 1, item_id: 1, quantity: 1, item_price: 10000)
  end

  describe "GET /index" do
    it "returns http success" do
      get "/order"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/order/1/detail"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/order", params: { customer_id: 1, status: "NEW", items: [{ id: 1, quantity: 1 }] }, as: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /update" do
    it "returns http success" do
      put "/order/1", params: { customer_id: 1, status: "CANCELED", items: [{ id: 1, quantity: 1 }] }, as: :json
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "PATCH /update" do
    it "returns http success" do
      patch "/order/1", params: { status: "PAID" }, as: :json
      expect(response).to have_http_status(:success)
    end
  end

end
