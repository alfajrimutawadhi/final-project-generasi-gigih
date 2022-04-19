# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :item_categories
  has_many :categories, through: :item_categories
end
