class OrderController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    render json: { error: 'Order not found' }, status: 404
  end

  def index
    @order = Order.all.as_json.map do |order|
      order.merge(customer: Customer.find(order['customer_id']).as_json)
    end
    render json: @order
  end

  def show
    @order = Order.find(params[:id])
    render json: @order.as_json.merge(customer: Customer.find(@order.customer_id).as_json).merge(items: Item.where(id: OrderDetail.where(order_id: @order.id).pluck(:item_id)).as_json)
  end

  def create
  end

  def update
  end
end
