# frozen_string_literal: true

class Item < ApplicationRecord # rubocop:disable Style/Documentation
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :item_categories
  has_many :categories, through: :item_categories

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :description, length: { maximum: 150 }

  def self.get_category_by_id(id)
    get_index_category = joins(:item_categories).where(item_categories: { item_id: id }).pluck(:category_id)
    Category.where(id: get_index_category)
  end
end
