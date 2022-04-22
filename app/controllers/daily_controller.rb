class DailyController < ApplicationController
  def index
    @daily = Order.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).as_json.map do |order|
      order.merge(customer: Customer.find(order['customer_id']).as_json)
    end
    render json: @daily
  end

  def byEmail
    if params['email'].present?
      customer = Customer.find_by(email: params['email'])
      if customer.present?
        @daily = Order.where(customer_id: customer.id, created_at: Date.today.beginning_of_day..Date.today.end_of_day).as_json.map do |order|
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
  end

  def byRangeDate
  end
end
