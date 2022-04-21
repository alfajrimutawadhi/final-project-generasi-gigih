# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details

  def self.change_status_be_canceled
    where.not(status: "PAID").update_all(status: "CANCELED")
  end
end
