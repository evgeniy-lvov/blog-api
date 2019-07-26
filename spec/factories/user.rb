# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.user_name }
  end
end
