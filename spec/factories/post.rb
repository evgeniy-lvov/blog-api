# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraphs(number: 5).join('\n') }
    rating { rand(1...5).to_f }
  end
end
