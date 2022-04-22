# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do # rubocop:disable Metrics/BlockLength
  subject(:item) { FactoryBot.build(:item) }

  describe 'validations' do # rubocop:disable Metrics/BlockLength
    it 'is invalid without a name' do
      item.name = nil
      expect(item).to_not be_valid
    end

    it 'is invalid without a price' do
      item.price = nil
      expect(item).to_not be_valid
    end

    it 'is valid without a description' do
      item.description = nil
      expect(item).to be_valid
    end

    it 'is invalid with duplicate name' do
      item1 = Item.create(name: 'Nasi Goreng', description: 'Nasi goreng yang enak', price: 10_000) # rubocop:disable Lint/UselessAssignment
      item2 = Item.new(name: 'Nasi Goreng', description: 'Nasi goreng yang enak', price: 10_000)
      expect(item2).to_not be_valid
    end

    it 'is invalid with a price less than 0.01' do
      item.price = 0
      expect(item).to_not be_valid
    end

    it 'is invalid with a description longer than 150 characters' do
      item.description = 'a' * 151
      expect(item).to_not be_valid
    end

    it 'is valid with item have category' do
      item = Item.create(name: 'Ice Cream', description: 'Ice cream yang enak', price: 10_000)
      category = Category.create(name: 'Dissert')
      ItemCategory.create(item_id: item.id, category_id: category.id)
      check_category = Item.get_category_by_id(item.id).count > 0
      expect(check_category).to be true
    end

    it 'is invalid with item have not category' do
      item = Item.create(name: 'Nasi Goreng', description: 'Nasi goreng yang enak', price: 10_000)
      category = Category.create(name: 'Main Dish')
      ItemCategory.create(item_id: 9_999_999, category_id: category.id)
      check_category = Item.get_category_by_id(item.id).count > 0
      expect(check_category).to be false
    end
  end

  describe 'self#get_category_by_id' do
    it 'returns the category of the item' do
      item = Item.create(name: 'Nasi Goreng', description: 'Nasi goreng yang enak', price: 10_000)
      category = Category.create(name: 'Traditional')
      ItemCategory.create(item_id: item.id, category_id: category.id)
      get_category_by_id = Item.get_category_by_id(item.id)
      expect(get_category_by_id.count).to eq 1
    end
  end
end
