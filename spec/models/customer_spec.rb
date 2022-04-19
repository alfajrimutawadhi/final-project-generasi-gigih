# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject(:customer) { FactoryBot.build(:customer) }

  describe 'validations' do
    it 'is valid with attributes' do
      expect(customer).to be_valid
    end

    it 'is invalid without a name' do
      customer.name = nil
      expect(customer).to_not be_valid
    end

    it 'is valid with a name' do
      customer.name = 'Fajri'
      expect(customer).to be_valid
    end

    it 'is invalid with email without format @gmail.com' do
      customer.email = 'fajri@gmail'
      expect(customer).to_not be_valid
    end

    it 'is invalid with duplicate email' do
      customer1 = Customer.create(name: 'Fajri', email: 'fajri@gmail.com') # rubocop:disable Lint/UselessAssignment
      customer2 = Customer.new(name: 'Fajri', email: 'fajri@gmail.com')
      expect(customer2).to_not be_valid
    end
  end
end
