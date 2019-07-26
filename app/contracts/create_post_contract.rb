# frozen_string_literal: true

class CreatePostContract < Dry::Validation::Contract
  IP_ADDRESS_REGEX = /^((?:(?:^|\.)(?:\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])){4})$/.freeze

  params do
    required(:username).filled(:string)
    required(:title).filled(:string)
    required(:content).filled(:string)
    required(:user_ip).value(:string)
  end

  rule(:user_ip) do
    key.failure('wrong format of user_ip') if IP_ADDRESS_REGEX.match(value).nil?
  end
end
