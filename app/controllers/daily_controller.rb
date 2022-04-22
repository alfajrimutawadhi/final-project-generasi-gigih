class DailyController < ApplicationController
  def index
    @daily = Order.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).as_json.map do |order|
      order.merge(customer: Customer.find(order['customer_id']).as_json)
    end
    render json: @daily
  end

  def byCustomer
    
  end

  def byTotal
  end

  def byRangeDate
  end
end
