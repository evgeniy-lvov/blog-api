# frozen_string_literal: true

class RatePostContract < Dry::Validation::Contract
  params do
    required(:post_id).filled(:integer)
    required(:value).value(:integer)
  end

  rule(:value) do
    key.failure('value must be integer in 1...5 range') unless value >= 1 && value <= 5
  end
end
