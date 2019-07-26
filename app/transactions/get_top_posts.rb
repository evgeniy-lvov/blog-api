# frozen_string_literal: true

require 'dry-transaction'

class GetTopPosts
  include Dry::Transaction

  step :validate
  step :get

  def validate(input)
    contract = GetTopPostsContract.new
    result = contract.call(input)
    if result.success?
      Success(input)
    else
      Failure(result.errors.to_h)
    end
  end

  def get(input)
    posts = Post.order(rating: :desc).limit(input[:n])
    Success(posts)
  end
end
