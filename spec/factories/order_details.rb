# frozen_string_literal: true

FactoryBot.define do
  factory :order_detail do
    quantity { 1 }
    item_price { 1.5 }
    order_id { 1 }
    item_id { 1 }
  end
end
