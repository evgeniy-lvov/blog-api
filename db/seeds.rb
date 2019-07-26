# frozen_string_literal: true

POSTS_NUMBER = 200_000
USERS_NUMBER = 100
IP_ADDRESSES_NUMBER = 50

usernames = []
ip_addresses = []
USERS_NUMBER.times { usernames << Faker::Internet.unique.user_name }
IP_ADDRESSES_NUMBER.times { ip_addresses << Faker::Internet.unique.ip_v4_address }

usernames_with_ips = usernames.map { |username| { username: username, user_ip: ip_addresses.sample(rand(1..5)) } }

POSTS_NUMBER.times do |i|
  user = usernames_with_ips.sample

  username = user[:username]
  user_ip = user[:user_ip].sample

  title = Faker::Lorem.sentence
  content = Faker::Lorem.paragraphs(5).join('\n')
  result_post = nil

  transaction = CreatePost.new
  transaction.call(username: username, title: title, content: content, user_ip: user_ip) do |result|
    result.success do |post|
      result_post = post
    end
    result.failure do
      exit
    end
  end
  puts "==========#{i} posts created=========="

  next unless rand(100).zero?

  post_id = result_post.id
  post_instance = Post.find(post_id)

  rand(1..50).times do
    value = rand(1..5)
    rate_transaction = RatePost.new
    rate_transaction.call(post_id: post_instance.id, value: value)
    puts "#####Post id: #{post_instance.id} rated#####"
  end
end
