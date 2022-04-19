# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  before :each do
    @item = FactoryBot.create(:item, description: 'Special Food')
    @category = FactoryBot.create(:category)
  end
  subject(:item_category) { FactoryBot.build(:item_category) }

  describe 'validations' do
    it 'is valid with attributes' do
      expect(item_category).to be_valid
    end
  end
end
