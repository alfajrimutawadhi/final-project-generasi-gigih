# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  subject(:category) { FactoryBot.build(:category) }

  describe 'validations' do
    it 'is invalid without a name' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'is valid with a name' do
      category.name = 'Main Dish'
      expect(category).to be_valid
    end

    it 'is invalid with duplicate name' do
      category1 = Category.create(name: 'Main Dish') # rubocop:disable Lint/UselessAssignment
      category2 = Category.new(name: 'Main Dish')
      expect(category2).to_not be_valid
    end
  end
end
