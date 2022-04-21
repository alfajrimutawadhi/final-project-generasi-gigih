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
    begin
      json_params = JSON.parse(request.raw_post)
      check_customer = Customer.find(json_params['customer_id'])
    rescue ActiveRecord::RecordNotFound
      check_customer = nil
    end

    begin
      check_item = nil
      json_params['items'].each do |item|
        check_item = Item.find(item['id'])
      end
    rescue ActiveRecord::RecordNotFound
      check_item = nil
    end

    if check_customer.nil?
      validation_error('Customer not found')
    else
      if check_item.nil?
        validation_error('Item not found')
      else
        total = 0
        json_params['items'].each do |item|
          total += Item.find(item['id']).price * item['quantity']
        end
        @order = Order.new(customer_id: json_params['customer_id'], status: json_params['status'], total: total)
        if @order.save
          json_params['items'].each do |item|
            OrderDetail.create(order_id: @order.id, item_id: item['id'], quantity: item['quantity'], item_price: Item.find(item['id']).price)
          end
          response_success("Order created")
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    json_params = JSON.parse(request.raw_post)
    @order = Order.find(params[:id])
    if @order.update(status: json_params['status'])
      response_success("Order updated")
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end
end
