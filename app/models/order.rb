# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details

  def self.get_order_now
    where(created_at: Date.today.beginning_of_day..Date.today.end_of_day).order(created_at: :asc)
  end

  def self.get_order_by_range_date(start_date, end_date)
    where(created_at: start_date..end_date).order(created_at: :asc)
  end

  def self.change_status_be_canceled
    where.not(status: "PAID").and(Order.where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)).update_all(status: "CANCELED")
  end
end
