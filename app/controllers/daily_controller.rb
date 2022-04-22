class DailyController < ApplicationController
  def index
    @daily = Order.get_order_now.as_json.map do |order|
      order.merge(customer: Customer.find(order['customer_id']).as_json)
    end
    render json: @daily
  end

  def byEmail
    if params['email'].present?
      customer = Customer.find_by(email: params['email'])
      if customer.present?
        @daily = Order.get_order_now.where(customer_id: customer.id).as_json.map do |order|
          order.merge(customer: Customer.find(order['customer_id']).as_json)
        end
        render json: @daily
      else
        validation_error('Email customer not found')
      end
    else
      validation_error('Request email not found')
    end
  end

  def byTotal
    if params['total'].present?
      if params['morethan'] == 'true'
        @daily = Order.get_order_now.where('total > ?', params['total']).as_json.map do |order|
          order.merge(customer: Customer.find(order['customer_id']).as_json)
        end
        render json: @daily
      elsif params['lessthan'] == 'true'
        @daily = Order.get_order_now.where('total < ?', params['total']).as_json.map do |order|
          order.merge(customer: Customer.find(order['customer_id']).as_json)
        end
        render json: @daily
      else
        @daily = Order.get_order_now.where(total: params['total']).as_json.map do |order|
          order.merge(customer: Customer.find(order['customer_id']).as_json)
        end
        render json: @daily
      end
    else
      validation_error('Request total not found')
    end
  end

  def byRangeDate
    if params['start'].present? && params['end'].present?
      @daily = Order.get_order_by_range_date(params['start'], params['end']).as_json.map do |order|
        order.merge(customer: Customer.find(order['customer_id']).as_json)
      end
      render json: @daily
    else
      validation_error('Request start_date and end_date not found')
    end
  end
end
