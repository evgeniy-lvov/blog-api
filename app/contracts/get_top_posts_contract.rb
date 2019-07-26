# frozen_string_literal: true

class GetTopPostsContract < Dry::Validation::Contract
  params do
    required(:n).value(:integer)
  end

  rule(:n) do
    key.failure('n parameter must be not negative') if value.negative?
  end
end
