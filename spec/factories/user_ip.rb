# frozen_string_literal: true

FactoryBot.define do
  factory :user_ip do
    ip { Faker::Internet.unique.ip_v4_address }
  end
end
