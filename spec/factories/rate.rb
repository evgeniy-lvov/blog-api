# frozen_string_literal: true

FactoryBot.define do
  factory :rate do
    value { rand(1...5).to_f }
  end
end
