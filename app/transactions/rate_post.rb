# frozen_string_literal: true

require 'dry-transaction'

class RatePost
  include Dry::Transaction

  step :validate
  step :rate_create
  step :update_post_rating

  def validate(input)
    contract = RatePostContract.new
    result = contract.call(input)
    if result.success?
      Success(input)
    else
      Failure(result.errors.to_h)
    end
  end

  def rate_create(input)
    post = Post.find_by(id: input[:post_id])
    if post
      Rate.create(value: input[:value], post: post)
      Success(post)
    else
      Failure(post_id: ['post id is not found'])
    end
  end

  def update_post_rating(input)
    post = input
    post.lock!
    rating = Rate.where(post: post).average(:value)
    post.update(rating: rating)
    Success(post)
  end
end
