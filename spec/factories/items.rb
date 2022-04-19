# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Number.decimal }
  end
end
