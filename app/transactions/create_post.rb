# frozen_string_literal: true

require 'dry-transaction'

class CreatePost
  include Dry::Transaction

  step :validate
  step :persist

  def validate(input)
    contract = CreatePostContract.new
    result = contract.call(input)
    if result.success?
      Success(input)
    else
      Failure(result.errors.to_h)
    end
  end

  def persist(input)
    user = User.find_or_create_by(username: input[:username])
    user_ip = UserIp.find_or_create_by(ip: input[:user_ip])
    post = Post.create(user: user,
                       title: input[:title],
                       content: input[:content],
                       user_ip: user_ip)
    Success(post)
  end
end
