# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  subject(:order) { FactoryBot.build(:order) }

  describe 'validations' do
    it 'is valid with attributes' do
      customer = FactoryBot.create(:customer)
      order = FactoryBot.build(:order, customer_id: customer.id)
      expect(order).to be_valid
    end

    it 'is invalid without a customer' do
      order.customer_id = nil
      expect(order).to_not be_valid
    end

    it 'is invalid without a status' do
      order.status = nil
      expect(order).to_not be_valid
    end

    it 'is invalid without a total' do
      order.total = nil
      expect(order).to_not be_valid
    end
  end
end
