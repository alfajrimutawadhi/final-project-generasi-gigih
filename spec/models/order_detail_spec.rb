# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  before :each do
    @item = FactoryBot.create(:item, description: 'Special Food')
    @customer = FactoryBot.create(:customer)
    @order = FactoryBot.create(:order, customer_id: @customer.id)
  end
  subject(:order_detail) { FactoryBot.build(:order_detail) }

  describe 'validations' do
    it 'is valid with attributes' do
      expect(order_detail).to be_valid
    end
  end
end
