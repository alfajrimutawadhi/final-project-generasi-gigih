# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :item_has_categories
  has_many :items, through: :item_has_categories

  validates :name, presence: true, uniqueness: true
end
