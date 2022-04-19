# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :item_categories
  has_many :categories, through: :item_categories

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :description, length: { maximum: 150 }
end
